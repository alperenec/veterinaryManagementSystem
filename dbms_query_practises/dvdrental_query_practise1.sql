--dvdrental db'de en çok filmde oynayan ilk üç aktörün bütün bilgilerini aktör adına göre azalan bir biçimde ekrana yazdıran sorgu

SELECT 
  actor.actor_id,
  actor.first_name,
  actor. ,
  COUNT(film_actor.actor_id) AS film_count
FROM 
  actor
JOIN 
  film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY 
  actor.actor_id, actor.first_name, actor.last_name
ORDER BY 
  film_count DESC, actor.first_name DESC
LIMIT 3;
