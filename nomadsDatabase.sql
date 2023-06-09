CREATE TABLE Users (
  UserID INTEGER PRIMARY KEY AUTO_INCREMENT,
  UserName TEXT NOT NULL,
  Birthday DATE NOT NULL,
  Age INTEGER NOT NULL,
  Email VARCHAR(75) UNIQUE NOT NULL,
  PhoneNumber TEXT NOT NULL,
  UserCred VARCHAR(75) UNIQUE NOT NULL,
  Passwd TEXT NOT NULL
);

CREATE TABLE QuestionnaireResponses (
  ResponseID INTEGER PRIMARY KEY AUTO_INCREMENT,
  UserName TEXT NOT NULL,
  UserID INTEGER NOT NULL,
  DietaryRestrictions TEXT NOT NULL,
  TemperaturePreference TEXT NOT NULL,
  InOrOut TEXT NOT NULL,
  Museum_YN BOOLEAN NOT NULL,
  Skill_YN BOOLEAN NOT NULL,
  Distance_YN BOOLEAN NOT NULL,
  PricePoint INTEGER NOT NULL,
  FOREIGN KEY(UserID) REFERENCES Users(UserID)
);

CREATE TABLE Locations (
  LocationID INTEGER PRIMARY KEY AUTO_INCREMENT,
  LocationName TEXT NOT NULL,
  LocationDescription TEXT NOT NULL,
  Temperature TEXT NOT NULL
);

CREATE TABLE Food (
  FoodID INTEGER PRIMARY KEY AUTO_INCREMENT,
  LocationID INTEGER NOT NULL,
  FoodName TEXT NOT NULL,
  Address TEXT NOT NULL,
  NoFoodRestrict BOOLEAN NOT NULL,
  Halal BOOLEAN NOT NULL,
  Kosher BOOLEAN NOT NULL,
  Vegetarian BOOLEAN NOT NULL,
  Vegan BOOLEAN NOT NULL,
  LactoseIntolerant BOOLEAN NOT NULL,
  Price INTEGER NOT NULL,
  FOREIGN KEY(LocationID) REFERENCES Locations(LocationID)
);

CREATE TABLE Museums (
  MuseumID INTEGER PRIMARY KEY AUTO_INCREMENT,
  LocationID INTEGER NOT NULL,
  MuseumName TEXT NOT NULL,
  Address TEXT NOT NULL,
  Subject TEXT NOT NULL,
  Price INTEGER NOT NULL,
  FOREIGN KEY(LocationID) REFERENCES Locations(LocationID)
);

CREATE TABLE Clubs (
  ClubID INTEGER PRIMARY KEY AUTO_INCREMENT,
  LocationID INTEGER NOT NULL,
  ClubName TEXT NOT NULL,
  Address TEXT NOT NULL,
  Price INTEGER NOT NULL,
  FOREIGN KEY(LocationID) REFERENCES Locations(LocationID)
);

CREATE TABLE Classes (
  ClassID INTEGER PRIMARY KEY AUTO_INCREMENT,
  LocationID INTEGER NOT NULL,
  ClassName TEXT NOT NULL,
  Address TEXT NOT NULL,
  Skill TEXT NOT NULL,
  Price INTEGER NOT NULL,
  FOREIGN KEY(LocationID) REFERENCES Locations(LocationID)
);

CREATE TABLE TrailsHike (
  TrailID INTEGER PRIMARY KEY AUTO_INCREMENT,
  LocationID INTEGER NOT NULL,
  TrailName TEXT NOT NULL,
  Address TEXT NOT NULL,
  Distance INTEGER NOT NULL,
  FOREIGN KEY(LocationID) REFERENCES Locations(LocationID)
);

CREATE TABLE Monuments (
  MonID INTEGER PRIMARY KEY AUTO_INCREMENT,
  LocationID INTEGER NOT NULL,
  MonumentName TEXT NOT NULL,
  Address TEXT NOT NULL,
  Price INTEGER NOT NULL,
  FOREIGN KEY(LocationID) REFERENCES Locations(LocationID)
);

CREATE TABLE Parks (
  ParkID INTEGER PRIMARY KEY AUTO_INCREMENT,
  LocationID INTEGER NOT NULL,
  ParkName TEXT NOT NULL,
  Address TEXT NOT NULL,
  Price INTEGER NOT NULL,
  FOREIGN KEY(LocationID) REFERENCES Locations(LocationID)
);

