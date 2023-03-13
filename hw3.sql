# Задание 1
# Написать скрипт, возвращающий список имен (только firstname) пользователей 
# без повторений в алфавитном порядке. [ORDER BY]

-- Решение: 
USE vk;

SELECT DISTINCT firstname
  FROM users
 ORDER BY firstname; # По умолчанию ASC

# Задание 2. Выведите количество мужчин старше 35 лет [COUNT].

-- Решение:  
SELECT COUNT(*)
  FROM profiles
 WHERE gender = 'm' 
   AND birthday < DATE_SUB(NOW(), INTERVAL 35 YEAR); # 16!!! а не 15!!!
   
# Задание 3. Сколько заявок в друзья в каждом статусе? (таблица friend_requests) [GROUP BY]

-- Решение:  
SELECT status, COUNT(*)
  FROM friend_requests
 GROUP BY status;
 
 # Задание 4. Выведите номер пользователя, который отправил больше всех заявок в друзья 
 #            (таблица friend_requests) [LIMIT].
 
 -- Решение:  
SELECT initiator_user_id, COUNT(*) as quantity
  FROM friend_requests
 GROUP BY initiator_user_id
 ORDER BY quantity DESC
 LIMIT 1;
 
 # Задание 5. Выведите названия и номера групп, имена которых состоят из 5 символов [LIKE].
  
 -- Решение:  
SELECT name, id
  FROM communities
 WHERE name LIKE '_____';
 
 
 
