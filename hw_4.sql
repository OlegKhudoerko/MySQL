# Задание 1. Подсчитать количество групп, в которые вступил каждый пользователь.

-- Решение:
USE vk;

SELECT users.id, users.firstname, users.lastname,
       COUNT(users_communities.community_id) AS count_groups
       FROM users
			LEFT JOIN users_communities ON users.id = users_communities.user_id
 GROUP BY users.id;
 
# Задание 2. Подсчитать количество пользователей в каждом сообществе.

-- Решение:
SELECT  communities.name AS communities, 
	    COUNT(*) AS count_users 
       FROM users_communities 
			JOIN communities 
			ON users_communities.community_id = communities.id
GROUP BY communities;

# Задание 3. Пусть задан некоторый пользователь. Из всех пользователей соц. сети 
# найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

-- Решение:
SELECT u.firstname, u.lastname AS name, 
       COUNT(*) AS 'message count'
  FROM users u
  JOIN messages m ON u.id = m.from_user_id
 WHERE m.to_user_id = 1
 GROUP BY u.id
 ORDER BY COUNT(*) DESC
 LIMIT 1;
 
# Задание 4. * Подсчитать общее количество лайков, которые получили пользователи младше 18 лет.

-- Решение:
SELECT count(*)
  FROM likes l
  JOIN media m on l.media_id = m.id
  JOIN profiles p on p.user_id = m.user_id
 WHERE  YEAR(CURDATE()) - YEAR(birthday) < 18;


# Задание 5. * Определить кто больше поставил лайков (всего): мужчины или женщины.

-- Решение:
 SELECT COUNT(likes.id) AS likes_count,
     IF (profiles.gender='f', 'women', 'men') AS gender   
   FROM likes
   JOIN profiles ON likes.user_id = profiles.user_id
  GROUP BY profiles.gender;
 
 
 
 