INSERT INTO Locations (LocationName, LocationDescription, Temperature) VALUES
('Maui - Hawaii', 'A beautiful island in the Pacific with warm, tropical weather and plenty of beaches and outdoor activities to enjoy.', '70+ degrees'),
('New York - New York City', 'One of the most vibrant and bustling cities in the world, with a rich history and culture, famous landmarks, and endless entertainment options.', '50 degrees - 70 degrees'),
('California - San Francisco', 'A hilly city on the west coast known for its iconic Golden Gate Bridge, diverse neighborhoods, and thriving tech industry.', '50 degrees - 70 degrees'),
('Washington D.C.', 'The capital of the United States, with a wealth of history, monuments, and museums to explore, as well as a vibrant political scene.', '50 degrees - 70 degrees'),
('California - San Diego', 'A sunny city on the southern coast of California with beautiful beaches, a lively downtown area, and many attractions for all ages.', '50 degrees'),
('Louisiana - New Orleans', 'A unique and lively city known for its music, food, and festivals, as well as its rich history and architecture.', '70+ degrees'),
('Florida - Key West', 'A picturesque island at the southernmost point of Florida, with clear blue waters, a laid-back atmosphere, and plenty of opportunities for water sports and relaxation.', '70+ degrees'),
('Massachusetts - Boston', 'A historic city with a strong intellectual and cultural scene, known for its universities, museums, and landmarks such as the Freedom Trail and Fenway Park.', '30 degrees'),
('Colorado - Aspen', 'A popular ski resort town nestled in the Rocky Mountains, with world-class skiing, hiking, and outdoor activities in the winter and summer.', '30 degrees'),
('Washington - Seattle', 'A thriving city in the Pacific Northwest, known for its coffee culture, tech industry, and outdoor opportunities such as hiking and boating.', '50 degrees - 70 degrees'),
('Florida - Miami', 'A vibrant city with a lively nightlife, beautiful beaches, and a mix of Latin American and American cultures.', '70+ degrees'),
('Nevada - Las Vegas', 'A city in the middle of the desert known for its casinos, nightlife, and entertainment options, as well as its proximity to natural wonders like the Grand Canyon.', '70+ degrees'),
('Texas - San Antonio', 'A historic city with a strong Mexican influence, known for the Alamo, the River Walk, and its delicious Tex-Mex cuisine.', '70+ degrees'),
('Anchorage - Alaska', 'The largest city in Alaska, surrounded by stunning natural scenery and offering a wide range of outdoor activities, from hiking to dog sledding.', '30 degrees');

INSERT INTO Food (LocationID, FoodName, Address, NoFoodRestrict, Halal, Kosher, Vegetarian, Vegan, LactoseIntolerant, Price) VALUES
(1, 'Mama''s Fish House', '799 Poho Pl, Pai HI 96779, United States', 1, 1, 1, 1, 1, 1, 80),
(1, 'Lahaina Grill', '127 Lahainaluna Rd, Lahaina, HI 96761, United States', 0, 0, 0, 1, 1, 0, 65),
(1, 'Da Kitchen', '425 Koloa St, Kahului, HI 96732, United States', 0, 1, 0, 1, 1, 0, 15),
(2, 'Le Bernardin', '155 W 51st St, New York, NY 10019, United States', 0, 0, 0, 1, 1, 0, 250),
(2, 'Russ & Daughters', '179 E Houston St, New York, NY 10002, United States', 0, 0, 1, 1, 1, 1, 20),
(2, 'Xi''an Famous Foods', '​​45 Bayard St, New York, NY 10013, United States', 0, 1, 0, 1, 1, 0, 13),
(3, 'Gary Danko', '800 N Point St, San Francisco, CA 94109', 0, 0, 0, 1, 1, 1, 250),
(3, 'Tartine Bakery', '600 Guerrero St, San Francisco, CA 94110', 0, 0, 0, 1, 0, 1, 15),
(3, 'Burma Superstar', '309 Clement St, San Francisco, CA 94118', 0, 0, 0, 1, 1, 1, 25),
(4, 'The Inn at Little Washington', '309 Middle St, Washington, VA 22747, United States', 0, 0, 0, 1, 1, 1, 450),
(4, 'Founding Farmers DC', '1924 Pennsylvania Ave NW, Washington, DC 20006, United States', 0, 0, 0, 1, 1, 1, 25),
(4, 'Rose''s Luxury', '717 8th St SE, Washington, DC 20003, United States', 0, 0, 0, 1, 1, 1, 55),
(5, 'Addison Restaurant', '5200 Grand Del Mar Way, San Diego, CA 92130, United States', 0, 0, 0, 1, 1, 1, 150),
(5, 'The Crack Shack', '2266 Kettner Blvd, San Diego, CA 92101, United States', 0, 0, 0, 1, 1, 1, 25),
(5, 'Phil''s BBQ', '3750 Sports Arena Blvd, San Diego, CA 92110, United States', 0, 0, 0, 1, 0, 1, 30),
(6, "Commander's Palace", '1403 Washington Ave, New Orleans, LA 70130, United States', 0, 0, 0, 1, 1, 1, 85),
(6, 'Cafe Du Monde', '800 Decatur St, New Orleans, LA 70116, United States', 0, 0, 0, 0, 1, 1, 5),
(6, 'Cochon Butcher', '930 Tchoupitoulas St, New Orleans, LA 70130, United States', 0, 0, 0, 1, 1, 1, 20),
(7, 'Latitudes', '245 Front St, Key West, FL 33040, United States', 0, 0, 0, 1, 1, 1, 85),
(7, 'Blue Heaven', '729 Thomas St, Key West, FL 33040, United States', 0, 0, 0, 1, 1, 1, 25),
(7, "Santiago's Bodega", '207 Petronia St, Key West, FL 33040, United States', 0, 0, 0, 1, 1, 1, 35),
(8, 'Oleana', '134 Hampshire St, Cambridge, MA 02139, United States', 0, 0, 0, 1, 1, 1, 60),
(8, 'Neptune Oyster', '63 Salem St, Boston, MA 02113, United States', 0, 0, 0, 0, 1, 1, 40),
(8, 'Island Creek Oyster Bar', '500 Commonwealth Avenue, Boston, MA 02215, United States', 0, 0, 0, 1, 1, 1, 50),
(9, 'Element 47', '675 E Durant Ave, Aspen, CO 81611, United States', 0, 0, 0, 1, 1, 1, 95),
(9, 'Matsuhisa', '303 E Main St, Aspen, CO 81611, United States', 0, 0, 0, 0, 0, 1, 90),
(9, 'Pyramid Bistro', '221 E Main St, Aspen, CO 81611, United States', 0, 0, 0, 1, 1, 1, 50),
(10, 'Canlis', '2576 Aurora Ave N, Seattle, WA 98109, United States', 0, 0, 0, 0, 1, 1, 150),
(10, 'Pike Place Chowder', '1530 Post Alley, Seattle, WA 98101, United States', 0, 0, 0, 1, 1, 1, 20),
(10, 'Salumi', '404 Occidental Ave S, Seattle, WA 98104, United States', 0, 0, 0, 1, 0, 1, 25),
(11, 'KYU', '251 NW 25th St, Miami, FL 33127, United States', 0, 0, 0, 1, 1, 1, 55),
(11, "Joe's Stone Crab", '11 Washington Ave, Miami Beach, FL 33139, United States', 0, 0, 0, 0, 0, 0, 60),
(11, 'La Sandwicherie', '229 14th St, Miami Beach, FL 33139, United States', 0, 0, 0, 1, 1, 1, 15),
(12, 'Joel Robuchon', ' MGM Grand, 3799 S Las Vegas Blvd, Las Vegas, NV 89109, United States', 0, 0, 0, 0, 1, 1, 400),
(12, 'Raku', '5030 Spring Mountain Rd #2, Las Vegas, NV 89146, United States', 0, 0, 0, 1, 1, 1, 40),
(12, 'Lotus of Siam', '620 E Flamingo Rd, Las Vegas, NV 89119, United States', 0, 0, 0, 1, 0, 1, 30),
(13, "Bohanan's Prime Steaks and Seafood", '219 E Houston St, San Antonio, TX 78205, United States', 0, 0, 0, 0, 0, 0, 90),
(13, 'The Esquire Tavern', '155 E Commerce St, San Antonio, TX 78205, United States', 0, 0, 0, 1, 1, 1, 25),
(13, 'La Panadería', '8305 Broadway St, San Antonio, TX 78209, United States', 0, 0, 0, 1, 1, 1, 15),
(14, 'Simon & Seaforts', '420 L St, Anchorage, AK 99501, United States', 0, 0, 0, 0, 1, 1, 50),
(14, 'Moose''s Tooth Pub and Pizzaria', '3300 Old Seward Hwy, Anchorage, AK 99503, United States', 0, 0, 0, 1, 1, 1, 25),
(14, 'Snow City Cafe', '1034 W 4th Ave, Anchorage, AK 99501, United States', 0, 0, 0, 1, 1, 1, 20);

