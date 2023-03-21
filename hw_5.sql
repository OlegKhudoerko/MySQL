/* Пятый семинар
  Задания: 
  1. Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]*/

USE vk;

CREATE OR REPLACE VIEW number_of_friends AS
SELECT 
	u.id, 
    u.firstname, 
    u.lastname, 
    COUNT(*) AS approved_friends_count
  FROM users AS u
	JOIN friend_requests AS fr 
    ON (u.id = fr.target_user_id 
		OR u.id = fr.initiator_user_id)
 WHERE fr.status = "approved"
 GROUP BY u.id
 ORDER BY approved_friends_count DESC;

/* 2. Выведите данные, используя написанное представление [SELECT]*/
SELECT 
	id, 
    firstname, 
    lastname, 
    approved_friends_count
  FROM number_of_friends
 ORDER BY approved_friends_count DESC;
 
/* 3. Удалите представление [DROP VIEW]*/
  DROP VIEW number_of_friends;

/* 4.* Сколько новостей (записей в таблице media) у каждого пользовател/я? 
	   Вывести поля: news_count (количество новостей), user_id (номер пользователя), 
       user_email (email пользователя). Попробовать решить с помощью CTE или с помощью обычного JOIN.*/
       
/* с помощью CTE */
WITH cte_media_count AS (
     SELECT 
		user_id, 
        COUNT(*) AS news_count
     FROM media
     GROUP BY user_id
)
SELECT news_count, 
	   user_id, 
       email AS user_email
  FROM cte_media_count mc
	   JOIN users AS u 
	   ON mc.user_id = u.id;
  
/* с помощью оператора JOIN:*/
SELECT 
	COUNT(*) AS news_count, 
    user_id, 
    email AS user_email
  FROM media AS m
	   JOIN users AS u 
       ON m.user_id = u.id
  GROUP BY m.user_id;