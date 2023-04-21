-- Lilyana Miteva

-- Task 1
-- 1. Извадете от таблица users name и email и от таблица votes poll id,
за всички засичащи се записи между тези таблици като поставим условие да 
визуализираме само имена, които започват с първо име например:
Asen или първо име Pencho или първо име Mitko(имена на потребители в базата), 
подредени по азбучен ред.

SELECT users.name, users.email, votes.poll_id FROM users 
INNER JOIN votes ON users.id=votes.user_id
WHERE users.name LIKE 'LiLyana%';

-- Task 2
--2. Извадете въпроси и дата на изтичане плюс text опция(text е колона от друга таблица). 
Датата на изтичане да е между 2023-04-01 и 2023-04-26
и резултата да е подреден по колона дата на изтичане във низходящ ред.

SELECT polls.question, polls.expiration_date_time, choices.text FROM polls
LEFT JOIN choices ON polls.id=choices.poll_id
WHERE (polls.expiration_date_time BETWEEN '2023-04-01 00:00:00' AND '2023-04-26 23:59:59')
ORDER BY polls.expiration_date_time DESC;

-- Task 3
--3. Изкарайте всичко за users, които завършват с username на 2

SELECT * FROM users WHERE username LIKE "%2";

-- Task 4
--4. Напишете Query което да извади не повтарящи се въпроси(question) съдържащи отговор(text)
 'cat' или 'dog'
 
SELECT DISTINCT question FROM polls INNER JOIN choices ON polls.id = choices.poll_id
WHERE choices.text LIKE '%cat%' 
OR choices.text LIKE '%dog%';

-- Task 5
--5. Извадете заглавията на всички анкети създадени от админ3

SELECT question FROM polls LEFT JOIN users ON polls.created_by=users.id 
WHERE users.username='admin3';

-- Additional Task
--********************** За напреднали:
Изкарай въпросите, на които текст опциите имат май-много гласове като броя гласове да се 
визуализира с колона Vote_Count
подредени в низходящ ред като покажем само 5те с най-много подадени гласове за опция.

SELECT polls.question, choices.text, COUNT(votes.choice_id) AS Vote_Count  
FROM polls 
INNER JOIN choices 
ON polls.id=choices.poll_id 
INNER JOIN votes
ON choices.id=votes.choice_id
GROUP BY polls.id, votes.choice_id
ORDER BY Vote_Count DESC LIMIT 5;


