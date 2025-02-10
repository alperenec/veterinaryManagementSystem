--dvdrental db'de bulunan filmleri kategoriye göre gruplayan ve film sayısı en fazla olan 3 kategoriyi film sayısına göre azalan biçimde ekrana yazdıran sorgu

SELECT 
  category.category_id,
  category.name AS category_name,
  COUNT(film_category.film_id) AS film_count
FROM 
  category
JOIN 
  film_category ON category.category_id = film_category.category_id
GROUP BY 
  category.category_id, category.name
ORDER BY 
  film_count DESC
LIMIT 3;