INSERT INTO Museums (LocationID, MuseumName, Address, Subject, Price) VALUES
(1, 'Bishop Museum', '1525 Bernice Street, Honolulu, HI 96817', 'Natural and cultural history of Hawaii and the Pacific', 25),
(1, 'Pacific Aviation Museum Pearl Harbor', '319 Lexington Blvd, Honolulu, HI 96818', 'History of aviation in the Pacific, particularly during World War II', 25),
(1, 'USS Bowfin Submarine Museum & Park', '11 Arizona Memorial Dr, Honolulu, HI 96818', 'History of the USS Bowfin submarine and the role of submarines in World War II', 15),
(2, 'The Metropolitan Museum of Art', '1000 5th Ave, New York, NY 10028', 'Art and artifacts from around the world', 0),
(2, 'American Museum of Natural History', 'Central Park West & 79th St, New York, NY 10024', 'Natural history', 28),
(2, 'The Museum of Modern Art', '11 W 53rd St, New York, NY 10019', 'Modern and Contemporary Art', 25),
(3, 'San Francisco Museum of Modern Art', '151 3rd St, San Francisco, CA 94103', 'Modern and contemporary art', 25),
(3, 'California Academy of Sciences', '55 Music Concourse Dr, San Francisco, CA 94118', 'Natural history', 40),
(3, 'Exploratorium', 'Pier 15, The Embarcadero, San Francisco, CA 94111', 'Science, art, and human perception', 35),
(4, 'Smithsonian National Museum of Natural History', '10th St. & Constitution Ave. NW, Washington, DC 20560', 'Natural history', 0),
(4, 'National Air and Space Museum', 'Independence Ave at 6th St SW, Washington, DC 20560', 'Aviation and space exploration history', 0),
(4, 'National Museum of American History', '14th St. & Constitution Ave. NW, Washington, DC 20560', 'History of the United States', 0),
(5, 'USS Midway Museum', '910 N Harbor Dr, San Diego, CA 92101', 'History of the USS Midway aircraft', 26),
(5, 'San Diego Museum of Art', '1450 El Prado, San Diego, CA 92101', 'Art', 15),
(5, 'San Diego Natural History Museum', '1788 El Prado, San Diego, CA 92101', 'Natural history', 19.95),
(6, 'The National WWII Museum', '945 Magazine St, New Orleans, LA 70130', 'History of World War II', 29),
(6, 'New Orleans Museum of Art', '1 Collins Diboll Cir, New Orleans, LA 70124', 'Art', 15),
(6, 'The Historic New Orleans Collection', '533 Royal St, New Orleans, LA 70130', 'History and culture of New Orleans and the Gulf South', 0),
(7, 'The Ernest Hemingway Home and Museum', '907 Whitehead St, Key West, FL 33040', 'Dedicated to Ernest Hemingway’s life and works', 15),
(7, 'Key West Butterfly and Nature Conservatory', "1316 Duval St, Key West, FL 33040", "Butterfly Park",10),
(8, 'Museum of Fine Arts Boston', '465 Huntington Ave, Boston, MA 02115', 'Art from around the world', 25.00),
(8, 'Isabella Stewart Gardner Museum', '25 Evans Way, Boston, MA 02115', 'Art collection and a Venetian-style palace', 20.00),
(8, 'Boston Children\'s Museum', '308 Congress St, Boston, MA 02210', 'Interactive exhibits for children', 19.00),
(9, 'Aspen Art Museum', '637 East Hyman Avenue, Aspen, CO 81611', 'Art', 0.0),
(9, 'Aspen Historical Society', '620 W. Bleeker St, Aspen C) 81611', 'Art', 25),
(9, 'Red Brick Center for the Arts', '110 E. Hallam St, Aspen Colorado', 'Art', 15),
(10, 'Museum of Pop Culture', '325 5th Ave N, Seattle, WA 98109', 'Exhibits on music, science fiction, and popular culture', 33.00),
(10, 'Seattle Art Museum', '1300 1st Ave, Seattle, WA 98101', 'Art from around the world', 24.99),
(10, 'Wing Luke Museum of the Asian Pacific American Experience', '719 S King St, Seattle, WA 98104', 'Exhibits on the history, culture, and art of Asian Pacific Americans', 18.00),
(11, 'Pérez Art Museum Miami', '1103 Biscayne Blvd, Miami, FL 33132', 'Modern and contemporary art', 16.00),
(11, 'Frost Science Museum', '1101 Biscayne Blvd, Miami, FL 33132', 'Science and technology exhibits', 32.00),
(11, 'HistoryMiami Museum', '101 W Flagler St, Miami, FL 33130', 'Exhibits on the history and culture of Miami and South Florida', 10.00),
(12, 'The Mob Museum', '300 Stewart Ave, Las Vegas, NV 89101', 'Exhibits on the history of organized crime and law enforcement in the United States', 29.95),
(12, 'The Neon Museum', '770 Las Vegas Blvd N, Las Vegas, NV 89101', 'A collection of vintage Las Vegas neon signs', 28.00),
(12, 'The National Atomic Testing Museum', '755 E Flamingo Rd, Las Vegas, NV 89119', 'Exhibits on the history of nuclear testing and atomic energy in the United States', 22.00),
(13, 'The Alamo', '300 Alamo Plaza, San Antonio, TX 78205', 'A historic mission and site of the famous battle for Texan independence', 0.0),
(13, 'The San Antonio Museum of Art', '200 W Jones Ave, San Antonio, TX 78215', 'Exhibits on art and culture from around the world', 15.00),
(13, 'The Witte Museum', '3801 Broadway St, San Antonio, TX 78209', 'Exhibits on natural history, science, and South Texas heritage', 15.00),
(14, 'Anchorage Museum', '625 C St, Anchorage, AK 99501', 'Exhibits on Alaska history, art, and science', 20.00),
(14, 'Alaska Aviation Museum', '4721 Aircraft Dr, Anchorage, AK 99502', 'Exhibits on aviation history and technology in Alaska', 15.00),
(14, 'Alaska Native Heritage Center', '8800 Heritage Center Dr, Anchorage, AK 99504', "Exhibits on the history and culture of Alaska's indigenous peoples", 24.95);

