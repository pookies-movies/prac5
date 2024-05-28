-- phpMyAdmin SQL Dump
-- version 5.0.4deb2~bpo10+1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 28, 2024 at 11:59 PM
-- Server version: 10.3.39-MariaDB-0+deb10u2
-- PHP Version: 7.3.31-1~deb10u6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u23681978_Hoop_Data`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`u23681978`@`%` PROCEDURE `InsertMovieActor` ()  BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < 90 DO
        INSERT INTO Movie_Actor (MovieID, ActorID)
        SELECT FLOOR(RAND() * 23) + 1, FLOOR(RAND() * 25) + 1;
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Actor`
--

CREATE TABLE `Actor` (
  `Firstname` varchar(50) NOT NULL,
  `ActorID` int(11) NOT NULL,
  `Lastname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Actor`
--

INSERT INTO `Actor` (`Firstname`, `ActorID`, `Lastname`) VALUES
('Emily', 1, 'Blunt'),
('Chris', 2, 'Hemsworth'),
('Dwayne', 3, 'Johnson'),
('Gerard', 4, 'Butler'),
('Shia', 5, 'LaBeouf'),
('Margo', 6, 'Robbie'),
('Ryan', 7, 'Reynolds'),
('Tom', 8, 'Holland'),
('Leonardo', 9, 'DiCaprio'),
('Denzel', 10, 'Washington'),
('Tom', 11, 'Hanks'),
('Robert', 12, 'De Niro'),
('Tom', 13, 'Cruise'),
('Jack', 14, 'Nicholson'),
('Morgan', 15, 'Freeman'),
('Al', 16, 'Pacino'),
('Will', 17, 'Smith'),
('Johnny', 18, 'Depp'),
('Harrison', 19, 'Ford'),
('Dustin', 20, 'Hoffman'),
('Marlon', 21, 'Brando'),
('Don', 22, 'Cheadle'),
('Samuel L.', 23, 'Jackson'),
('Angela', 24, 'Bassett'),
('Robert', 25, 'Downey Jr.'),
('Anthony', 26, 'Hopkins'),
('Regina', 27, 'King'),
('Brad', 28, 'Pitt'),
('Daniel', 29, 'Day-Lewis'),
('Joaquin', 30, 'Phoenix'),
('Heath', 31, 'Ledger'),
('Matt', 32, 'Damon'),
('Viola', 33, 'Davis'),
('Jennifer', 34, 'Lawrence'),
('Kevin', 35, 'Spacey'),
('Benedict', 44, 'Cumberbatch'),
('Chris', 45, 'Evans'),
('Emma', 46, 'Watson'),
('John', 47, 'Travolta'),
('Joseph', 48, 'Gordon-Levitt'),
('George', 49, 'Clooney'),
('Miles', 50, 'Teller'),
('Daniel', 51, 'Radcliffe'),
('Jeremy', 52, 'Renner'),
('Meryl', 53, 'Streep'),
('James', 54, 'Spader'),
('Christopher', 55, 'Walken'),
('John', 56, 'Cena'),
('Jordan', 57, 'Peele'),
('Donald', 58, 'Sutherland'),
('Felicity', 59, 'Jones'),
('Paul', 60, 'Walker'),
('Jonah', 61, 'Hill'),
('Keegan-Michael', 62, 'Key'),
('Andrew', 63, 'Bachelor'),
('Lea', 64, 'Seydoux'),
('Jessica', 65, 'Alba'),
('Cillian', 66, 'Murphy'),
('Terrence', 67, 'Howard'),
('Keanu', 68, 'Reeves'),
('Charlize', 69, 'Theron'),
('John', 70, 'Krasinski'),
('Adam', 71, 'Sandler'),
('Dakota', 72, 'Fanning'),
('Colin', 73, 'Farrell'),
('Kirsten', 74, 'Dunst'),
('Matthew', 75, 'McConaughey'),
('Vanessa', 76, 'Hudgens'),
('Anna', 77, 'Kendrick'),
('Ginnifer', 78, 'Goodwin'),
('Christian', 79, 'Bale'),
('Natalie', 80, 'Portman'),
('Liam', 81, 'Hemsworth'),
('James', 82, 'Franco'),
('Bruce', 83, 'Willis'),
('Winona', 84, 'Ryder'),
('Selena', 85, 'Gomez'),
('Nicholas', 86, 'Hoult'),
('Jena', 87, 'Malone'),
('Adam', 88, 'Driver'),
('Adrianne', 89, 'Palicki'),
('Julia', 90, 'Roberts'),
('Bryan', 91, 'Cranston'),
('Arnold', 92, 'Schwarzenegger'),
('Keira', 93, 'Knightley'),
('Steve', 94, 'Carell'),
('Chris', 95, 'Evans'),
('Emma', 96, 'Watson'),
('John', 97, 'Travolta'),
('Joseph', 98, 'Gordon-Levitt'),
('George', 99, 'Clooney'),
('Miles', 100, 'Teller'),
('Daniel', 101, 'Radcliffe'),
('Jeremy', 102, 'Renner'),
('Meryl', 103, 'Streep'),
('James', 104, 'Spader'),
('Christopher', 105, 'Walken'),
('John', 106, 'Cena'),
('Jordan', 107, 'Peele'),
('Donald', 108, 'Sutherland'),
('Felicity', 109, 'Jones'),
('Paul', 110, 'Walker'),
('Jonah', 111, 'Hill'),
('Keegan-Michael', 112, 'Key'),
('Andrew', 113, 'Bachelor'),
('Lea', 114, 'Seydoux'),
('Jessica', 115, 'Alba'),
('Cillian', 116, 'Murphy'),
('Terrence', 117, 'Howard'),
('Keanu', 118, 'Reeves'),
('Charlize', 119, 'Theron'),
('John', 120, 'Krasinski'),
('Adam', 121, 'Sandler'),
('Dakota', 122, 'Fanning'),
('Colin', 123, 'Farrell'),
('Kirsten', 124, 'Dunst'),
('Matthew', 125, 'McConaughey'),
('Vanessa', 126, 'Hudgens'),
('Anna', 127, 'Kendrick'),
('Ginnifer', 128, 'Goodwin'),
('Christian', 129, 'Bale'),
('Natalie', 130, 'Portman'),
('Liam', 131, 'Hemsworth'),
('James', 132, 'Franco'),
('Bruce', 133, 'Willis'),
('Winona', 134, 'Ryder'),
('Selena', 135, 'Gomez'),
('Nicholas', 136, 'Hoult'),
('Jena', 137, 'Malone'),
('Adam', 138, 'Driver'),
('Adrianne', 139, 'Palicki'),
('Julia', 140, 'Roberts'),
('Bryan', 141, 'Cranston'),
('Arnold', 142, 'Schwarzenegger'),
('Keira', 143, 'Knightley'),
('Steve', 144, 'Carell');

-- --------------------------------------------------------

--
-- Table structure for table `Crew`
--

CREATE TABLE `Crew` (
  `CrewID` int(11) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `Firstname` varchar(50) NOT NULL,
  `Lastname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Crew`
--

INSERT INTO `Crew` (`CrewID`, `Role`, `Firstname`, `Lastname`) VALUES
(1, 'Director', 'Jarrod', 'Bowem'),
(1, 'Special Effects', 'Jimmy', 'Bowen');

-- --------------------------------------------------------

--
-- Table structure for table `Movies`
--

CREATE TABLE `Movies` (
  `Title` varchar(100) NOT NULL,
  `MovieID` int(11) NOT NULL,
  `Rating` double NOT NULL,
  `Runtime` time NOT NULL,
  `AgeRating` varchar(20) NOT NULL,
  `Genre` varchar(100) NOT NULL,
  `CrewID` int(11) DEFAULT NULL,
  `ReleaseYear` year(4) NOT NULL,
  `Image` varchar(2000) NOT NULL,
  `Description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Movies`
--

INSERT INTO `Movies` (`Title`, `MovieID`, `Rating`, `Runtime`, `AgeRating`, `Genre`, `CrewID`, `ReleaseYear`, `Image`, `Description`) VALUES
('AlmostGodzilla', 2, 4.4, '02:04:35', '16', 'Action', 1, 2019, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUcP7Ru0-GWBsuH0n5VSryTv5rECoTTXXPeIcWP9ygGA&s', 'Experience the awe-inspiring return of Godzilla, the 300-foot-tall King of the Monsters! Awakened by nuclear radiation, this iconic beast unleashes atomic breath and primal fury, serving as both a destructive force and a reluctant savior. Witness the epic spectacle of nature\'s raw power in Godzilla\'s latest cinematic adventure!'),
('NotQuiteJaws', 3, 3.9, '01:54:35', '16', 'Action\r\n', 3, 2021, 'https://www.filmonpaper.com/wp-content/uploads/2014/10/Jaws_onesheet_USA_RogerKastel-4.jpg', 'Prepare for terror with Jaws, the ultimate predator! This iconic thriller features a massive great white shark that terrorizes a small seaside town. As the body count rises, a sheriff, a marine biologist, and a grizzled shark hunter embark on a deadly mission to stop the monstrous beast.'),
('BloodShot', 4, 4, '02:01:13', '18', 'Action\r\n', 3, 2012, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzHvfqaLc0MY1s7GvWfU5XDp2SuaewCuAVFQ&s', 'Experience the electrifying action of *Bloodshot*! Vin Diesel stars as Ray Garrison, a slain soldier resurrected with advanced nanotechnology, granting him superhuman strength and healing abilities. As he seeks vengeance, Ray discovers a web of deception and must confront the truth about his new identity. Brace for an adrenaline-pumping thrill ride!'),
('Shape Of The Woods', 5, 3.7, '01:44:35', 'PG13', 'Horror', 2, 2015, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvRLdpLGripRXCZl3iS7xZyQfa8P_mwg1BkmDOw1kZXg&s', 'Dive into mystery with Shape of the Woods. When strange occurrences plague a small town, a group of friends ventures into the eerie forest to uncover its dark secrets. As they delve deeper, they encounter ancient forces and untold dangers. Prepare for a spine-chilling journey where the unknown lurks behind every tree.'),
('ANIMAL', 6, 4.1, '01:41:55', '16', 'Thriller', 1, 2012, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBOWBiETkQQpYwSe-n-5mEw_MT8S-q4aAHHA&s', 'Get ready for the explosive Bollywood blockbuster Animal! Starring Ranbir Kapoor, this high-octane thriller delves into the dark underworld of crime and power. As family ties and loyalty are tested, a man rises to confront his past and claim his destiny. Expect gripping drama, intense action, and unforgettable performances in this cinematic spectacle.'),
('Gladiator', 8, 4.4, '02:13:13', '18', 'Action', 5, 2011, 'https://media.gettyimages.com/id/1075083140/photo/viking-inspired-black-warrior.jpg?s=612x612&w=0&k=20&c=haA0GnF-2r0Pzc4YWorTbjV2J2cW6nyhmYUnI5A5elA=', 'Gladiator\" is a 2000 epic historical drama directed by Ridley Scott. The film stars Russell Crowe as Maximus Decimus Meridius, a loyal Roman general who is betrayed by Commodus (Joaquin Phoenix), the power-hungry son of Emperor Marcus Aurelius. After his family is murdered, Maximus is enslaved and becomes a gladiator. Rising through the ranks of the arena, he seeks vengeance against Commodus while inspiring the masses and aiming to restore Rome\'s glory.'),
('The Wild Robot', 9, 4.6, '01:58:23', 'FAM', 'Adventure', 4, 2013, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCbVyeLvhvPSaZSPjVGMCLhjWdPY6ue1v85Q&s', '\"The Wild Robot\" is a 2016 children\'s novel by Peter Brown. The story follows Roz, a robot who washes ashore on a remote, wild island. Initially perceived as an outsider by the island\'s animal inhabitants, Roz gradually learns to adapt to her new environment by observing and mimicking the wildlife. She learns to speak the animals\' languages and becomes a part of the island community.'),
('Smile', 10, 3.4, '01:39:53', '18', 'Horror', 3, 2011, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_5f8gtMSanS42LrnePIvnnllzg3jTXQQmZA&s', '\"Smile\" is a 2022 psychological horror film directed by Parker Finn. The story centers around Dr. Rose Cotter (Sosie Bacon), a psychiatrist who experiences a traumatic event involving a disturbed patient who claims to see an entity that smiles at her. After witnessing the patient\'s horrific death, Rose starts to experience terrifying occurrences and sees the same malevolent smiles.\r\n\r\nAs Rose delves deeper into the mystery, she discovers a pattern of similar cases w'),
('The Devil\'s Hand', 11, 4.6, '01:44:35', '16', 'Horror', 1, 2012, 'https://media.gettyimages.com/id/1137085149/photo/the-devils-hand-poster-bottom-linda-christian-on-poster-art-1962.jpg?s=612x612&w=0&k=20&c=OlxO-0bdJHsY79GGPlX2ULqxPZeFLKYJI2G0clfgseI=', 'When six girls are born on the same day in a small, devout community, whispers of prophecy and darkness fill the air. As their 18th birthday approaches, mysterious deaths and sinister events plague the town. Is it the devil\'s work or something even more terrifying? Unearth the chilling secrets as one girl fights to uncover the truth before it\'s too late.'),
('Captain Ukraine', 12, 3.9, '02:04:35', 'PG13', 'Action', 5, 2015, 'https://media.gettyimages.com/id/458467163/photo/the-first-avenger-movie-poster.jpg?s=612x612&w=0&k=20&c=5CmsXsqxLnHSuPI42EZdZlTISu9iL6SJBFJ-AQDAGRE=', 'During World War II, frail Steve Rogers (Chris Evans) volunteers for a top-secret experiment that transforms him into the super-soldier Captain America. With newfound strength and courage, he leads the fight against the evil HYDRA organization, led by the sinister Red Skull (Hugo Weaving). Armed with his indestructible shield and unwavering spirit, Captain America becomes a symbol of hope and freedom.'),
('Horror!', 13, 3.2, '01:41:27', '16', 'Horror', 6, 2009, 'https://media.gettyimages.com/id/1358051308/vector/vintage-horror-comic-book-illustration.jpg?s=612x612&w=0&k=20&c=vvG8rrK5glJA0WskqUr99SrR0sH68fR0ILnl6Op5lgs=', 'Step into a world where nightmares are reality. When an ancient, cursed book is unearthed, it unleashes unspeakable horrors upon a small town. Follow a group of unlikely heroes as they battle grotesque creatures, malevolent spirits, and their own darkest fears. With every page turned, the terror grows stronger. Can they close the book before it consumes them all?\r\n\r\nExperience the chilling thrills and spine-tingling suspense of \"Horror: The Awakening,\" the comic book that will haunt your dreams.'),
('Save The Date', 14, 4.4, '02:24:19', 'PG13', 'Romance', 3, 2010, 'https://media.gettyimages.com/id/917016644/vector/art-deco-style-invitation-design-template.jpg?s=612x612&w=0&k=20&c=8Y4BSn7Dp3txSgh3vCVbK8jV8YXRZDSOyJx3NzYYwxI=', 'Meet Sarah (Lizzy Caplan), an independent artist who’s just had a messy breakup, and her sister Beth (Alison Brie), a meticulous planner engaged to be married. As Sarah navigates the complexities of new love with a charming and spontaneous musician, Jonathan (Mark Webber), she struggles with her fear of commitment. Meanwhile, Beth\'s perfect plans begin to unravel. '),
('Pandemic', 15, 4, '01:58:32', 'PG13', 'Thriller', 2, 2020, 'https://media.gettyimages.com/id/1213454101/vector/flat-and-modern-pandemic-poster.jpg?s=612x612&w=0&k=20&c=QGdoJGLYFrMpMRE-Sj-E-kGr3A0Sk1hvt0YHH05Wq18=', 'In a world ravaged by a deadly virus, society teeters on the brink of collapse. Amid the chaos, Dr. Lauren Chase (Rachel Nichols) leads a desperate mission to find a cure and save humanity. Joined by a team of survivors, they navigate through abandoned cities, face hordes of the infected, and confront the darkness within themselves. In this gripping thriller, every decision is a matter of life and death, and trust is a scarce commodity.\r\n\r\n'),
('Rocky', 16, 4.8, '02:21:19', 'PG13', 'Action', 3, 2007, 'https://media.gettyimages.com/id/551687119/photo/a-poster-for-john-g-avildsens-1976-drama-rocky-starring-sylvester-stallone-and-talia-shire.jpg?s=612x612&w=0&k=20&c=6ZxkxwbH7p0IQuinN_Oy6gSho4Wy2zQ-xrRRNNC3oYw=', 'Meet Rocky Balboa (Sylvester Stallone), a down-on-his-luck boxer from the mean streets of Philadelphia. When he gets the once-in-a-lifetime chance to fight heavyweight champion Apollo Creed (Carl Weathers), Rocky seizes the opportunity to prove himself to the world. With the support of his beloved Adrian (Talia Shire) and the guidance of his trainer Mickey (Burgess Meredith), Rocky embarks on a journey of determination, heart, and raw grit.'),
('Legally Blond', 17, 4.1, '01:54:22', 'FAM', 'Comedy', 5, 2015, 'https://media.gettyimages.com/id/80171033/photo/legally-blonde-2-poster.jpg?s=612x612&w=0&k=20&c=JvBy9m_7ZbcWBi2Qrwxmde8LhxQ6MRL0mV1BB3BlyIM=', 'Meet Elle Woods (Reese Witherspoon), a fashion-forward sorority queen with a heart of gold and a penchant for all things pink. When her boyfriend dumps her for someone more serious, Elle embarks on a mission to win him back by enrolling in Harvard Law School. Armed with her signature style, sharp wit, and unwavering determination, Elle defies expectations and proves that being true to yourself is the ultimate success.'),
('Amadeus', 18, 3.1, '02:04:35', '18', 'Thriller', 7, 2019, 'https://media.gettyimages.com/id/505997105/photo/amadeus-a-1984-period-drama-film-starring-f-murray-abraham-tom-hulce-and-elizabeth-berridge.jpg?s=612x612&w=0&k=20&c=CY5Z049dQJZZU0duuHEiYKzJJMalUQ31uhQVKYJZ9aQ=', 'Step into the world of Wolfgang Amadeus Mozart (Tom Hulce), the prodigious composer whose brilliance knows no bounds. Through the eyes of his envious rival, Antonio Salieri (F. Murray Abraham), witness the turbulent relationship between two musical titans as Salieri grapples with his own mediocrity in the shadow of Mozart\'s unmatched talent. Set against the backdrop of 18th-century Vienna, this gripping drama explores the price of genius and the destructive power of envy.\r\n\r\n'),
('Dawn Of The Dead', 19, 4.5, '02:17:13', '18', 'Action', 5, 2012, 'https://media.gettyimages.com/id/506004389/photo/dawn-of-the-dead-a-1978-horror-film.jpg?s=612x612&w=0&k=20&c=znwpfhauzMu0NUpKkKd6dc3WgCHwYqJa9Yvgle7vV3E=', 'In the aftermath of a mysterious epidemic that turns the living into flesh-eating zombies, a diverse group of survivors seeks refuge in a shopping mall. As they fortify their sanctuary and fend off the relentless horde of undead, tensions rise and alliances are tested. In this heart-pounding horror thriller, every moment is a fight for survival against the encroaching darkness.'),
('Noir', 20, 4.7, '01:24:19', '18', 'Thriller', 1, 1971, 'https://media.gettyimages.com/id/1755784038/vector/noir-detective-movie-poster.jpg?s=612x612&w=0&k=20&c=6vWcIMFlfy-j63y09rf4qmhsFtvLbDVQC1mi6CjU760=', 'Enter the gritty underworld of Noir, where shadows conceal secrets and every whisper holds danger. Detective Jack Malone (John Doe) finds himself entangled in a web of corruption, betrayal, and femme fatales as he delves deep into the heart of darkness. With the line between right and wrong blurred, Jack must navigate the treacherous streets of Noir City to uncover the truth before it consumes him.'),
('Slow And Calm', 21, 3.9, '01:43:43', 'PG13', 'Action', 8, 2006, 'https://media.gettyimages.com/id/89461710/photo/new-york-a-movie-poster-promoting-fast-furious-is-shown-at-an-appearance-by-actor-vin-diesel-at.jpg?s=612x612&w=0&k=20&c=ZWvZal414HUg7v2q49jB08-tdQsFqvm7ACFI7f4hgxA=', 'Buckle up for the ride of a lifetime with Dom Toretto (Vin Diesel) and his crew as they live by one code: family. From the streets of Los Angeles to exotic locales around the globe, join Dom, Brian O\'Conner (Paul Walker), and their team of adrenaline junkies as they race against time, rival gangs, and even the law itself. With high-speed chases, jaw-dropping stunts, and heart-stopping action, the Fast & Furious franchise is the ultimate thrill ride.'),
('Synonym For Terminator', 22, 4.1, '02:08:12', '16', 'Action', 3, 2017, 'https://media.gettyimages.com/id/529493856/photo/the-terminator-salvation-poster-on-display-outside-the-premiere-of-the-film-held-at-graumans.jpg?s=612x612&w=0&k=20&c=ZVLPV7eO4W4-cWcsUjkWlXIZI4ARsRlNeoLYHLVwRVg=', 'In a post-apocalyptic world ravaged by war, John Connor (Christian Bale) leads the resistance against Skynet, the malevolent AI bent on exterminating humanity. As the battle for survival rages on, Connor discovers Marcus Wright (Sam Worthington), a mysterious stranger with a secret that could change the course of the war. Together, they must confront an unstoppable army of Terminators and uncover the truth behind Skynet\'s ultimate plan.'),
('Galaxy Wars', 23, 4.2, '02:08:54', 'PG13', 'Sci-Fi', 7, 1988, 'https://media.gettyimages.com/id/513667727/photo/film-poster-for-george-lucas-film-star-wars-an-american-epic-space-science-fiction-film-series.jpg?s=612x612&w=0&k=20&c=5gdwaVSAhRpijY1o8fSorXd-v0EwGLO9qlb4kOVEeA8=', 'Embark on an epic journey through space and time in the timeless saga of Star Wars. From the humble beginnings of farm boy Luke Skywalker (Mark Hamill) to the rise of the Sith Lord Darth Vader (David Prowse/James Earl Jones), and the valiant efforts of Princess Leia (Carrie Fisher) and Han Solo (Harrison Ford), witness the battle between the forces of light and dark in a universe filled with heroes, villains, and the mystical power of the Force');

-- --------------------------------------------------------

--
-- Table structure for table `Movie_Actor`
--

CREATE TABLE `Movie_Actor` (
  `MovieID` int(11) NOT NULL,
  `ActorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Movie_Actor`
--

INSERT INTO `Movie_Actor` (`MovieID`, `ActorID`) VALUES
(1, 21),
(1, 97),
(2, 22),
(3, 4),
(3, 20),
(3, 21),
(3, 22),
(4, 5),
(4, 8),
(4, 14),
(4, 20),
(4, 25),
(4, 43),
(4, 56),
(4, 65),
(5, 11),
(5, 19),
(5, 25),
(6, 8),
(6, 15),
(6, 17),
(6, 64),
(7, 13),
(7, 14),
(7, 22),
(7, 24),
(8, 12),
(8, 58),
(9, 6),
(9, 9),
(9, 11),
(9, 19),
(10, 3),
(10, 11),
(11, 2),
(11, 9),
(11, 14),
(11, 24),
(11, 25),
(12, 14),
(13, 12),
(14, 74),
(15, 14),
(15, 22),
(15, 23),
(20, 3),
(20, 11),
(20, 34),
(22, 10),
(22, 12),
(23, 15);

-- --------------------------------------------------------

--
-- Table structure for table `Movie_Reviews`
--

CREATE TABLE `Movie_Reviews` (
  `UserID` int(11) NOT NULL,
  `MovieID` int(11) NOT NULL,
  `Review` varchar(300) NOT NULL,
  `StarRating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Series`
--

CREATE TABLE `Series` (
  `SeriesID` int(11) NOT NULL,
  `CrewID` int(11) DEFAULT NULL,
  `Title` varchar(100) NOT NULL,
  `ReleaseYear` year(4) NOT NULL,
  `AgeRating` varchar(50) NOT NULL,
  `Rating` double NOT NULL,
  `Seasons` int(11) NOT NULL,
  `Image` varchar(9000) NOT NULL,
  `Description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Series`
--

INSERT INTO `Series` (`SeriesID`, `CrewID`, `Title`, `ReleaseYear`, `AgeRating`, `Rating`, `Seasons`, `Image`, `Description`) VALUES
(1, 1, 'The Simpsons', 1998, 'PG13', 3.9, 13, 'https://imgc.allpostersimages.com/img/posters/octavian-mielu-bunny_u-L-Q1I74NK0.jpg', 'Join the Simpsons – Homer, Marge, Bart, Lisa, and Maggie – in their hilarious misadventures in the colorful town of Springfield. From Homer\'s antics at the nuclear power plant to Bart\'s shenanigans at school, and Lisa\'s activism to Marge\'s attempts to keep the family together, every day is a new adventure filled with laughs, satire, and heartwarming moments. With its iconic characters, witty humor, and social commentary, The Simpsons has become a beloved cultural phenomenon spanning generations.'),
(2, 3, 'Barney', 1986, 'FAM', 3.1, 5, 'https://www.chisholm-poster.com/large/CL76607.jpg', 'Join Barney, the lovable purple dinosaur, and his friends Baby Bop, BJ, and the children of the neighborhood as they embark on magical adventures filled with songs, dances, and valuable lessons. From exploring the wonders of the world to celebrating friendship and teamwork, Barney & Friends encourages creativity, kindness, and learning through imagination and play.'),
(3, 3, 'Beyblade', 2005, 'PG13', 4, 4, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqDATa54My4HXU7WlFBbeAQlvTNqUVvk4_cQ&s', 'Join Tyson Granger and his friends as they compete in the thrilling world of Beyblade battles. Using their customized spinning tops, known as Beyblades, they face off against rival Bladers in intense battles of skill, strategy, and teamwork. With their sights set on becoming Beyblade champions, Tyson and his team navigate through tournaments, forge new friendships, and overcome formidable opponents in their quest for glory.'),
(4, 6, 'Chaotic', 2009, 'PG13', 4, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSICWPrt7ofJVYRjNO0W8K3XAOAm76BVtdsXA&s', 'Step into the world of Perim, where players battle with creatures, known as \"Creatures\", using unique strategies and powerful attacks. Tom and his friends embark on thrilling adventures, collecting powerful Creature cards and competing in intense matches to become the greatest Chaotic players. With each victory, they uncover secrets, face formidable foes, and strive to unlock the full potential of their decks.'),
(5, 11, 'Generic Chinese Knockoff Of A Lego Show', 2015, 'FAM', 2.9, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpCGPFJKULhyfU1JM_Lc9Oo0v2I72qvr4lyg&s', 'Join Clay, Aaron, Lance, Macy, and Axl as they become the Nexo Knights, a brave team of young knights equipped with powerful technology and ancient magic. Together, they defend the kingdom of Knighton from the evil forces of Jestro and the Book of Monsters. Using their futuristic weaponry, formidable vehicles, and the power of Nexo Powers, they embark on daring quests to protect their homeland and restore peace to the realm.'),
(6, 5, 'Maxine', 2011, 'PG13', 4.4, 3, 'https://imgc.allpostersimages.com/img/posters/maxine-noel-tomorrow-s-child_u-L-F4Y1B30.jpg', 'Follow Maxine, a spirited young girl with a passion for adventure, as she discovers her hidden powers and embarks on a journey to save her world from darkness. With her loyal companions by her side, Maxine must confront ancient evils, unravel secrets of her past, and embrace her true destiny as the chosen one. Along the way, she learns the true meaning of courage, friendship, and sacrifice.'),
(7, 4, 'Something Similar To: Euphoria', 2022, '18', 4.2, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj4y7iT1QUBQVA1P55LWFBdNZbZN67S4yTeg&s', 'Explore the intricate lives of Rue, Jules, Nate, Cassie, and the rest of the eclectic cast as they navigate the tumultuous waters of adolescence in a suburban town. Through the lens of their interconnected stories, \"Euphoria\" delves into themes of love, identity, addiction, and the search for acceptance in a world fraught with uncertainty. With its raw portrayal of teenage life and stunning visuals, \"Euphoria\" offers a gripping and unflinching look at the complexities of growing up in the modern age.'),
(8, 4, 'Sword Art Offline', 2012, '16', 3.9, 5, 'https://imgc.allpostersimages.com/img/posters/trends-international-sword-art-online-key-art-1_u-L-Q1RG0Q80.jpg', 'Join Kirito, Asuna, and a cast of characters as they immerse themselves in the virtual world of Sword Art Online. Trapped in a massively multiplayer online role-playing game (MMORPG), they must fight for their lives as the game\'s creator traps them within, with the only means of escape being to clear all 100 floors of the deadly tower. Along the way, they forge friendships, face unimaginable challenges, and uncover the secrets of the virtual world they inhabit.'),
(9, 5, 'Bottom Gear', 2014, 'PG13', 4.9, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPIZp9lYwXKEMopUAHxi0D4_fIqufuUH0Ntg&s', 'Join Jeremy Clarkson, Richard Hammond, and James May as they embark on wild automotive adventures, push the limits of speed and performance, and deliver a healthy dose of wit and humor in the iconic motoring show, \"Top Gear.\" From epic road trips across exotic locales to thrilling challenges and daring stunts, \"Top Gear\" celebrates the love of cars in all its forms, from the classics to the cutting-edge supercars.'),
(10, 7, 'The Last Dragon', 2021, '16', 4.6, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwdQ9GaghGy6UVfotJHPVEx2-MzleToAD0qg&s', 'In a world where darkness threatens to engulf everything, one hero rises to embrace his destiny and become the legendary Last Dragon. Follow his journey as he embarks on a quest to restore peace and balance to the land, armed only with courage, determination, and the ancient power of the dragons. Along the way, he faces formidable challenges, encounters unlikely allies, and confronts the ultimate evil that threatens to consume the world.'),
(11, 2, 'Legacies', 2001, '16', 3.8, 11, 'https://imgc.allpostersimages.com/img/posters/harry-potter-hogwarts-legacy-key-art_u-L-FAAQKI0.jpg', 'Step into the mystical world of Mystic Falls, where a new generation of witches, vampires, and werewolves attends the Salvatore School for the Young and Gifted. Led by headmaster Alaric Saltzman, students like Hope Mikaelson, Lizzie and Josie Saltzman, and Landon Kirby navigate the challenges of teenage life while honing their supernatural abilities. As they forge friendships, face ancient evils, and uncover dark secrets, they must learn to embrace their legacy and stand united against the forces of darkness.'),
(12, 4, 'Quintessence, The Final Wind Controller', 2008, 'FAM', 4.3, 3, 'https://imgc.allpostersimages.com/img/posters/trends-international-nickelodeon-avatar-the-last-airbender-elements_u-L-Q1RFW2R0.jpg', 'Journey with Aang, the last Airbender and Avatar, as he embarks on a quest to master the four elements and restore balance to the world. Alongside his friends Katara, Sokka, and Toph, Aang faces formidable challenges, confronts his past, and battles the tyrannical Fire Nation. With breathtaking bending battles, heartfelt moments, and unforgettable characters, Avatar: The Last Airbender captivates audiences with its rich mythology, compelling storytelling, and timeless themes of friendship, courage, and redemption.'),
(13, 1, 'James Electron', 2007, 'FAM', 3.8, 6, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgj1VGRS_47ndZYSDyfLC51mc-yYaJRhJynQ&s', 'Join Jimmy Neutron, the boy genius with a knack for invention, and his friends as they embark on wild adventures in Retroville. With his trusty robotic dog, Goddard, by his side, Jimmy tackles everything from school projects gone awry to intergalactic adventures. From battling aliens to saving the day with his ingenious inventions, Jimmy proves that with a little bit of science and a lot of imagination, anything is possible.'),
(14, 4, 'Pixie Even Guardians', 2005, 'FAM', 4, 7, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPEfUF_GJAFOGQIO7CyBKitBG84aDRVFWtUQ&s', 'Meet Timmy Turner, a 10-year-old boy with two fairy godparents, Cosmo and Wanda, who grant his every wish. With their magical powers, Timmy embarks on whimsical adventures, from turning his teacher into a giant hamster to traveling through time to fix his mistakes. But with great power comes great responsibility, and Timmy must learn valuable lessons about friendship, honesty, and the consequences of his actions.'),
(15, 5, 'The Average Practitioner ', 2011, 'PG13', 4.4, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqSMVrL_tTGBNVoKMayusSo9xew7WSgxwI_A&s', 'Follow Dr. Shaun Murphy, a young surgeon with autism and savant syndrome, as he navigates the complexities of life and medicine at San Jose St. Bonaventure Hospital. Despite facing skepticism and prejudice from his colleagues, Shaun\'s exceptional medical skills and unique perspective prove invaluable in solving challenging cases and touching the lives of patients and staff alike. With compassion, determination, and a touch of humor, Shaun reminds us that empathy knows no boundaries.'),
(16, 1, 'Charlie\'s Cherubs', 1990, '16', 4.4, 2, 'https://imgc.allpostersimages.com/img/posters/charlies-angels-1976_u-L-Q1HQ9U90.jpg', 'Meet Natalie (Cameron Diaz), Dylan (Drew Barrymore), and Alex (Lucy Liu) – three elite operatives who work for the mysterious Charlie Townsend (voiced by John Forsythe). Tasked with taking down criminals and thwarting evil schemes, the Angels use their wit, charm, and martial arts skills to outsmart their enemies and save the day. With high-octane action, dazzling stunts, and a touch of humor, Charlie\'s Angels redefine what it means to be a crime-fighting trio'),
(17, 5, 'My Neighbor Totoro ', 2001, 'FAM', 4.5, 4, 'https://imgc.allpostersimages.com/img/posters/my-neighbor-totoro-aka-tonari-no-totoro-japanese-poster-art-1988_u-L-Q1HWOKX0.jpg', 'Follow the enchanting journey of sisters Satsuki and Mei as they move to the countryside with their father and encounter magical creatures in the nearby forest. When Mei discovers the playful and mysterious Totoro, a gentle forest spirit, they embark on whimsical adventures filled with wonder and discovery. Together, they learn the importance of family, friendship, and the beauty of nature.'),
(18, 7, 'Coitus Relations In The Town', 2012, '18', 4.8, 5, 'https://imgc.allpostersimages.com/img/posters/david-brodsky-sex-and-the-city_u-L-Q1QGCY70.jpg', 'Join Carrie Bradshaw (Sarah Jessica Parker) and her three best friends – Samantha Jones (Kim Cattrall), Charlotte York (Kristin Davis), and Miranda Hobbes (Cynthia Nixon) – as they navigate the ups and downs of love, friendship, and careers in New York City. With wit, style, and a dash of scandal, the fab four tackle life\'s most pressing questions: Can you have it all? Is true love real? And where do you find the perfect pair of shoes?'),
(19, 1, 'Bye Dawg', 2009, 'FAM', 3.7, 6, 'https://imgc.allpostersimages.com/img/posters/hello-kitty-happy_u-L-F9M0BR0.jpg', 'Step into the whimsical world of Hello Kitty, where friendship, kindness, and adventure await! Follow Hello Kitty, her twin sister Mimmy, and their friends – including My Melody, Keroppi, and Badtz-Maru – as they embark on delightful escapades in their vibrant hometown of Sanrio Town. From magical tea parties to exciting travels, every day is a new and exciting adventure with Hello Kitty and her adorable pals!'),
(20, 4, 'Adult Regular Samurai Lizards', 1999, 'FAM', 4.2, 3, 'https://imgc.allpostersimages.com/img/posters/nickelodeon-teenage-mutant-ninja-turtles-pizza_u-L-FAAQCO0.jpg', 'Join Leonardo, Michelangelo, Donatello, and Raphael – the Teenage Mutant Ninja Turtles – as they battle against the forces of evil in the bustling streets of New York City. With their ninja skills, wits, and teamwork, these pizza-loving brothers defend the city from the likes of Shredder, Krang, and other villains lurking in the shadows. From epic battles to hilarious hijinks, the Turtles are always ready to save the day!'),
(21, 4, 'Attack On Something Similar To But Not Quite Titans', 2012, '16', 4.6, 4, 'https://imgc.allpostersimages.com/img/posters/trends-international-attack-on-titan-season-2-attack-titan_u-L-Q1RFWW50.jpg', 'In a world overrun by towering Titans – monstrous beings that devour humans without mercy – humanity\'s last hope lies within the towering walls of their cities. Join Eren Yeager, Mikasa Ackerman, and Armin Arlert as they enlist in the elite Survey Corps, a group of soldiers tasked with venturing beyond the walls to reclaim humanity\'s lost territory and uncover the truth behind the Titans\' origins.'),
(22, 2, 'Strength Rangers', 1992, 'FAM', 3.5, 19, 'https://imgc.allpostersimages.com/img/posters/power-rangers-30th-group_u-L-FAAW3N0.jpg', 'Join the Power Rangers – a team of mighty heroes from different walks of life – as they band together to defend the Earth from the forces of evil. With their incredible powers, high-tech Zords, and unwavering courage, the Rangers battle villains like Rita Repulsa, Lord Zedd, and countless monsters to protect the world from destruction. Together, they prove that when you combine strength, teamwork, and friendship, nothing is impossible!'),
(23, 7, 'Mando', 2022, '16', 4.3, 3, 'https://imgc.allpostersimages.com/img/posters/star-wars-the-mandalorian-group_u-L-FAAQDP0.jpg', 'Follow the mysterious Mandalorian, a lone gunslinger navigating the outer reaches of the galaxy in the tumultuous aftermath of the Empire\'s fall. Tasked with a mission that changes his life forever, he forms an unlikely bond with a Force-sensitive child known as Grogu, or \"The Child.\" Together, they embark on a perilous journey through lawless worlds, encountering allies and enemies alike, all while evading capture by those who seek to exploit the child\'s power.'),
(24, 2, 'Tuesday!', 2021, 'PG13', 4.1, 4, 'https://imgc.allpostersimages.com/img/posters/wednesday-one-sheet_u-L-FAAPZ70.jpg', 'Step into the eerie world of Wednesday Addams, the iconic gothic daughter of the Addams Family. As Wednesday navigates the challenges of growing up in a world that doesn\'t quite understand her, she discovers her own unique powers and embraces her dark and macabre nature. '),
(25, 5, 'Pretty Mundane Stuff', 2017, 'PG13', 3.9, 5, 'https://imgc.allpostersimages.com/img/posters/stranger-things-one-sheet_u-L-F97U8B0.jpg', 'In the small town of Hawkins, Indiana, a group of friends uncover a series of supernatural mysteries that lead them to a secret government experiment and a parallel dimension known as the Upside Down. As they search for their missing friend and encounter terrifying creatures, they forge bonds of friendship that will last a lifetime. With nods to 80s pop culture and heart-pounding suspense, Stranger Things takes viewers on a thrilling journey filled with nostalgia, intrigue, and supernatural phenomena.'),
(26, 6, 'Fiend Killer', 2019, '16', 4.2, 4, 'https://imgc.allpostersimages.com/img/posters/demon-slayer-mugen-train-collage-one-sheet_u-L-FAAQ2W0.jpg', 'Follow Tanjiro Kamado, a kind-hearted boy whose life is shattered when his family is slaughtered by demons, leaving only his sister Nezuko, who has been turned into a demon herself. Determined to avenge his family and find a cure for Nezuko, Tanjiro joins the Demon Slayer Corps, a group of elite warriors dedicated to eradicating demons and protecting humanity. Alongside his comrades, Tanjiro embarks on a perilous journey filled with battles, friendship, and the quest for redemption.'),
(27, NULL, 'The Witcher?Perhaps', 2022, '18', 4, 3, 'https://imgc.allpostersimages.com/img/posters/netflix-the-witcher-key-art-premium-poster_u-L-F9PHGE0.jpg', 'Enter a world of monsters, magic, and destiny as Geralt of Rivia, a solitary monster hunter known as a Witcher, navigates the treacherous Continent in search of his place in a world torn apart by war and chaos. Along the way, he encounters powerful sorceresses, cunning kings, and mysterious creatures, all while confronting his own inner demons and confronting the dark forces that threaten to engulf the land. With his trusted sword and unwavering determination, Geralt embarks on an epic quest that will shape the fate of nations.'),
(28, NULL, 'For The Throne', 2015, '18', 4.7, 8, 'https://imgc.allpostersimages.com/img/posters/trends-international-game-of-thrones-the-battle_u-L-Q1RFW400.jpg', 'Journey to the Seven Kingdoms of Westeros, where noble houses vie for power, alliances are forged and broken, and dark forces threaten the realm from beyond the Wall. Follow the epic tale of political intrigue, betrayal, and warfare as the Starks, Lannisters, Targaryens, and other great houses clash for control of the Iron Throne. With dragons, direwolves, and the looming threat of the White Walkers, no one is safe in the game of thrones.\r\n\r\n'),
(29, 2, 'Spirit In The Shell', 1999, '18', 4.1, 2, 'https://imgc.allpostersimages.com/img/posters/ghost-in-the-shell_u-L-F4S6XY0.jpg', 'In a future where humanity is interconnected with advanced cybernetic technology, Major Motoko Kusanagi and her team of elite operatives, Section 9, are tasked with combating cybercrime and terrorism in a world where the line between man and machine is blurred. As they investigate a series of high-profile cases, they uncover a web of conspiracy that threatens the very fabric of society. With cutting-edge technology and philosophical undertones, Ghost in the Shell explores the nature of identity, consciousness, and the essence of being human'),
(30, 3, 'Naruto Shippuden', 2011, '16', 4.5, 4, 'https://imgc.allpostersimages.com/img/posters/naruto-itachi-premium-poster_u-L-F9PHD30.jpg', 'Follow the journey of Naruto Uzumaki, a young ninja with dreams of becoming the strongest ninja and leader of his village, the Hokage. Born with the Nine-Tailed Fox demon sealed within him, Naruto faces prejudice and loneliness but refuses to give up on his dreams. Alongside his friends Sasuke Uchiha and Sakura Haruno, Naruto trains tirelessly, faces formidable foes, and learns valuable lessons about friendship, perseverance, and the true meaning of being a ninja.\r\n\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `Series_Actor`
--

CREATE TABLE `Series_Actor` (
  `SeriesID` int(11) NOT NULL,
  `ActorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Series_Reviews`
--

CREATE TABLE `Series_Reviews` (
  `UserID` int(11) NOT NULL,
  `SeriesID` int(11) NOT NULL,
  `Review` varchar(300) NOT NULL,
  `StarRating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Series_Season`
--

CREATE TABLE `Series_Season` (
  `SeriesID` int(11) NOT NULL,
  `Season` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Subscription`
--

CREATE TABLE `Subscription` (
  `UserID` int(11) NOT NULL,
  `Newsletter` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `UserID` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Firstname` varchar(255) NOT NULL,
  `Lastname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pref_genre` varchar(255) NOT NULL,
  `api_key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`UserID`, `Email`, `Firstname`, `Lastname`, `password`, `pref_genre`, `api_key`) VALUES
(1, 'johnnytest@gmail.com', 'Johnny', 'Test', '$2y$10$HAFzxEWgHEHlb81FWS5E5OzxBoeuRSgW7yjSykzL.xwGIyjscCQOW', 'Comedy', 'fhduYEzg7beD6xKwRoVQ'),
(2, 'odlamini@gmail.com', 'Owethu', 'Dlamini', '$2y$10$O2rM/PkPiXxLNqAspok0quynZ6tpVXRV.pRNqIgsz4cpNV3y3tLFe', 'thriller', '7kTlhU63SCPse8IVpAxf'),
(3, 'fakeemail@gmail.com', 'David', 'Roy', '$2y$10$hvc5gBnzqyZfkwo5nOIBD./wJLuUEPzUKDQq4jR466VEYsnpA4sXG', 'comedy', 'aDe8x2qtGEHfrcCN6Y5w'),
(4, 'kelsey@gmail.com', 'Kelsey', 'Hamann', '$2y$10$3iGFBTV36YJdfj2b.uJOIeqitjQRFH6jvJywEd3xR7I6/ZPHoIz6K', 'sci-fi', 'pP3aHQtkNsREc5n0fqMA'),
(5, 'hughjackman@gmail.com', 'Hugh', 'Jackman', '$2y$10$RqXHosmCyYO1Iwcksv4nW.WGGJ0OsKXx6DnDvPavX0epDf2aXwaUG', 'Action', 'lnLpXKVHc5gwPa2yDOIt');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Actor`
--
ALTER TABLE `Actor`
  ADD PRIMARY KEY (`ActorID`);

--
-- Indexes for table `Crew`
--
ALTER TABLE `Crew`
  ADD PRIMARY KEY (`CrewID`,`Firstname`,`Lastname`);

--
-- Indexes for table `Movies`
--
ALTER TABLE `Movies`
  ADD PRIMARY KEY (`MovieID`);

--
-- Indexes for table `Movie_Actor`
--
ALTER TABLE `Movie_Actor`
  ADD PRIMARY KEY (`MovieID`,`ActorID`);

--
-- Indexes for table `Movie_Reviews`
--
ALTER TABLE `Movie_Reviews`
  ADD PRIMARY KEY (`UserID`,`MovieID`);

--
-- Indexes for table `Series`
--
ALTER TABLE `Series`
  ADD PRIMARY KEY (`SeriesID`);

--
-- Indexes for table `Series_Actor`
--
ALTER TABLE `Series_Actor`
  ADD PRIMARY KEY (`SeriesID`,`ActorID`);

--
-- Indexes for table `Series_Reviews`
--
ALTER TABLE `Series_Reviews`
  ADD PRIMARY KEY (`UserID`,`SeriesID`);

--
-- Indexes for table `Series_Season`
--
ALTER TABLE `Series_Season`
  ADD PRIMARY KEY (`SeriesID`,`Season`);

--
-- Indexes for table `Subscription`
--
ALTER TABLE `Subscription`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Actor`
--
ALTER TABLE `Actor`
  MODIFY `ActorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `Movies`
--
ALTER TABLE `Movies`
  MODIFY `MovieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `Series`
--
ALTER TABLE `Series`
  MODIFY `SeriesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
