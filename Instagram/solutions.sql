-- 1. Finding 5 oldest users;

 -- select username, created_at from users order by created_at limit 5;
 
-- 2. What day of the week do most users register on?
    /*
    select        
        count(*) as Total,
        dayname(created_at) as Day
    from users
    group by 2
    order by 1 desc
    limit 2;
    */

-- 3. Find the users who have never posted a photo;
    /*
    select 
        username 
    from users us 
    left join photos ph
        on us.id = ph.user_id 
    where ph.user_id is null;
    */

-- 4. Get the most popular photo, and who's have posted the photo
    /*
    select 
        username,
        ph.id, 
        ph.image_url, 
        count(*) as Total
    from photos ph
    join likes lk 
        on ph.id = lk.photo_id
    join users us
        on ph.user_id = us.id 
    group by 2
    order by 4 desc
    limit 1;
    */
    
-- 5. Calculate avg number of photos per user
    /*
    select 
        round((select count(*) from photos) / (select count(*) from users), 2) as "Avg Photos per User";
        -- or
    SELECT
       round(COUNT(DISTINCT photos.id) / COUNT(DISTINCT users.id), 2) AS "Avg Photos per User"
    FROM users
    LEFT JOIN photos
    ON users.id = photos.user_id;
    */
    
-- 6. Get the top 5 most commonly used tags
    
    /*
    select tg.tag_name, count(*) as Total from photo_tags pt
    join tags tg on pt.tag_id = tg.id
    group by tg.id
    order by 2 desc
    limit 5;
    */
    
-- 7. Find users who have liked every single photo on the site
    
    select 
        us.username,
        count(*) as Total
    from users us join likes lk on us.id = lk.user_id
    group by us.id
    having Total = (select count(*) from photos);