INSERT INTO Clubs (LocationID, ClubName, Address, Price)
VALUES
(1, 'Mulligans on the Blue', '100 Kaukahi St, Wailea, HI 96753', 20),
(1, 'Ambrosia Martini Lounge', '1913 S Kihei Rd, Kihei, HI 96753', 15),
(1, 'South Shore Tiki Lounge', '1913-J S Kihei Rd, Kihei, HI 96753', 10),
(2, 'The Flatiron Room', '37 W 26th St, New York, NY 10010', 25),
(2, 'The Box', '189 Chrystie St, New York, NY 10002', 50),
(2, '1 OAK', '453 W 17th St, New York, NY 10011', 30),
(3, 'DNA Lounge', '375 11th St, San Francisco, CA 94103', 20),
(3, 'Love + Propaganda', '85 Campton Pl, San Francisco, CA 94108', 30),
(3, 'Hawthorn', '46 Geary St, San Francisco, CA 94108', 25),
(4, 'Club Barcode', '1101 17th St NW, Washington, DC 20036', 20),
(4, 'Club Eighteenth Street Lounge', '1212 18th St NW, Washington, DC 20036', 15),
(4, 'Echostage', '2135 Queens Chapel Rd NE, Washington, DC 20018', 25),
(5, 'The Tipsy Crow', '770 5th Ave, San Diego, CA 92101', 20),
(5, 'Onyx Room', '852 5th Ave, San Diego, CA 92101', 25),
(5, 'Parq Nightclub', '615 Broadway, San Diego, CA 92101', 30),
(6, 'Joy Theater', '1200 Canal St, New Orleans, LA 70112', 30),
(6, 'The Willow', '8200 Willow St, New Orleans, LA 70118', 20),
(6, 'Gasa Gasa', '4920 Freret St, New Orleans, LA 70115', 15),
(7, 'Club Coconuts', '424 Greene St, Key West, FL, 33040', 25),
(7, "Dante's", '951 Caroline St, Key West, FL, 33040', 20),
(7, "Hog's Breath Saloon", '400 Front St, Key West, FL, 33040', 15),
(8, 'Good Life', '28 Kingston St, Boston, MA 02111', 20),
(8, 'Royale', '279 Tremont St, Boston, MA 02116', 30),
(8, 'Bijou Nightclub & Lounge', '51 Stuart St, Boston, MA 02116', 25),
(9, 'Belly Up Aspen', '450 S Galena St, Aspen, CO 81611', 40),
(9, 'Aspen Underground', '634 E Hyman Ave, Aspen, CO 81611', 25),
(9, 'Eric''s Bar', '315 E Hyman Ave, Aspen, CO 81611', 20),
(10, 'Baltic Room', '1207 Pine St, Seattle, WA 98101', 20),
(10, 'Monkey Loft', '2915 1st Ave S, Seattle, WA 98134', 25),
(10, 'Q Nightclub', '1426 Broadway, Seattle, WA 98122', 30),
(11, 'Space Miami', '34 NE 11th St, Miami, FL 33132', 20),
(11, 'Club Space Miami', '34 NE 11th St, Miami, FL 33132', 30),
(11, 'E11EVEN MIAMI', '29 NE 11th St, Miami, FL 33132', 40),
(12, 'Hakkasan Las Vegas Nightclub', '3799 S Las Vegas Blvd, Las Vegas, NV 89109', 30),
(12, 'OMNIA Nightclub', '3570 S Las Vegas Blvd, Las Vegas, NV 89109', 40),
(12, 'Marquee Nightclub', '3708 S Las Vegas Blvd, Las Vegas, NV 89109', 50),
(13, 'Stereo Live San Antonio', '3503 S Presa St, San Antonio, TX 78210', 20),
(13, 'The Bonham Exchange', '411 Bonham St, San Antonio, TX 78205', 15),
(13, 'Heat Nightclub', '1500 N Main Ave, San Antonio, TX 78212', 10),
(14, 'The Avenue Bar', '338 W 4th Ave, Anchorage, AK 99501', 10),
(14, 'Williwaw Social', '609 F St, Anchorage, AK 99501', 15),
(14, 'Koot''s', '2435 Spenard Rd, Anchorage, AK 99503', 20);


