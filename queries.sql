--let's see records in each table
select * from bookmarks           --194 rows
select * from comment_likes       --381 rows
select * from comments            --199 rows
select * from follows             --1873 rows
select * from hashtag_follow      --30 rows
select * from hashtags            --31 rows
select * from login               --100 rows
select * from photos              --50 rows
select * from post                --100 rows
select * from post_likes          --1707 rows
select * from post_tags           --377 rows
select * from users               --50 rows
select * from videos              --50 rows


--1. Location of user 
select * from post where location in ('agra','ahmedabad','kerala')


--2. Most followed hashtags
select top 5 hf.hashtag_id, hashtag_name, count(user_id) as usercount 
from hashtag_follow hf join hashtags h on hf.hashtag_id = h.hashtag_id
group by hf.hashtag_id, h.hashtag_name
order by count(user_id) desc


--3. Most used hashtags
select top 5 pt.hashtag_id, h.hashtag_name, count(post_id) as postcount
from post_tags pt join hashtags h on pt.hashtag_id = h.hashtag_id
group by pt.hashtag_id, h.hashtag_name
order by count(post_id) desc


--4. Most inactive user
select top 5 u.user_id, username, count(login_id) as logincount
from users u join login l on u.user_id = l.user_id
group by u.user_id, username
order by count(login_id) desc


--5. Most liked posts
select top 5 p.post_id, p.caption, count(pl.user_id) as usercount
from post p join post_likes pl on p.post_id = pl.post_id
group by p.post_id, p.caption
order by count(pl.user_id) desc


--6. Average post per user
select round(count(post_id) / count(distinct user_id),2) as average_post_per_user
from post

--7. No. of login per user
select round(count(login_id) / count(distinct user_id),2) as login_per_user
from login


--8. Users who liked every single post
select u.user_id, username 
from users u join post_likes p on u.user_id = p.user_id
group by u.user_id, username
having count(*) = (select count(*) from post)


--9. User never comment
select user_id, username from users
where user_id not in (select user_id from comments)


--10. User who commented on every post
select * from comments
select * from post
select c.user_id, u.username 
from users u join comments c on u.user_id = c.user_id
group by c.user_id, u.username
having count(*) = (select count(*) from post)


--11. User not followed by anyone
select user_id, username from users
where user_id not in (select followee_id from follows)


--12. User not following anyone
select user_id, username from users
where user_id not in (select follower_id from follows)


--13. Posted more than 5 times
select p.user_id, u.username, count(post_id) as no_of_posts
from post p join users u on p.user_id = u.user_id
group by p.user_id, username
having count(post_id) > 5


--14. Followers > 40
select * from follows
select followee_id, count(follower_id) as follower_count
from follows
group by followee_id
having count(follower_id) > 40


--15. Any specific word in comment
select * from comments
where comment_text like '%good%' or comment_text like '%beautiful%'


--16. Longest captions in post
select top 5 post_id, caption, len(caption) as caption_length from post
order by len(caption) desc


--Question 1: The company wants to reward its users who have been around the longest. Find the five oldest users.
select top 5 * from users
order by created_at desc


--Task 2: Figure out when to schedule an ad-campaign to increase registered users.
--check the day or date on which more users are registered
select datepart(day,created_at) as days, count(user_id) as total_registered
from users
group by datepart(day,created_at)
order by count(user_id) desc


--Task 3: The company wants to target its inactive users with an email campaign. 
--Find the total number of inactive users. 
select count(user_id) as inactive_users 
from users
where user_id not in (select user_id from login)


--Task 4: Identify those inactive users (who have never posted a photo)
select user_id, username 
from users
where user_id not in (select user_id from post)


--Task 5: The company is running a new contest to see who can get the most likes on a single photo. 
--So, identify the most liked photo, the user of that photo.
select top 1 photo_id, u.user_id, username, count(*) as num_likes 
from post_likes pl join post p on pl.user_id = p.user_id
join users u on p.user_id = u.user_id
group by pl.post_id, photo_id, u.user_id, username
order by count(*) desc


--Task 6: Calculate the average number of photos per user
select round(count(photo_id) / count(distinct user_id),2) as avg_photo_per_user
from post


--Task 7: Find the 5 most popular hashtags used.
select top 5 p.hashtag_id, hashtag_name , count(*) as hashtags_count
from hashtags h join post_tags p on h.hashtag_id = p.hashtag_id
group by p.hashtag_id, hashtag_name
order by count(p.hashtag_id) desc

 
