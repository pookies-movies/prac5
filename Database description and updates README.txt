Database Description: PA 5

Tables Overview:

Actor: Stores information about actors appearing in movies and series.
Crew: Contains data on crew members involved in the production of movies and series.
Movies: Holds details about individual movies.
Movie_Actor: Links movies to actors, representing the relationships between them.
Movie_Reviews: Stores user reviews for movies.
Series: Contains information about TV series.
Series_Actor: Links series to actors, representing the relationships between them.
Series_Reviews: Stores user reviews for TV series.
Series_Season: Represents seasons within TV series.
User: Stores user information for the website.
Description of Key Tables:

Actor: This table contains records of actors, including their names, biographical details, and any other relevant information.
Crew: Stores data about crew members involved in the production of movies and series, such as directors, producers, and writers.
Movies: Contains comprehensive details about individual movies, including titles, release dates, genres, and other pertinent information. This table serves as a central repository for movie-related data.
Movie_Actor: Represents the many-to-many relationship between movies and actors. It links movies to the actors who appear in them, facilitating efficient querying and analysis of cast information.
User: This table stores user information for the website, including usernames, passwords, and any additional profile details. It enables user authentication and personalized experiences on the platform.
Updates:
The database receives weekly updates to ensure that it remains current and reflects the latest information about movies, series, actors, crew members, and user interactions. These updates may include additions, modifications, or deletions of records based on new releases, user feedback, or other relevant factors.