INSERT INTO Classes (LocationID, ClassName, Address, Skill, Price)
VALUES 
(1, 'Pottery Workshop', '123 Main St,Kahului,HI,96732', 'Pottery', 75),
(1, 'Painting Class', '456 Beach Rd,Lahaina,HI,96761', 'Painting', 50),
(1, 'Yoga Session', '789 Sunset Blvd,Kihei,HI,96753', 'Yoga', 20),
(2, 'Pottery Workshop', '223 East 23rd St, New York, NY, 10010', 'Pottery', 75),
(2, 'Painting Class', '208 W 29th St, New York, NY, 10001', 'Painting', 50),
(2, 'Yoga Session', '245 W 29th St, New York, NY, 10001', 'Yoga', 20),
(3, 'Pottery Workshop', '1434 62nd St, Emeryville, CA,94608', 'Pottery', 65),
(3, 'Painting Class', '1777 Yosemite Ave, San Francisco, CA,94124', 'Painting', 60),
(3, 'Yoga Session', '1928 Irving St, San Francisco, CA,94122', 'Yoga', 25),
(4, 'Pottery Workshop', '716 Monroe St NE, Washington, DC,20017', 'Pottery', 70),
(4, 'Painting Class', '4439 Wisconsin Ave NW, Washington, DC,20016', 'Painting', 55),
(4, 'Yoga Session', '632 Rhode Island Ave NE, Washington, DC,20002', 'Yoga', 15),
(5, 'Pottery Workshop', '4318 Euclid Ave, San Diego, CA,92115', 'Pottery', 80),
(5, 'Painting Class', '1620 National Ave, San Diego, CA,92113', 'Painting', 45),
(5, 'Yoga Session', '6309 College Grove Dr, San Diego, CA,92115', 'Yoga', 20),
  (6,'Pottery Workshop','1020 Erato St, New Orleans, LA,70130','Pottery', 75),
  (6,'Painting Class','7800 Maple St, New Orleans, LA,70118','Painting', 50),
  (6,'Yoga Session','4900 Canal St, New Orleans, LA,70119','Yoga', 10),
  (7,'Pottery Workshop','1205 Truman Ave, Key West, FL,33040','Pottery', 90),
  (7,'Painting Class','600 Whitehead St, Key West, FL,33040','Painting', 65),
  (7,'Yoga Session','529 United St, Key West, FL,33040','Yoga', 15),
  (8,'Pottery Workshop','27 Thayer St, Boston, MA,02118','Pottery', 85),
  (8,'Painting Class','450 Harrison Ave, Boston, MA,02118','Painting', 55),
  (8,'Yoga Session','303 Columbus Ave, Boston, MA,02116','Yoga', 20),
  (9,'Pottery Workshop','801 E Hyman Ave, Aspen, CO,81611','Pottery', 100),
  (9,'Painting Class','690 Carriage Way, Snowmass Village, CO,81615','Painting', 70),
  (9,'Yoga Session','720 E Hyman Ave, Aspen, CO,81611','Yoga', 25),
  (10,'Pottery Workshop','224 Nickerson St, Seattle, WA,98109','Pottery', 80),
  (10,'Painting Class','415 Westlake Ave N, Seattle, WA,98109','Painting', 60),
  (10,'Yoga Session','2238 NW Market St, Seattle, WA,98107','Yoga', 30),
  (11,'Pottery Workshop','380 NE 59th Ter, Miami, FL,33137','Pottery', 95),
  (11,'Painting Class','4649 Ponce De Leon Blvd, Coral Gables, FL,33146','Painting', 75),
  (11,'Yoga Session','1550 Lenox Ave, Miami Beach, FL,33139','Yoga', 25),
  (12,'Pottery Workshop','3955 W Diablo Dr, Las Vegas, NV 89118','Pottery', 90),
  (12,'Painting Class','101 S Rainbow Blvd, Las Vegas, NV 89145','Painting', 75),
  (12,'Cooking Class','953 E Sahara Ave, Las Vegas, NV 89104','Cooking', 100),
  (13,'Pottery Workshop','602 NW Loop 410, San Antonio, TX 78216','Pottery', 80),
  (13,'Drawing Class','1420 S Alamo St #106, San Antonio, TX 78204','Drawing', 65),
  (13,'Cooking Class','120 Heiman St, San Antonio, TX 78205','Cooking', 95),
  (14, 'Pottery Workshop', '1415 E Tudor Rd, Anchorage, AK 99507', 'Pottery', 110),
  (14, 'Photography Class', '333 W 4th Ave, Anchorage, AK 99501', 'Photography', 95),
  (14, 'Cooking Class', '2300 E 88th Ave, Anchorage, AK 99507', 'Cooking', 120);

