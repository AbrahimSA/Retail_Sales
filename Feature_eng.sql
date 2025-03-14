WITH foo AS (
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
	  , t3.monthly_amt
	  , temp.*
from SALES t1
left join 
(
	-- adding month as a variable to account for seasonality
	-- need to be converted into a dummy variable later	
	SELECT  strftime('%m', Date) AS Month_name
	, avg(Total_Amount) as monthly_amt
	FROM SALES
	GROUP BY 1
) t3
--on strftime('%Y', t1.Date) AS year = t3.year
on strftime('%m', t1.Date) = t3.Month_name
left join
(
	-- adding weather data for toronto
	select date as date_temp
	, Max_Temp
	, Min_Temp
	, Mean_Temp
	, Total_Precip_mm
	from weather
	UNION all
	select date as date_temp
	, Max_Temp
	, Min_Temp
	, Mean_Temp
	, Total_Precip_mm
	from weather_2024
) temp
on temp.date_temp = t1.Date
left join 
-- Adding total customer spend in 12m
(
	-- These values will be zero for brand new customers
	SELECT 
	a.Customer_ID, a.date, a.Total_Amount
	, SUM(CASE WHEN b.date BETWEEN date(a.date, '-3 months') AND a.date THEN b.Total_Amount ELSE 0 END) AS spend_3m
	, SUM(CASE WHEN b.date BETWEEN date(a.date, '-12 months') AND a.date THEN b.Total_Amount ELSE 0 END) AS spend_12m
	-- for electronics
	, SUM(CASE WHEN (b.date BETWEEN date(a.date, '-3 months') AND a.date) and a.Product_Category = 'Electronics' THEN b.Total_Amount ELSE 0 END) AS spend_3m_electronics
	, SUM(CASE WHEN (b.date BETWEEN date(a.date, '-3 months') AND a.date) and a.Product_Category = 'Beauty' THEN b.Total_Amount ELSE 0 END) AS spend_3m_beauty
	, SUM(CASE WHEN (b.date BETWEEN date(a.date, '-3 months') AND a.date) and a.Product_Category = 'Clothing' THEN b.Total_Amount ELSE 0 END) AS spend_3m_clothing
	-- FEATURE FOR # OF UNITS
	, SUM(CASE WHEN b.date BETWEEN date(a.date, '-3 months') AND a.date THEN b.QUANTITY ELSE 0 END) AS QTY_3m
	, SUM(CASE WHEN b.date BETWEEN date(a.date, '-12 months') AND a.date THEN b.QUANTITY ELSE 0 END) AS QTY_12m
	-- FEAURES FOR QTY (SPLIT BY PRODUCT CATEGORY)
	, SUM(CASE WHEN (b.date BETWEEN date(a.date, '-3 months') AND a.date) and a.Product_Category = 'Electronics' THEN b.QUANTITY ELSE 0 END) AS QTY_3m_electronics
	, SUM(CASE WHEN (b.date BETWEEN date(a.date, '-3 months') AND a.date) and a.Product_Category = 'Beauty' THEN b.QUANTITY ELSE 0 END) AS QTY_3m_beauty
	, SUM(CASE WHEN (b.date BETWEEN date(a.date, '-3 months') AND a.date) and a.Product_Category = 'Clothing' THEN b.QUANTITY ELSE 0 END) AS QTY_3m_clothing


FROM 
    SALES a
LEFT JOIN 
    SALES b ON a.customer_id = b.customer_id
GROUP BY 
   a.Customer_ID, a.date, a.Total_Amount
) hist_spend
on t1.customer_id = hist_spend.customer_id
and t1.Date = hist_spend.date
)

