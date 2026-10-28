use tops;

CREATE TABLE restaurant(
  name varchar(100),
  city varchar(100),
  cuisine varchar(100)
);

insert into restaurant(name,city,cuisine)
values
('Empire Restaurant', 'Indiranagar', 'North Indian, Chinese'),
('Truffles', 'Indiranagar', 'American, Fast Food'),
('Meghana Foods', 'Indiranagar', 'Biryani, Andhra'),
('A2B', 'Indiranagar', 'South Indian'),
('Dominos Pizza', 'Indiranagar', 'Pizza, Fast Food'),
('KFC', 'Koramangala', 'Fast Food, Burger'),
('Pizza Hut', 'Koramangala', 'Pizza, Italian'),
('Burger King', 'Koramangala', 'Burger, Fast Food'),
('Cafe Coffee Day', 'Whitefield', 'Cafe, Beverages'),
('Theobroma', 'Indiranagar', 'Bakery, Desserts');

select * from restaurant;


SELECT
    TRIM(SUBSTRING_INDEX(
        SUBSTRING_INDEX(cuisine, ',', numbers.n),
        ',', -1
    )) AS cuisine,
    COUNT(DISTINCT name) AS restaurant_count
FROM restaurant
CROSS JOIN (
    SELECT 1 AS n UNION ALL SELECT 2
    UNION ALL SELECT 3 UNION ALL SELECT 4
    UNION ALL SELECT 5 UNION ALL SELECT 6
    UNION ALL SELECT 7 UNION ALL SELECT 8
    UNION ALL SELECT 9 UNION ALL SELECT 10
) AS numbers
WHERE city = 'Indiranagar'
  AND cuisine IS NOT NULL
  AND numbers.n <= 1 + LENGTH(cuisine)
                   - LENGTH(REPLACE(cuisine, ',', ''))
GROUP BY TRIM(SUBSTRING_INDEX(
    SUBSTRING_INDEX(cuisine, ',', numbers.n),
    ',', -1
))
ORDER BY restaurant_count DESC;