PRAGMA foreign_keys=ON;
BEGIN TRANSACTION

DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
    user_id INTEGER primary key,
    username VARCHAR,
    pass VARCHAR,
    UNIQUE(username, password)
);

DROP TABLE IF EXISTS Accounts;
CREATE TABLE Accounts (
    user_id INTEGER
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

DROP TABLE IF EXISTS Events;
CREATE TABLE Events (
    account_id INTEGER
    event_id INTEGER primary key,
    activity VARCHAR,
    starttime TEXT,
    endtime TEXT,
    FOREIGN KEY(account_id) REFERENCES Accounts(account_id)
);

DROP TABLE IF EXISTS Messages;
CREATE TABLE Messages (
    account_id INTEGER
    message_id INTEGER primary key,
    content VARCHAR,
    reciever_id VARCHAR,
    sender_id VARCHAR,
    sendtime TEXT,
    FOREIGN KEY(account_id) REFERENCES Accounts(account_id)
);