SELECT -- date,
		 Customer_ID
		, AGE_RANGE
		, CASE 
		WHEN [Date] IN ('2023-01-01', '2024-01-01') THEN 'New Year''s Day'
		WHEN [Date] IN ('2023-02-20', '2024-02-19') THEN 'Family Day'
		WHEN [Date] IN ('2023-04-07', '2024-03-29') THEN 'Good Friday'
		WHEN [Date] IN ('2023-05-22', '2024-05-20') THEN 'Victoria Day'
		WHEN [Date] IN ('2023-07-01', '2024-07-01') THEN 'Canada Day'
		WHEN [Date] IN ('2023-09-04', '2024-09-02') THEN 'Labour Day'
		WHEN [Date] IN ('2023-10-09', '2024-10-14') THEN 'Thanksgiving'
		WHEN [Date] IN ('2023-12-25', '2024-12-25') THEN 'Christmas Day'
		WHEN [Date] IN ('2023-12-26', '2024-12-26') THEN 'Boxing Day'
		WHEN [Date] IN ('2023-11-24', '2024-11-29') THEN 'Black Friday Sale'
		ELSE '0'
		END AS HolidayName
		, strftime('%m', Date) AS Month_name
		,   CASE WHEN Month_name = '01' THEN 1 ELSE 0 END AS jan_dummy,
		    CASE WHEN Month_name = '02' THEN 1 ELSE 0 END AS feb_dummy,
		    CASE WHEN Month_name = '03' THEN 1 ELSE 0 END AS mar_dummy,
		    CASE WHEN Month_name = '04' THEN 1 ELSE 0 END AS apr_dummy,
		    CASE WHEN Month_name = '05' THEN 1 ELSE 0 END AS may_dummy,
		    CASE WHEN Month_name = '06' THEN 1 ELSE 0 END AS jun_dummy,
		    CASE WHEN Month_name = '07' THEN 1 ELSE 0 END AS jul_dummy,
		    CASE WHEN Month_name = '08' THEN 1 ELSE 0 END AS aug_dummy,
		    CASE WHEN Month_name = '09' THEN 1 ELSE 0 END AS sep_dummy,
		    CASE WHEN Month_name = '10' THEN 1 ELSE 0 END AS oct_dummy,
		    CASE WHEN Month_name = '11' THEN 1 ELSE 0 END AS nov_dummy,
		    CASE WHEN Month_name = '12' THEN 1 ELSE 0 END AS dec_dummy
		-- , Customer_ID
		--, Quantity
		--, Price_per_Unit
		--, Total_Amount
		, spend_3m
		, QTY_3m
		, spend_12m
		, QTY_12m
		, spend_3m_electronics
		, QTY_3m_electronics
		, spend_3m_beauty
		, QTY_3m_beauty
		, spend_3m_clothing
		, QTY_3m_beauty
    , CASE WHEN age < 20 THEN 1 ELSE 0 END AS dummy_under_20,
    CASE WHEN age BETWEEN 20 AND 29 THEN 1 ELSE 0 END AS dummy_20_29,
    CASE WHEN age BETWEEN 30 AND 39 THEN 1 ELSE 0 END AS dummy_30_39,
    CASE WHEN age BETWEEN 40 AND 49 THEN 1 ELSE 0 END AS dummy_40_49,
    CASE WHEN age BETWEEN 50 AND 59 THEN 1 ELSE 0 END AS dummy_50_59,
    CASE WHEN age >= 60 THEN 1 ELSE 0 END AS dummy_60_plus
		, GENDER_DUMMY
	, CASE 
		WHEN [Date] IN ('2023-01-01', '2024-01-01') THEN 1
		WHEN [Date] IN ('2023-02-20', '2024-02-19') THEN 1
		WHEN [Date] IN ('2023-04-07', '2024-03-29') THEN 1
		WHEN [Date] IN ('2023-05-22', '2024-05-20') THEN 1
		WHEN [Date] IN ('2023-07-01', '2024-07-01') THEN 1
		WHEN [Date] IN ('2023-09-04', '2024-09-02') THEN 1
		WHEN [Date] IN ('2023-10-09', '2024-10-14') THEN 1
		WHEN [Date] IN ('2023-12-25', '2024-12-25') THEN 1
		WHEN [Date] IN ('2023-12-26', '2024-12-26') THEN 1
		WHEN [Date] IN ('2023-11-24', '2024-11-29') THEN 1
		ELSE 0
		-- , MONTH(DATE)
	END AS HolidayDummy
	,  Max_Temp
	, Min_Temp
	, Mean_Temp
	, Total_Precip_mm
	, Product_Category
	
FROM foo
order by Total_Amount desc;