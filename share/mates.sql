PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    user_id INTEGER primary key,
    username VARCHAR,
    password VARCHAR,
    UNIQUE(username, password)
);

DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
    user_id INTEGER,
    account_id INTEGER primary key,
    firstname VARCHAR,
    lastName VARCHAR,
    gender VARCHAR,
    dob NUMERIC,
    mobile VARCHAR,
    location VARCHAR,
    distance_preference VARCHAR,
    distance_preference_status BOOLEAN,
    interested VARCHAR,
    age_preference VARCHAR,
    age_preference_status BOOLEAN,
    language VARCHAR,
    push_notification BOOLEAN,
    UNIQUE(account_id, mobile),
    FOREIGN KEY(user_id) REFERENCES User(user_id)
);

DROP TABLE IF EXISTS events;
CREATE TABLE events (
    account_id INTEGER,
    event_id INTEGER primary key,
    activity VARCHAR,
    starttime TEXT,
    endtime TEXT,
    FOREIGN KEY(account_id) REFERENCES Accounts(account_id)
);

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
    account_id INTEGER,
    message_id INTEGER primary key,
    content VARCHAR,
    reciever_id VARCHAR,
    sender_id VARCHAR,
    sendtime TEXT,
    FOREIGN KEY(account_id) REFERENCES Accounts(account_id)
);

INSERT INTO users(username, password) VALUES ("Ashish", "pass123");
INSERT INTO users(username, password) VALUES ("Ayush", "pass456");
INSERT INTO users(username, password) VALUES ("Jayraj", "pass789");


-- INSERT INTO Account(firstname, lastName, gender, dob, mobile, location, distance_preference, distance_preference_status, interested, age_preference, age_preference_status, language, push_notification) VALUES ("Ashish","B", "Male", "1998-11-05","5675677656","Fullerton","10","TRUE","Women","25","True","English","True");


