CREATE DATABASE readme
	DEFAULT CHARACTER SET UTF8
	DEFAULT COLLATE utf8_general_ci;
	
	USE readme;
	
	CREATE TABLE hashtags (
		id INT AUTO_INCREMENT PRIMARY KEY,
		hashtag VARCHAR(64)
	);
	CREATE INDEX s_hashtag ON hashtags(hashtag);
	
	CREATE TABLE post_types (
		id INT AUTO_INCREMENT PRIMARY KEY,
		post_type VARCHAR(32),
		class_icon VARCHAR(32) 
	);
	
	CREATE TABLE users (
		id INT AUTO_INCREMENT PRIMARY KEY,
		login VARCHAR(128) NOT NULL UNIQUE,
		email VARCHAR(128) NOT NULL UNIQUE,
		password CHAR(64),
		reg_dt DATETIME,
		avatar_url TEXT
	);
	
	CREATE TABLE posts (
		id INT AUTO_INCREMENT PRIMARY KEY,
		publication_dt DATETIME,
		title VARCHAR(255),
		content VARCHAR(500),
		show_count INT,
		user_id INT,
		post_type INT,
		hashtag INT,
		FOREIGN KEY (user_id) REFERENCES users(id),
		FOREIGN KEY (post_type) REFERENCES post_types(id),
		FOREIGN KEY (hashtag) REFERENCES hashtags(id)
	);
	CREATE INDEX s_title ON posts(title);
	CREATE INDEX s_content ON posts(content);
	
	CREATE TABLE comments (
		id INT AUTO_INCREMENT PRIMARY KEY,
		comment_dt DATETIME,
		comment_content TEXT,
		user_id INT,
		post_id INT, 
		FOREIGN KEY (user_id) REFERENCES users(id),
		FOREIGN KEY (post_id) REFERENCES posts(id)
	);
	
	CREATE TABLE likes (
		id INT AUTO_INCREMENT PRIMARY KEY,
		user_id INT,
		post_id INT, 
		FOREIGN KEY (user_id) REFERENCES users(id),
		FOREIGN KEY (post_id) REFERENCES posts(id)
	);
	
	CREATE TABLE subscriptions (
		id INT AUTO_INCREMENT PRIMARY KEY,
		subscription INT,
		user_id INT,
		FOREIGN KEY (subscription) REFERENCES users(id),
		FOREIGN KEY (user_id) REFERENCES users(id)
	);
	
	CREATE TABLE messages (
		id INT AUTO_INCREMENT PRIMARY KEY,
		message_dt DATETIME,
		message_content TEXT,
		message_author INT,
		message_recipient INT,
		FOREIGN KEY (message_author) REFERENCES users(id),
		FOREIGN KEY (message_recipient) REFERENCES users(id)
	);
	
