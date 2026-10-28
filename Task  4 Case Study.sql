CREATE TABLE restaurant1(
  id int auto_increment primary key,
  name varchar(100),
  rating decimal(10,2),
  number_of_votes int
);

insert into restaurant1(name,rating,number_of_votes)
values
('Restaurant A', 2.5, 350),
('Restaurant B', 2.7, 250),
('Restaurant C', 2.9, 420),
('Restaurant D', 3.5, 180),
('Restaurant E', 2.8, 300),
('Restaurant F', 4.2, 500),
('Restaurant G', 2.6, 220),
('Restaurant H', 3.8, 150),
('Restaurant I', 2.9, 275),
('Restaurant J', 4.0, 400);

select * from restaurant1;


SELECT name,rating,number_of_votes
from restaurant1
WHERE rating < 3.0
   AND number_of_votes >200
order by rating ASC;