INSERT INTO TrailsHike (LocationID, TrailName, Address, Distance) VALUES
(1, 'Haleakalā National Park - Pipiwai Trail', 'Kula, HI 96790, United States', 4),
(1, 'Waihee Ridge Trail', 'Waiehu, HI 96793, United States', 5.5),
(1, 'Ka\'ena Point Trail', 'Maui County, HI, United States', 5.6),
(2, 'Central Park Loop', 'Central Park, New York, NY 10024, United States', 6.1),
(2, 'The High Line', '820 Washington St, New York, NY 10014, United States', 1.5),
(2, 'Inwood Hill Park Trail', 'Payson Ave &, Dyckman St, New York, NY 10034, United States', 2.3),
(3, 'Lands End Trail', '680 Point Lobos Ave, San Francisco, CA 94121, United States', 3.3),
(3, 'Mount Sutro Loop Trail', '17 Medical Center Way, San Francisco, CA 94143, United States', 2.6),
(3, 'Presidio Trail', 'San Francisco, CA 94129, United States', 5.1),
(4, 'Rock Creek Park Trail', 'Washington, D.C. 20015, United States', 14.7),
(4, 'C&O Canal Towpath', '1057 Thomas Jefferson St NW, Washington, D.C. 20007, United States', 184.5),
(4, 'Theodore Roosevelt Island Trail', 'George Washington Memorial Pkwy, McLean, VA 22101, United States', 1.7),
(5, 'Torrey Pines State Natural Reserve', '12600 N Torrey Pines Rd, La Jolla, CA 92037, United States', 3.1),
(5, 'Cowles Mountain Trail', '6980 Golfcrest Dr, San Diego, CA 92119, United States', 3),
(5, 'Mission Trails Regional Park', '1 Father Junipero Serra Trail, San Diego, CA 92119, United States', 5.5),
(6, 'Couturie Forest', 'New Orleans, LA 70124, United States', 3),
(6, 'Bayou Sauvage Ridge Trail', 'National Wildlife Refuges, 61389 LA-434, Lacombe, LA 70445, United States', 8.5),
(6, 'Jean Lafitte National Historical Park and Preserve', '6588 Barataria Blvd, Marrero, LA 70072, United States', 4.5),
(7, 'Fort Zachary Taylor State Park', '601 Howard England Way, Key West, FL 33040, United States', 1.5),
(7, 'Curry Hammock State Park', '56200 Overseas Hwy, Marathon, FL 33050, United States', 1.5),
(7, 'Key West Tropical Forest and Botanical Garden', '5210 College Rd, Key West, FL 33040, United States', 1.5),
(8, 'Boston Common', '139 Tremont St, Boston, MA 02111, United States', 1.5),
(8, 'Arnold Arboretum', '125 Arborway, Boston, MA 02130, United States', 6.5),
(8, 'Esplanade', 'Boston, MA 02114, United States', 3.5),
(9, 'Maroon Bells Scenic Trail', 'Maroon Creek Rd, Aspen, CO 81611, United States', 3.3),
(9, 'Cathedral Lake Trail', 'Castle Creek Rd, Aspen, CO 81611, United States', 5.6),
(9, 'Smuggler Mountain Trail', 'Smuggler Mountain Rd, Aspen, CO 81611, United States', 3.6),
(10, 'Discovery Park Loop Trail', '3801 Discovery Park Blvd, Seattle, WA 98199, United States', 2.8),
(10, 'Rattlesnake Ledge Trail', '37581 SE 79th St, Snoqualmie Pass, WA 98068, United States', 4.0),
(10, 'Mount Si Trail', '1275 SE North Bend Way, North Bend, WA 98045, United States', 8.0),
(11, 'Bill Baggs Cape Florida State Park', '1200 Crandon Blvd, Key Biscayne, FL 33149, United States', 1.5),
(11, 'Oleta River State Park Trail', '3400 NE 163rd St, North Miami Beach, FL 33160, United States', 15.0),
(11, 'Shark Valley Trail', '36000 SW 8th St, Miami, FL 33194, United States', 15.0),
(12, 'Red Rock Canyon National Conservation Area', '1000 Scenic Loop Dr, Las Vegas, NV 89161, United States', 2.0),
(12, 'Ice Box Canyon Trail', '1000 Scenic Loop Dr, Las Vegas, NV 89161, United States', 3.6),
(12, 'Mary Jane Falls Trail', 'Trail Canyon Rd, Mt Charleston, NV 89124, United States', 3.0),
(13, 'Government Canyon State Natural Area', '12861 Galm Rd, San Antonio, TX 78254, United States', 8.4),
(13, 'Eisenhower Park Trail', '19399 NW Military Hwy, San Antonio, TX 78257, United States', 3.0),
(13, 'Friedrich Wilderness Park', '21395 Milsa Dr, San Antonio, TX 78256, United States', 4.0),
(14, 'Flattop Mountain Trail', 'Glen Alps Rd, Anchorage, AK 99516, United States', 3.0),
(14, 'Tony Knowles Coastal Trail', 'W 2nd Ave & F St, Anchorage, AK 99501, United States', 11.0),
(14, 'Winner Creek Trail', 'Seward Hwy, Girdwood, AK 99587, United States', 6.0);

