<?php
    $conn = mysqli_connect('wheatley.cs.up.ac.za', 'u23681978', 'Z2FDZ5G66O4IOAHHL3FCXNWXGIL74NSO', 'u23681978_Hoop_Data');

    if (!$conn){
        die('Connection error: ' . mysqli_connect_error());
    }

    //mysqli_close($conn);