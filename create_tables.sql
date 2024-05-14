create database socialmedia
use socialmedia

--creating the tables

--'Users' table
CREATE TABLE users (
    user_id INTEGER identity(1,1) PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    profile_photo_url VARCHAR(255) DEFAULT 'https://picsum.photos/100',
    bio VARCHAR(255),
	created_at datetime2(3) DEFAULT convert(time,current_timestamp),
    email varchar(50) not null)

--'Photos' table
CREATE TABLE photos (
    photo_id INTEGER identity(1,1) PRIMARY KEY,
    photo_url VARCHAR(255) NOT NULL UNIQUE,
    post_id	INTEGER NOT NULL,
    created_at datetime2(3) DEFAULT convert(time,current_timestamp),
    size FLOAT CHECK (size<5)
)

--'Videos' table
CREATE TABLE videos (
  video_id INTEGER identity(1,1) PRIMARY KEY,
  video_url VARCHAR(255) NOT NULL UNIQUE,
  post_id INTEGER NOT NULL,
  created_at datetime2(3) DEFAULT convert(time,current_timestamp),
  size FLOAT CHECK (size<10)
)

--'Post' table
CREATE TABLE post (
	post_id INTEGER identity(1,1) PRIMARY KEY,
    photo_id INTEGER,
    video_id INTEGER,
    user_id INTEGER NOT NULL,
    caption VARCHAR(200), 
    location VARCHAR(50) ,
    created_at datetime2(3) DEFAULT convert(time,current_timestamp),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
	FOREIGN KEY(photo_id) REFERENCES photos(photo_id),
    FOREIGN KEY(video_id) REFERENCES videos(video_id)
)

--'comments' table
CREATE TABLE comments (
    comment_id INTEGER identity(1,1) PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at datetime2(3) DEFAULT convert(time,current_timestamp),
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id)
)

--'post_likes' table
CREATE TABLE post_likes (
    user_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    created_at datetime2(3) DEFAULT convert(time,current_timestamp),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    PRIMARY KEY(user_id, post_id)
)

--'comment_likes' table
CREATE TABLE comment_likes (
    user_id INTEGER NOT NULL,
    comment_id INTEGER NOT NULL,
    created_at datetime2(3) DEFAULT convert(time,current_timestamp),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(comment_id) REFERENCES comments(comment_id),
    PRIMARY KEY(user_id, comment_id)
)

--'follows' table
CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at datetime2(3) DEFAULT convert(time,current_timestamp),
    FOREIGN KEY(follower_id) REFERENCES users(user_id),
    FOREIGN KEY(followee_id) REFERENCES users(user_id),
    PRIMARY KEY(follower_id, followee_id)
)

--'hashtags' table
CREATE TABLE hashtags (
  hashtag_id INTEGER identity(1,1) PRIMARY KEY,
  hashtag_name VARCHAR(255) UNIQUE,
  created_at datetime2(3) DEFAULT convert(time,current_timestamp)
)

--'hashtags_follow' table
CREATE TABLE hashtag_follow (
	user_id INTEGER NOT NULL,
    hashtag_id INTEGER NOT NULL,
    created_at datetime2(3) DEFAULT convert(time,current_timestamp),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(hashtag_id) REFERENCES hashtags(hashtag_id),
    PRIMARY KEY(user_id, hashtag_id)
)

--'post_tags' table
CREATE TABLE post_tags (
    post_id INTEGER NOT NULL,
    hashtag_id INTEGER NOT NULL,
    FOREIGN KEY(post_id) REFERENCES post(post_id),
    FOREIGN KEY(hashtag_id) REFERENCES hashtags(hashtag_id),
    PRIMARY KEY(post_id, hashtag_id)
)

--'bookmarks' table
CREATE TABLE bookmarks (
  post_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  created_at datetime2(3) DEFAULT convert(time,current_timestamp),
  FOREIGN KEY(post_id) REFERENCES post(post_id),
  FOREIGN KEY(user_id) REFERENCES users(user_id),
  PRIMARY KEY(user_id, post_id)
)

--'login' table
CREATE TABLE login (
  login_id INTEGER NOT NULL identity(1,1) PRIMARY KEY,
  user_id INTEGER NOT NULL,
  ip VARCHAR(50) NOT NULL,
  login_time datetime2(3) NOT NULL DEFAULT convert(time,current_timestamp),
  FOREIGN KEY(user_id) REFERENCES users(user_id)
)
