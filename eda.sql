select *
    , CASE 
        WHEN age < 20 THEN 'Under 20'
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        WHEN age >= 60 THEN '60+'
        ELSE 'Unknown'
      END as age_range
    , CASE 
        WHEN gender = 'Male' THEN 1
        WHEN gender = 'Female' THEN 0
        ELSE NULL
      END as gender_dummy
    , CASE 
        WHEN Product_Category = 'Beauty' THEN 1
        ELSE 0
      END as Beauty_dummy
    , CASE 
        WHEN Product_Category = 'Clothing' THEN 1
        ELSE 0
      END as Clothing_dummy
    , CASE 
        WHEN Product_Category = 'Electronics' THEN 1
        ELSE 0
      END as Electronics_dummy
from SALES t1
left join 
(
select Product_Category, avg(Total_Amount)
from SALES
group by 1
) t2
on t1.Product_Category = t2.Product_Category
;

select Product_Category, avg(Total_Amount)
from SALES
group by 1;


CREATE TABLE SALES (

Transaction_ID	INTEGER,
Date	TEXT,
Customer_ID	TEXT,
Gender	TEXT,
Age	INTEGER,
Product_Category	TEXT,
Quantity	INTEGER,
Price_per_Unit	INTEGER,
Total_Amount	INTEGER
);