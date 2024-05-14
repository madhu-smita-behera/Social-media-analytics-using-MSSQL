# Social-media-analytics-using-MSSQL
Extracting meaningful insights from Social media database using MSSQL

## Summary:
The 'Social Media Analytics using MSSQL' project leverages Microsoft SQL Server for analyzing vast amounts of social media data. Through advanced querying and analytics techniques, it extracts valuable insights regarding user behavior, sentiment analysis, and trends across various platforms. By integrating SQL's powerful features with social media APIs, the project enables businesses to make data-driven decisions, optimize marketing strategies, and enhance customer engagement. This initiative underscores the importance of harnessing structured data from social media to drive business growth and gain competitive advantages in the digital landscape.

## Data:
### 'Users' table :
Users table contain information about user id, username, profile photo link, bio of the user, time at which user created account and email id of the user. It contains 50 rows of data.
### 'Photos' table:
Photos contains information about photo id, photo link, post id, time at which post was created and size of the photo. It also contains 50 rows.
### 'Videos' table:
Videos table contains information about video id, video link, post id, time at which post was created and size of the video. It also contains 50 rows.
### 'Post' table:
Post table contains information about post id,photo id, video id, user id, caption of the post, location, and time at which post was created. It contains 100 rows.
### 'Comments' table:
Comments table contains information about comment id, comment text, post id, user id, and time at which post was created. It contains 199 rows.
### 'post_likes' table:
post_likes table contains information about user id, post id, and time at which post was created. It contains 1707 rows.
### 'comment_likes' table:
comment_likes table contains information about user id, comment id, and time at which post was created. It contains 381 rows.
### 'Follows' table:
Follows table contains information about follower id, followee id, time at which post was created. It contains 1873 rows.
### 'Hashtags' table:
Hashtags table contains information about hashtag id, hashtag name, and time at which post was created. It contains 31 rows.
### 'hashtags_follow' table:
hashtags_follow table contains information about user id, hashtag id, and time at which post was created. It contains 30 rows.
### 'post_tags' table:
post_tags table contains information about post id, and hashtag id. It contains 377 rows.
### 'bookmarks' table:
bookmarks table contains information about post id, user id, and time at which post was created. It contains 194 rows.
### 'login' table:
login table contains information about login id, user id, ip address and the login time. It contains 31 rows.


##### I have used MS-SQL server (Microsoft SQL Server Management Studio-19) for this project. 


## Steps involved:
1. Creating database and the tables
2. Insert data into tables
3. Analyzing data using SQL queries

## Extracting data:
SQL provides varieties of commands to retrieve meaningful insights from the data. Some common commands I've used in this project are:
1. SELECT
2. FROM
3. WHERE
4. JOIN
5. GROUP BY
6. ORDER BY
7. few functions like aggregrate function(count), operator(like), top, round

## Conclusion:

In conclusion, the integration of social media analytics with MSSQL provides valuable insights into user behaviors and trends. Through robust data processing and analysis, this project empowers businesses to make informed decisions, enhance customer engagement, and optimize marketing strategies for maximum impact in the digital landscape.

## References:
I have followed a few sites and projects to obtain the dataset and queries which need to be worked on.
1. https://github.com/ssahibsingh/Social-Media-Database-Project/tree/9c3312aaf59acdce09fe6f4857e96b371fa58b40
2. https://www.linkedin.com/pulse/mysql-project-social-media-analytics-md-shahriar-shawon-qgpfc/
3. https://medium.com/@vmrajput20/social-media-analysis-with-mysql-6d6e7caafa8e

Thank you.

