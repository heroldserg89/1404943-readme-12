CREATE DATABASE readme
	DEFAULT CHARSET SET utf8
	DEFAULT COLLATE utf8_general_ci;
	
	CREATE TABLE users (
		id INT AUTO_INCREMENT PRIMARY KEY,
		login VARCHAR(128) NOT NULL UNIQUE,
		email VARCHAR(128) NOT NULL UNIQUE,
		passwoed CHAR(64),
		reg_dt DATETIME,
		avatar_url VARCHAR;
	);
	
	CREATE TABLE posts(
		id INT AUTO_INCREMENT PRIMARY KEY,
		publication_dt DATETIME,
		title VARCHAR,
		show_count INT,
		
	);