INSERT INTO Monuments (LocationID, MonumentName, Address, Price)
VALUES (1, "Haleakala National Park", "Haleakala Hwy, Kula, HI 96790", 30),
(1, "Road to Hana", "Hana Hwy, Maui, HI", 0),
(1, "Waihee Ridge Trail", "Waiehu Beach Rd, Wailuku, Maui, HI 96793", 0),
(2, "Statue of Liberty", "Liberty Island, New York, NY 10004", 21),
(2, "Empire State Building", "20 W 34th St, New York, NY 10001", 45),
(2, "One World Trade Center", "285 Fulton St, New York, NY 10007", 39),
(3, "Golden Gate Bridge", "Golden Gate Bridge, San Francisco, CA 94129", 0),
(3, "Alcatraz Island", "Alcatraz Island, San Francisco, CA 94133", 39),
(3, "Painted Ladies", "Steiner St &, Hayes St, San Francisco, CA 94117", 0),
(4, "Lincoln Memorial", "2 Lincoln Memorial Cir NW, Washington, DC 20037", 0),
(4, "Washington Monument", "2 15th St NW, Washington, DC 20007", 0),
(4, "United States Capitol", "First St SE, Washington, DC 20004", 0),
(5, "Torrey Pines State Natural Reserve", "12600 N Torrey Pines Rd, La Jolla, San Diego, CA 92037", 15),
(5, "Balboa Park", "1549 El Prado, San Diego, CA 92101", 0),
(5, "Cabrillo National Monument", "1800 Cabrillo Memorial Dr, San Diego, CA 92106", 20.00),
(6, "Jackson Square", "700 Decatur St, New Orleans, LA 70116", 0),
(6, "St. Louis Cathedral", "615 Pere Antoine Alley, New Orleans, LA 70116", 0),
(6, "French Quarter", "New Orleans, LA 70116", 0),
(7, "Ernest Hemingway Home and Museum", "907 Whitehead St, Key West, FL 33040", 15),
(7, "Southernmost Point Buoy", "Whitehead St &, South St, Key West, FL 33040", 0),
(7, "Harry S. Truman Little White House", "111 Front St, Key West, FL 33040", 21),
(8, 'Fenway Park', '4 Jersey St, Boston, MA 02215', 20),
(8, 'Boston Tea Party Ships & Museum', '306 Congress St, Boston, MA 02210', 30),
(8, 'USS Constitution Museum', 'Building 22, Charlestown Navy Yard, Boston, MA 02129', 15),
(9, 'Maroon Bells', 'Maroon Creek Rd, Aspen, CO 81611', 10),
(9, 'Independence Pass', 'Colorado 82, Aspen, CO 81611', 0),
(9, 'Aspen Art Museum', '637 E Hyman Ave, Aspen, CO 81611', 0),
(10, 'Space Needle', '400 Broad St, Seattle, WA 98109', 34),
(10, 'Pike Place Market', '85 Pike St, Seattle, WA 98101', 0),
(10, 'Chihuly Garden and Glass', '305 Harrison St, Seattle, WA 98109', 0),
(11, 'Vizcaya Museum and Gardens', '3251 S Miami Ave, Miami, FL 33129', 22),
(11, 'Art Deco Historic District', '1001 Ocean Dr, Miami Beach, FL 33139', 0),
(11, 'Holocaust Memorial Miami Beach', '1933-1945 Meridian Ave, Miami Beach, FL 33139', 0),
(12, 'The Welcome to Fabulous Las Vegas Sign', '5200 S Las Vegas Blvd, Las Vegas, NV 89119', 0),
(12, 'High Roller Observation Wheel', '3545 S Las Vegas Blvd, Las Vegas, NV 89109', 25),
(12, 'Hoover Dam', 'U.S. 93, Boulder City, NV 89005', 30),
(13, 'The Alamo', '300 Alamo Plaza, San Antonio, TX 78205', 0),
(13, 'San Antonio River Walk', '849 E Commerce St, San Antonio, TX 78205', 0),
(13, 'Tower of the Americas', '739 E Cesar E. Chavez Blvd, San Antonio, TX 78205', 14.95),
(14, 'Anchorage Museum', '625 C St, Anchorage, AK 99501', 18),
(14, 'Alaska Native Heritage Center', '8800 Heritage Center Dr, Anchorage, AK 99504', 26),
(14, 'Anchorage Memorial Park Cemetery', '535 E 9th Ave, Anchorage, AK 99501', 0);

