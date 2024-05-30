<?php
    session_start();
    require 'pookies_config.php';

    class API{
        private static $instance;
        private $dataBase;

        private function __construct($db){
            $this->dataBase = $db;
        }

        public static function getInstance($db){
            if (!isset(self::$instance)){
                self::$instance = new API($db);
            }
            
            return self::$instance;
        }

        public function login($data){
            $email = $data['email'];
            $password = $data['password'];

            $result = $this->dataBase->query("SELECT * FROM User WHERE Email='$email'");

            if ($result->num_rows === 0) {
                return $this->response("error", "User does not exist", 400);
            }

            $userData = $result->fetch_assoc();
            $dbHashedPassword = $userData['password'];
            
            if (password_verify($password, $dbHashedPassword)){
                $apiKeyResult = $this->dataBase->query("SELECT api_key FROM User WHERE Email='$email'");
                $apiKey = $apiKeyResult->fetch_assoc()['api_key'];
                $_SESSION['API_KEY'] = $apiKey;
                return $this->response("success", "Logged In", 200, array("apikey" => $apiKey));
            } 
            
            else{
                return $this->response("error", "Incorrect password", 400);
            }
        }

        public function register($data){
            if (!isset($data['name']) || $data['name'] == "" || !isset($data['surname']) || $data['surname'] == "" || !isset($data['email']) || $data['email'] == "" || !isset($data['password']) || $data['password'] == "" || !isset($data['genre']) || $data['genre'] == ""){
                return $this->response("error", "Missing fields", 400);
            }

            if (!preg_match("/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$/", $data['email'])){
                return $this->response("error", "Invalid email format", 400);
            }

            if (!preg_match("/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/", $data['password'])){
                return $this->response("error", "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one symbol", 400);
            }

            $email = $data['email'];
            $result = $this->dataBase->query("SELECT * FROM User WHERE Email='$email'");

            if ($result->num_rows > 0){
                return $this->response("error", "User already exists", 400);
            }

            //$salt = $this->generateSalt();
            $password = $this->hashingFunction($data['password']);

            $apiKey = $this->generateAPI();

            $name = $data['name'];
            $surname = $data['surname'];  
            $genre = $data['genre'];        
            
            $stmt = $this->dataBase->prepare("INSERT INTO User (Email, Firstname, Lastname, password, pref_genre, api_key) VALUES (?, ?, ?, ?, ?, ?)");
            
            if (!$stmt){
                return $this->response("error", "Failed to prepare SQL statement: " . $this->dataBase->error, 500);
            }

            $stmt->bind_param("ssssss", $email, $name, $surname, $password, $genre, $apiKey);

            if ($stmt->execute()){
                return $this->response("success", "User registered successfully", 200, array("apikey" => $apiKey));
            } 

            if (!$stmt->execute()) {
                // Handle error, e.g., log it or return an error response
                return $this->response("error", "Failed to execute SQL statement: " . $stmt->error, 500);
            }
            
            else{
                return $this->response("error", "Failed to register user", 500);
            }

        }

        public function hashingFunction($password){
            return password_hash($password, PASSWORD_DEFAULT);
        }

        /*public function generateSalt(){
            return substr(str_shuffle('0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'), 0, 15);
        }*/

        private function generateAPI(){
            return substr(str_shuffle('0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'), 0, 20);
        }

        public function response($status, $message, $code, $data = null){
            header("Content-Type: application/json");
            http_response_code($code);
            $timestamp = (string) time();
            $response = array(
                "status" => $status,
                "message" => $message,
                "timestamp" => $timestamp,
                "data" => $data
            );
            return json_encode($response);
        }

        public function getAllMovies($data){
            if (!isset($data['apikey']) || !isset($data['type'])){
                return $this->response("error", "Post parameters are missing", 400);
            }
            
            $apiKey = $data['apikey'];

            if (isset($data['recommend'])){
                $result = $this->dataBase->query("SELECT pref_genre FROM User WHERE api_key='$apiKey'");

                if ($result->num_rows == 0){
                    return $this->response("error", "User has no preferred genre.", 401);
                }

                if ($result) {
                    $row = $result->fetch_assoc();

                    if ($row) {
                        $genre = $row['pref_genre'];
                    } 
                    
                    else {

                        $pref_genre = 'default_value';
                    }
                
                    $result->free();
                } 
                
                else {
                    $pref_genre = 'default_value';
                }

                $sql = "SELECT * FROM Movies WHERE Genre=?";

                $stmt = $this->dataBase->prepare($sql);

                if (!$stmt) {
                    // Handle prepare error
                    $errorMessage = $this->dataBase->error;
                    return $this->response("error", "Failed to prepare statement: $errorMessage", 500);
                }

                // Bind the search value
                $stmt->bind_param("s", $genre);

                // Execute the statement
                $result = $stmt->execute();

                if (!$result) {
                    // Handle execution error
                    $errorMessage = $stmt->error;
                    return $this->response("error", "Failed to execute statement: $errorMessage", 500);
                }

                // Get the result set
                $listingResult = $stmt->get_result();

                if (!$listingResult) {
                    // Handle get result error
                    $errorMessage = $stmt->error;
                    return $this->response("error", "Failed to get result: $errorMessage", 500);
                }

                // Fetch data from the result set
                $movies = [];
                while ($row = $listingResult->fetch_assoc()) {
                    $movies[] = $row;
                }

                // Close the statement
                $stmt->close();

                // Return success response with the fetched movies
                return $this->response("success", "Listings retrieved successfully", 200, $movies);
            }

            $sql = "SELECT *";

            $sql .= " FROM Movies";

            if (isset($data['search'])){
                //$sql = "SELECT * FROM Movies WHERE Title LIKE ?";
                if (isset($data['fuzzy']) && $data['fuzzy'] == true) {
                    $searchVal = "%{$data['search']}%";
                } else {
                    $searchVal = $data['search'];
                }

                $sql .= " WHERE Title LIKE ?";

                // Prepare the statement
                $stmt = $this->dataBase->prepare($sql);

                if (!$stmt) {
                    // Handle prepare error
                    $errorMessage = $this->dataBase->error;
                    return $this->response("error", "Failed to prepare statement: $errorMessage", 500);
                }

                // Bind the search value
                $stmt->bind_param("s", $searchVal);

                // Execute the statement
                $result = $stmt->execute();

                if (!$result) {
                    // Handle execution error
                    $errorMessage = $stmt->error;
                    return $this->response("error", "Failed to execute statement: $errorMessage", 500);
                }

                // Get the result set
                $listingResult = $stmt->get_result();

                if (!$listingResult) {
                    // Handle get result error
                    $errorMessage = $stmt->error;
                    return $this->response("error", "Failed to get result: $errorMessage", 500);
                }

                // Fetch data from the result set
                $movies = [];
                while ($row = $listingResult->fetch_assoc()) {
                    $movies[] = $row;
                }

                // Close the statement
                $stmt->close();

                // Return success response with the fetched movies
                return $this->response("success", "Listings retrieved successfully", 200, $movies);


            }

            if (isset($data['id'])){
                //$sql = "SELECT * FROM Movies WHERE Title LIKE ?";
                $searchVal = $data['id'];

                $sql .= " WHERE MovieID=?";

                // Prepare the statement
                $stmt = $this->dataBase->prepare($sql);

                if (!$stmt) {
                    // Handle prepare error
                    $errorMessage = $this->dataBase->error;
                    return $this->response("error", "Failed to prepare statement: $errorMessage", 500);
                }

                // Bind the id value
                $stmt->bind_param("i", $searchVal);

                // Execute the statement
                $result = $stmt->execute();

                if (!$result) {
                    // Handle execution error
                    $errorMessage = $stmt->error;
                    return $this->response("error", "Failed to execute statement: $errorMessage", 500);
                }

                // Get the result set
                $listingResult = $stmt->get_result();

                if (!$listingResult) {
                    // Handle get result error
                    $errorMessage = $stmt->error;
                    return $this->response("error", "Failed to get result: $errorMessage", 500);
                }

                // Fetch data from the result set
                $movies = [];
                while ($row = $listingResult->fetch_assoc()) {
                    $movies[] = $row;
                }

                // Close the statement
                $stmt->close();

                // Return success response with the fetched movies
                return $this->response("success", "Listings retrieved successfully", 200, $movies);
            }

            if (isset($data['sort']) && in_array($data['sort'], ['Rating', 'ReleaseYear'])){
                $sql .= " ORDER BY {$data['sort']}";

                if (isset($data['order']) && in_array($data['order'], ['ASC', 'DESC'])) {
                    $sql .= " {$data['order']}";
                }
            }

            if (isset($data['limit']) && is_numeric($data['limit'])){
                $sql .= " LIMIT " . intval($data['limit']);
            }

            $listingResult = $this->dataBase->query($sql);

            if (!$listingResult){
                return $this->response("error", "Failed to fetch listings", 500);
            }

            $row = $listingResult->fetch_assoc();

            $movies = [];
            while ($row = $listingResult->fetch_assoc()) {
                $movies[] = $row;
            }

            return $this->response("success", "Listings retrieved successfully", 200, $movies);
        }

        private function getImages($id){
            $ch = curl_init();

            curl_setopt($ch, CURLOPT_URL, "https://wheatley.cs.up.ac.za/api/getimage?listing_id=$id");
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

            $result = curl_exec($ch);

            if (curl_errno($ch)) {
                curl_close($ch);
                return [];
            }

            curl_close($ch);
    
            $data = json_decode($result, true);
            $images = $data['data'];
            
            return $images;
        }

        public function getAllSeries($data){
            if (!isset($data['apikey']) || !isset($data['type'])){
                return $this->response("error", "Post parameters are missing", 400);
            }
            
            $apiKey = $data['apikey'];

            if (isset($data['search'])){
                if (isset($data['search'])){
                    $sql = "SELECT * FROM Series ";
                    if (isset($data['fuzzy']) && $data['fuzzy'] == true) {
                        $searchVal = "%{$data['search']}%";
                    } else {
                        $searchVal = $data['search'];
                    }
    
                    $sql .= " WHERE Title LIKE ?";
    
                    // Prepare the statement
                    $stmt = $this->dataBase->prepare($sql);
    
                    if (!$stmt) {
                        // Handle prepare error
                        $errorMessage = $this->dataBase->error;
                        return $this->response("error", "Failed to prepare statement: $errorMessage", 500);
                    }
    
                    // Bind the search value
                    $stmt->bind_param("s", $searchVal);
    
                    // Execute the statement
                    $result = $stmt->execute();
    
                    if (!$result) {
                        // Handle execution error
                        $errorMessage = $stmt->error;
                        return $this->response("error", "Failed to execute statement: $errorMessage", 500);
                    }
    
                    // Get the result set
                    $listingResult = $stmt->get_result();
    
                    if (!$listingResult) {
                        // Handle get result error
                        $errorMessage = $stmt->error;
                        return $this->response("error", "Failed to get result: $errorMessage", 500);
                    }
    
                    // Fetch data from the result set
                    $series = [];
                    while ($row = $listingResult->fetch_assoc()) {
                        $series[] = $row;
                    }
    
                    // Close the statement
                    $stmt->close();
    
                    // Return success response with the fetched movies
                    return $this->response("success", "Searched series retrieved successfully", 200, $series);
                }
            }

            if (isset($data['recommend'])){
                $result = $this->dataBase->query("SELECT pref_genre FROM User WHERE api_key='$apiKey'");

                if ($result->num_rows == 0){
                    return $this->response("error", "User has no preferred genre.", 401);
                }

                if ($result) {
                    $row = $result->fetch_assoc();

                    if ($row) {
                        $genre = $row['pref_genre'];
                    } 
                    
                    else {

                        $pref_genre = 'default_value';
                    }
                
                    $result->free();
                } 
                
                else {
                    $pref_genre = 'default_value';
                }

                $sql = "SELECT * FROM Series WHERE Genre=?";

                $stmt = $this->dataBase->prepare($sql);

                if (!$stmt) {
                    // Handle prepare error
                    $errorMessage = $this->dataBase->error;
                    return $this->response("error", "Failed to prepare statement: $errorMessage", 500);
                }

                // Bind the search value
                $stmt->bind_param("s", $genre);

                // Execute the statement
                $result = $stmt->execute();

                if (!$result) {
                    // Handle execution error
                    $errorMessage = $stmt->error;
                    return $this->response("error", "Failed to execute statement: $errorMessage", 500);
                }

                // Get the result set
                $listingResult = $stmt->get_result();

                if (!$listingResult) {
                    // Handle get result error
                    $errorMessage = $stmt->error;
                    return $this->response("error", "Failed to get result: $errorMessage", 500);
                }

                // Fetch data from the result set
                $series = [];
                while ($row = $listingResult->fetch_assoc()) {
                    $series[] = $row;
                }

                // Close the statement
                $stmt->close();

                // Return success response with the fetched series
                return $this->response("success", "Listings retrieved successfully", 200, $series);
            }

            if (isset($data['id'])){
                $sql = "SELECT * FROM Series ";
                $searchVal = $data['id'];

                $sql .= " WHERE SeriesID=?";

                // Prepare the statement
                $stmt = $this->dataBase->prepare($sql);

                if (!$stmt) {
                    // Handle prepare error
                    $errorMessage = $this->dataBase->error;
                    return $this->response("error", "Failed to prepare statement: $errorMessage", 500);
                }

                // Bind the id value
                $stmt->bind_param("i", $searchVal);

                // Execute the statement
                $result = $stmt->execute();

                if (!$result) {
                    // Handle execution error
                    $errorMessage = $stmt->error;
                    return $this->response("error", "Failed to execute statement: $errorMessage", 500);
                }

                // Get the result set
                $listingResult = $stmt->get_result();

                if (!$listingResult) {
                    // Handle get result error
                    $errorMessage = $stmt->error;
                    return $this->response("error", "Failed to get result: $errorMessage", 500);
                }

                // Fetch data from the result set
                $movies = [];
                while ($row = $listingResult->fetch_assoc()) {
                    $movies[] = $row;
                }

                // Close the statement
                $stmt->close();

                // Return success response with the fetched movies
                return $this->response("success", "Listings retrieved successfully", 200, $movies);
            }

            $sql = "SELECT *";

            $sql .= " FROM Series";

            if (isset($data['sort']) && in_array($data['sort'], ['Rating', 'ReleaseYear'])){
                $sql .= " ORDER BY {$data['sort']}";

                if (isset($data['order']) && in_array($data['order'], ['ASC', 'DESC'])) {
                    $sql .= " {$data['order']}";
                }
            }

            if (isset($data['limit']) && is_numeric($data['limit'])){
                $sql .= " LIMIT " . intval($data['limit']);
            }

            $listingResult = $this->dataBase->query($sql);

            if (!$listingResult){
                return $this->response("error", "Failed to fetch listings", 500);
            }

            $row = $listingResult->fetch_assoc();

            $series = [];
            while ($row = $listingResult->fetch_assoc()) {
                $series[] = $row;
            }

            return $this->response("success", "Listings retrieved successfully", 200, $series);
        }

        //===================================================================================addMovie==================================================
        public function addMovie($data) {
            if (!isset($data['api_key']) || !isset($data['Title']) || !isset($data['Rating']) || !isset($data['Runtime']) || !isset($data['AgeRating']) || !isset($data['ReleaseYear']) || !isset($data['CrewID']) || !isset($data['Genre']) || !isset($data['Image']) || !isset($data['Description'])) {
                return $this->response("error", "Missing fields", 400);
            }
            
            $api_key = $data['api_key'];
            $result = $this->dataBase->query("SELECT * FROM User WHERE api_key='$api_key'");
        
            if ($result->num_rows == 0) {
                return $this->response("error", "Invalid UserID", 401);
            }
        
            $stmt = $this->dataBase->prepare("INSERT INTO Movies (Title, Rating, Runtime, AgeRating, Genre, CrewID, ReleaseYear, Image, Description, Director) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("sdsssiisss", $data['Title'], $data['Rating'], $data['Runtime'], $data['AgeRating'], $data['Genre'], $data['CrewID'], $data['ReleaseYear'], $data['Image'], $data['Description'], $data['Director']);
        
            if (!$stmt->execute()) {
                return $this->response("error", "Failed to add movie: " . $stmt->error, 500);
            }
        
            return $this->response("success", "Movie added successfully", 200);
        }
        //===================================================edit movie================================================================================
        public function editMovie($data) {
            if (!isset($data['api_key']) || !isset($data['MovieID'])) {
                return $this->response("error", "Missing fields", 400);
            }
        
            $api_key = $data['api_key'];
            $result = $this->dataBase->query("SELECT * FROM User WHERE api_key='$api_key'");
        
            if ($result->num_rows == 0) {
                return $this->response("error", "Invalid UserID", 401);
            }
        
            $updates = [];
            $params = [];
            $types = '';
        
            foreach (['Title', 'Rating', 'Runtime', 'AgeRating', 'Genre', 'CrewID', 'ReleaseYear', 'Image', 'Description', 'Director'] as $field) {
                if (isset($data[$field])) {
                    $updates[] = "$field = ?";
                    $params[] = $data[$field];
                    $types .= is_numeric($data[$field]) ? 'd' : 's';
                }
            }
        
            if (empty($updates)) {
                return $this->response("error", "No fields to update", 400);
            }
        
            $params[] = $data['MovieID'];
            $types .= 'i';
            $stmt = $this->dataBase->prepare("UPDATE Movies SET " . implode(', ', $updates) . " WHERE MovieID = ?");
            $stmt->bind_param($types, ...$params);
        
            if (!$stmt->execute()) {
                return $this->response("error", "Failed to update movie: " . $stmt->error, 500);
            }
        
            return $this->response("success", "Movie updated successfully", 200);
        }
        //===================================================================================delete movie==========================================================
        public function deleteMovie($data) {
            if (!isset($data['api_key']) || !isset($data['MovieID'])) {
                return $this->response("error", "Missing fields", 400);
            }
            $api_key = $data['api_key'];
            $result = $this->dataBase->query("SELECT * FROM User WHERE api_key='$api_key'");
        
            if ($result->num_rows == 0) {
                return $this->response("error", "Invalid UserID", 401);
            }
        
            $stmt = $this->dataBase->prepare("DELETE FROM Movies WHERE MovieID = ?");
            $stmt->bind_param("i", $data['MovieID']);
        
            if (!$stmt->execute()) {
                return $this->response("error", "Failed to delete movie: " . $stmt->error, 500);
            }
        
            return $this->response("success", "Movie deleted successfully", 200);
        }
        //========================================================================add series===============================================================
        public function addSeries($data) {
            if (!isset($data['api_key']) || !isset($data['Title']) || !isset($data['ReleaseYear']) || !isset($data['AgeRating']) || !isset($data['Rating'])) {
                return $this->response("error", "Missing fields", 400);
            }
        
            $api_key = $data['api_key'];
            $result = $this->dataBase->query("SELECT * FROM User WHERE api_key='$api_key'");
        
            if ($result->num_rows == 0) {
                return $this->response("error", "Invalid UserID", 401);
            }
        
            $stmt = $this->dataBase->prepare("INSERT INTO Series (Title, CrewID, ReleaseYear, AgeRating, Rating) VALUES (?, ?, ?, ?, ?)");
            $stmt->bind_param("sisis", $data['Title'], $data['CrewID'], $data['ReleaseYear'], $data['AgeRating'], $data['Rating']);
        
            if (!$stmt->execute()) {
                return $this->response("error", "Failed to add series: " . $stmt->error, 500);
            }
        
            return $this->response("success", "Series added successfully", 200);
        }
        //=====================================================================edit series==================================================================
        public function editSeries($data) {
            if (!isset($data['api_key']) || !isset($data['SeriesID'])) {
                return $this->response("error", "Missing fields", 400);
            }
            $api_key = $data['api_key'];
            $result = $this->dataBase->query("SELECT * FROM User WHERE api_key='$api_key'");
        
            if ($result->num_rows == 0) {
                return $this->response("error", "Invalid UserID", 401);
            }
        
            $updates = [];
            $params = [];
            $types = '';
        
            foreach (['Title', 'CrewID', 'ReleaseYear', 'AgeRating', 'Rating'] as $field) {
                if (isset($data[$field])) {
                    $updates[] = "$field = ?";
                    $params[] = $data[$field];
                    $types .= is_numeric($data[$field]) ? 'd' : 's';
                }
            }
        
            if (empty($updates)) {
                return $this->response("error", "No fields to update", 400);
            }
        
            $params[] = $data['SeriesID'];
            $types .= 'i';
            $stmt = $this->dataBase->prepare("UPDATE Series SET " . implode(', ', $updates) . " WHERE SeriesID = ?");
            $stmt->bind_param($types, ...$params);
        
            if (!$stmt->execute()) {
                return $this->response("error", "Failed to update series: " . $stmt->error, 500);
            }
        
            return $this->response("success", "Series updated successfully", 200);
        }
        //==========================================================================delete series========================================================
        public function deleteSeries($data) {
            if (!isset($data['api_key']) || !isset($data['SeriesID'])) {
                return $this->response("error", "Missing fields", 400);
            }
        
            $api_key = $data['api_key'];
            $result = $this->dataBase->query("SELECT * FROM User WHERE api_key='$api_key'");
        
            if ($result->num_rows == 0) {
                return $this->response("error", "Invalid UserID", 401);
            }
        
            $stmt = $this->dataBase->prepare("DELETE FROM Series WHERE SeriesID = ?");
            $stmt->bind_param("i", $data['SeriesID']);
        
            if (!$stmt->execute()) {
                return $this->response("error", "Failed to delete series: " . $stmt->error, 500);
            }
        
            return $this->response("success", "Series deleted successfully", 200);
        }
    }

    $api = API::getInstance($conn);
    if ($_SERVER["REQUEST_METHOD"] == "POST"){
        $postData = json_decode(file_get_contents('php://input'), true);
        
        if (!isset($postData['type'])){
            echo $api->response("error", "Post parameters are missing", 400);
        } 
        
        else{
            switch ($postData['type']){
                case 'Register':
                    echo $api->register($postData);
                    break;

                case 'Login':
                    echo $api->login($postData);
                    break;

                case 'GetAllMovies':
                    echo $api->getAllMovies($postData);
                    break;

                case 'GetAllSeries':
                    echo $api->getAllSeries($postData);
                    break;

                case 'AddMovie':
                    echo $api->addMovie($postData);
                    break;

                case 'UpdateMovie':
                    echo $api->editMovie($postData);
                    break;

                case 'DeleteMovie':
                    echo $api->deleteMovie($postData);
                    break;

                default:
                    echo $api->response("error", "Invalid type parameter", 400);
            }
        }
    } 
    
    else{
        echo $api->response("error", "Invalid request method", 405);
    }