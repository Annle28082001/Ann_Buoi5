--baitap1
Select distinct city from station 
where mod(id, 2)= 0 
--baitap2
 SELECT (COUNT(CITY) - COUNT(DISTINCT CITY)) AS difference from station;
--baitap4
select 
round(
sum(item_count::DECIMAL*order_occurrences)
/sum(order_occurrences) 
,1)
from items_per_order
--baitap5
SELECT candidate_id
FROM candidates
where skill in ('Python','Tableau','PostgreSQL')
group by candidate_id
having count(skill)=3
order by candidate_id
--baitap6
SELECT user_id,
MAX(DATE(post_date))- MIN(DATE(post_date)) as days_between
from posts
where DATE_PART('YEAR', DATE(post_date)) = 2021
Group by user_id
HAVING COUNT(post_id)>1
--BAITAP7
SELECT DISTINCT card_name,
MAX(issued_amount) - MIN(issued_amount) as difference
FROM monthly_cards_issued
Group by card_name
order by difference DESC
--BAITAP8
--Total Profit/(Total Loss) = Total Sales - Total Cost of Goods Sold
SELECT 
manufacturer,
count(drug) as drug_count,
abs(SUM(total_sales - cogs)) as total_amount_of_losses
FROM pharmacy_sales
WHERE (total_sales - cogs)<=0
group by manufacturer
order by abs(sum(total_sales - cogs)) DESC
--baitap9
select id, movie, description, rating from cinema
where ID % 2 = 1 and
not description like 'boring'
order by rating DESC
--baitap10
select DISTINCT user_id,
count(follower_id) as followers_count
from followers
group by USER_ID
--baitap11
select class 
from courses
group by class
having count(student)>=5