INSERT INTO Parks (LocationID, ParkName, Address, Price) VALUES 
(1, 'Haleakala National Park', 'Haleakala Hwy, Kula, HI 96790', 30),
(1, 'Iao Valley State Park', '54 S High St, Wailuku, HI 96793', 5),
(1, 'Maui Nui Botanical Gardens', '150 Kanaloa Ave, Kahului, HI 96732', 10),
(2, 'Central Park', 'Central Park, New York, NY 10022', 0),
(2, 'The High Line', 'New York, NY 10011', 0),
(2, 'Battery Park', 'New York, NY 10004', 0),
(3, 'Golden Gate Park', '501 Stanyan St, San Francisco, CA 94117', 0),
(3, 'Dolores Park', '19th St &, Dolores St, San Francisco, CA 94114', 0),
(3, 'Presidio of San Francisco', 'San Francisco, CA 94129', 0),
(4, 'National Mall and Memorial Parks', '900 Ohio Drive SW, Washington, D.C.', 0),
(4, 'Rock Creek Park', '5200 Glover Rd NW, Washington, D.C.', 0),
(4, 'Meridian Hill Park', '2400 15th St NW, Washington, D.C.', 0),
(5, 'Balboa Park', '1549 El Prado, San Diego, CA 92101', 10),
(5, 'La Jolla Cove', '1100 Coast Blvd, La Jolla, CA 92037', 0),
(5, 'Torrey Pines State Natural Reserve', '12600 N Torrey Pines Rd, La Jolla, CA 92037', 12),
(6, 'City Park', '1 Palm Dr, New Orleans, LA 70124', 0),
(6, 'Audubon Park', '6500 Magazine St, New Orleans, LA 70118', 0),
(6, 'Woldenberg Riverfront Park', '1 Canal St, New Orleans, LA 70130', 0),
(7, 'South Pointe Park', '1 Washington Ave, Miami Beach, FL 33139', 0),
(7, 'Lummus Park', '1130 Ocean Dr, Miami Beach, FL 33139', 0),
(7, 'Bayfront Park', '301 Biscayne Blvd, Miami, FL 33132', 0),
(8, 'Boston Common', '139 Tremont St, Boston, MA 02111', 0),
(8, 'Franklin Park Zoo', '1 Franklin Park Rd, Boston, MA 02121', 20),
(8, 'Arnold Arboretum', '125 Arborway, Boston, MA 02130', 0),
(9, 'Maroon Bells-Snowmass Wilderness', '100 Maroon Creek Rd, Aspen, CO 81611', 10),
(9, 'Independence Pass', 'Roaring Fork Rd, Aspen, CO 81611', 0),
(9, 'Hunter Creek Trail', 'Hunter Creek Rd, Aspen, CO 81611', 0),
(10, 'Discovery Park', '3801 Discovery Park Blvd, Seattle, WA 98199', 0),
(10, 'Gas Works Park', '2101 N Northlake Way, Seattle, WA 98103', 0),
(10, 'Kerry Park', '211 W Highland Dr, Seattle, WA 98119', 0),
(11, 'South Pointe Park', '1 Washington Ave, Miami Beach, FL 33139', 0),
(11, 'Bayfront Park', '301 N. Biscayne Blvd, Miami, FL 33132', 0),
(11, 'Amelia Earhart Park', '401 E 65th St, Hialeah, FL 33013', 6),
(12, 'Red Rock Canyon National Conservation Area', '1000 Scenic Loop Dr, Las Vegas, NV 89161', 15),
(12, 'Valley of Fire State Park', '29450 Valley of Fire Road, Overton, NV 89040', 10),
(12, 'Floyd Lamb Park', '9200 Tule Springs Rd, Las Vegas, NV 89131', 0),
(13, 'Brackenridge Park', '3910 N St Mary''s St, San Antonio, TX 78212', 0),
(13, 'Hemisfair', '434 S Alamo St, San Antonio, TX 78205', 0),
(13, 'Government Canyon State Natural Area', '12861 Galm Rd, San Antonio, TX 78254', 6),
(14, 'Kincaid Park', '9401 Raspberry Road, Anchorage, AK 99502', 0),
(14, 'Tony Knowles Coastal Trail', '1541 W 2nd Ave, Anchorage, AK 99501', 0),
(14, 'Chugach State Park', '18620 Seward Hwy, Anchorage, AK 99516', 5);












