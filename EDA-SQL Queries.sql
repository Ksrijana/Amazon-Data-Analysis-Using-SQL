-- Exploratory Data Analysis (EDA)
use Amazon_Db;

--1.What is the count of distinct cities in the dataset?
--Query
select count(distinct City) as No_of_Cities from Amazon;
------------------------------------------------------
select distinct City from Amazon;
--Findings
--There are three different cities namely Naypyitaw, Yangon and Mandalay

--2.For each branch, what is the corresponding city?
--Query
select distinct Branch,City from Amazon order by Branch;
--Findings
--Branch ‘A’ is situated in Yangon, Branch  ‘B’ in Mandalay and  Branch  ‘C’ in Naypyitaw

--3.What is the count of distinct product lines in the dataset?
--Query
select count(distinct Product_line) as No_of_ProdLines from Amazon;
------------------------------------------------------------------
select distinct Product_line from Amazon;
--Findings
--There are six product lines namely Fashion accessories,Health and beauty,Electronic accessories,Food and beverages,Sports and travel and Home and lifestyle

--4.Which payment method occurs most frequently?
--Query
select payment,count(*) as payment_count from Amazon
group by Payment
order by payment_count desc;
------------------------------------------------------
select top 1 payment,count(*) as payment_count from Amazon
group by Payment
order by payment_count desc;
--Findings
--'Ewallet' is the mostly used payment method with 345 transcations following 'Cash' with 344 transactions and 'Credit card' with 311 transactions

--5.Which product line has the highest sales?
--Query
select Product_line,sum(Total) as Total_Sales from Amazon
group by Product_line
order by Total_Sales desc;
-----------------------------------------------------------
select top 1 Product_line,sum(Total) as Total_Sales from Amazon
group by Product_line
order by Total_Sales desc;
--Findings
--'Food and beverages' have generated the 56144.8440 sales, followed by 'Sports and travel' and 'Electronic accessories'.

--6.How much revenue is generated each month?
--Query
select Month_Name,sum(Total) as Total_Revenue from Amazon
group by Month_Name
order by Total_Revenue desc;
--Findings
--‘January’ month has the highest revenue with 116291.8680, followed by ‘March’ and ‘February’

--7.In which month did the cost of goods sold reach its peak?
--Query
select Month_Name,sum(cogs) as total_cogs from Amazon
group by Month_Name
order by total_cogs desc;
--Findings
--‘January’ month has the peak cost of goods sold with 110754.16, followed by ‘March’ and ‘February’

--8.Which product line generated the highest revenue?
--Query
select Product_line,sum(Total) as Total_Revenue from Amazon
group by Product_line
order by Total_Sales desc;
-----------------------------------------------------------
select top 1 Product_line,sum(Total) as Total_Sales from Amazon
group by Product_line
order by Total_Sales desc;
--Findings
--'Food and beverages' has generated the highest revenue with 56144.8440, followed by 'Sports and travel' and 'Electronic accessories'.

--9.In which city was the highest revenue recorded?
--Query
select City,sum(Total) as Total_Revenue from Amazon
group by City
order by Total_Revenue desc;
-----------------------------------------------------------
select top 1 City,sum(Total) as Total_Revenue from Amazon
group by City
order by Total_Revenue desc;
--Findings
--‘Naypyitaw’ has recorded the highest revenue with 110568.7065, followed by Yangon and Mandalay.

--10.Which product line incurred the highest Value Added Tax?
--Query
select Product_line,sum([Tax_5%]) as Total_Tax from Amazon
group by Product_line
order by Total_Tax desc;
-----------------------------------------------------------
select top 1 Product_line,sum([Tax_5%]) as Total_Tax from Amazon
group by Product_line
order by Total_Tax desc;
--Findings
--'Food and beverages' have incurred the highest Value Added Tax with 2673.5640, followed by 'Sports and travel' and 'Electronic accessories'.

--11.For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
--Query
select Product_line,
case
when sum(Total)>(select avg(total) from Amazon) then 'Good'
else 'Bad'
end as Sales_Status
from Amazon 
group by Product_line;
--Findings
--All product lines are doing well in terms of total sales when compared to the total average 

--12.Identify the branch that exceeded the average number of products sold.
--Query
select Branch
from Amazon 
group by Branch
having sum(Quantity)>(select avg(Quantity) from Amazon)
order by Branch;
--Findings
--All branches are exceeding the total average number of products sold, indicating strong overall performance across all branches.

--13.Which product line is most frequently associated with each gender?
--Query
with RankedProdLines as
(
select Gender,Product_line,count(*) as ProLineCount,
DENSE_RANK() over(partition by Gender order by count(*) desc) as ProdLinesRank
from Amazon
group by Gender,Product_line
)
select Gender,Product_line as MostFreAssoProdLine
from RankedProdLines
where ProdLinesRank=1;
--Findings
--'Fashion Accessories' is the most frequently associated product line with females, while 'Health and Beauty' is the most frequently associated product line with males.

--14.Calculate the average rating for each product line.
--Query
select Product_line,avg(Rating) as Avg_Rating
from Amazon
group by Product_line
order by Avg_Rating desc;
--Findings
--'Food and Beverages' has the highest average rating of 7.11, while 'Home and Lifestyle' has the lowest average rating of 6.84.

--15.Count the sales occurrences for each time of day on every weekday.
--Query
select Time_of_Day,count(*) as SalesOccur
from Amazon
where Day_Name not in ('Sat','Sun')
group by Time_of_Day
order by SalesOccur desc;
--Findings
--Most sales on weekday occurred in the afternoon, with 326 sales, indicating a higher shopping activity during this time. 

--16.Identify the customer type contributing the highest revenue.
--Query
select Customer_type,sum(Total) as Total_Sales
from Amazon
group by Customer_type
order by Total_Sales desc;
-------------------------------------------------
select top 1 Customer_type as Cust_High_Revenue
from Amazon
group by Customer_type
order by sum(Total) desc;
--Findings
--'Member' type customers have contributed the highest revenue compared to 'Normal' type customers

--17.Determine the city with the highest VAT percentage.
--Query
select City,sum([Tax_5%]) as Total_Tax
from Amazon
group by City
order by Total_tax desc;
-------------------------------------------------
select top 1 City as City_High_VAT
from Amazon
group by City
order by sum([Tax_5%]) desc;
--Findings
--'Naypyitaw' leads with the highest VAT percentage at 5265.1765, followed by Yangon and Mandalay.

--18.Identify the customer type with the highest c.
--Query
select Customer_type,sum([Tax_5%]) as Total_Tax
from Amazon
group by Customer_type
order by Total_tax desc;
-------------------------------------------------
select top 1 Customer_type as Cust_High_VAT
from Amazon
group by Customer_type
order by sum([Tax_5%]) desc;
--Findings
--'Member' type customers have contributed the highest VAT payments, totalling 7820.1640, compared to 'Normal' type customers

--19.What is the count of distinct customer types in the dataset?
--Query
select distinct Customer_type from Amazon;
--------------------------------------------------
select count(distinct Customer_type) as Cust_Count from Amazon;
--Findings
--There are 2 distinct customer types namely 'Normal' and 'Member'

--20.What is the count of distinct payment methods in the dataset?
--Query
select distinct Payment from Amazon;
--------------------------------------------------
select count(distinct Payment) as Payment_Count from Amazon;
--Findings
--There are 3 distinct payment methods : 'Ewallet','Cash' and 'Credit card'

--21.Which customer type occurs most frequently?
--Query
select Customer_type,count(*) as Cust_Count
from Amazon
group by Customer_type
order by Cust_Count desc;
-------------------------------------------------
select top 1 Customer_type as Most_Freq_Cust
from Amazon
group by Customer_type
order by count(*) desc;
--Findings
--Most frequent customers are of the 'Member' type with 501 transactions, compared to those of the 'Normal' type.

--22.Identify the customer type with the highest purchase frequency.
--Query
select Customer_type,count(*) as Cust_Purch_Freq
from Amazon
group by Customer_type
order by Cust_Purch_Freq desc;
-------------------------------------------------
select top 1 Customer_type as High_Purch_Freq_Cust
from Amazon
group by Customer_type
order by count(*) desc;
--Findings
--The 'Member' type customers have the highest purchasing frequency with 501 transactions, compared to the 'Normal' type customers.

--23.Determine the predominant gender among customers.
--Query
select Gender,count(*) as Cust_Count
from Amazon
group by Gender
order by Cust_Count desc;
-------------------------------------------------
select top 1 Gender as Predominant_Gender
from Amazon
group by Gender
order by count(*) desc;
--Findings
--'Females' are the predominate customer group with 501 transactions, compared to ‘Male’ customers

--24.Examine the distribution of genders within each branch.
--Query
select Branch,Gender,count(*) as Cust_Count
from Amazon
group by Branch,Gender
order by Branch;
--Findings
--Among all 3 branches, Branch 'A' leads with 340 customers, consisting of 161 females and 179 males.

--25.Identify the time of day when customers provide the most ratings.
--Query
select Time_of_day,count(*) as Rating_Count
from Amazon
group by Time_of_day
order by Rating_Count desc;
--------------------------------
select top 1 Time_of_day as Peak_Rating_Time
from Amazon
group by Time_of_day
order by count(*) desc;
--Findings
--'Afternoon' is the peak time for customer ratings, with a total of 454 ratings

--26.Determine the time of day with the highest customer ratings for each branch.
--Query
with Ranked_Peak_Time as
(
select Branch,Time_of_day,count(*) as Ratings_Count,
DENSE_RANK() over(partition by Branch order by count(*) desc) as Peak_Rating_Rank
from Amazon
group by Branch,Time_of_day
)
select Branch,Time_of_day as Peak_Rating_Time
from Ranked_Peak_Time
where Peak_Rating_Rank=1;
--Findings
--'Afternoon' is the peak time for customer ratings across all branches.

--27.Identify the day of the week with the highest average ratings.
--Query
with Avg_Ratings_Per_Day as
(
select Day_Name,AVG(Rating) as Avg_Rating
from Amazon
group by Day_Name
)
select Day_Name as Peak_Avg_Rating_Day
from Avg_Ratings_Per_Day
where Avg_Rating = (select max(Avg_Rating) from Avg_Ratings_Per_Day);
--Findings
--'Monday' has the highest average rating among all days

--28.Determine the day of the week with the highest average ratings for each branch.
--Query
with Avg_Ratings_Per_Day as
(
select Branch,Day_Name,AVG(Rating) as Avg_Rating,
DENSE_RANK() over(partition by Branch order by AVG(Rating) desc) as peak_avg_rating_rank
from Amazon
group by Branch,Day_Name
)
select Branch,Day_Name as Peak_Avg_Rating_Day
from Avg_Ratings_Per_Day
where peak_avg_rating_rank=1;
--Findings
--Branch A and Branch C have 'Friday' as the day with highest average ratings, while Branch B's peak average rating occurs on 'Monday'

/*
****Overall Insights***** 

Product Analysis: The 'Food and Beverages' product line is leading in both sales and revenue, with the highest Value Added Tax (VAT) and average ratings. 
However, 'Home and Lifestyle' has the lowest average rating and may need improvement in customer satisfaction and marketing efforts.

Sales Analysis: Sales trends indicate that January had the highest revenue and cost of goods sold, highlighting it as a peak month. 
All product lines exceed average total sales, suggesting consistent performance, while afternoon sales on weekdays show high shopping activity, 
which could be leveraged for promotions.

Customer Analysis: 'Member' customers dominate transactions and revenue, showcasing their importance as a profitable segment. 
Females are the predominant customer group, and Branch 'A' leads in customer count, 
reflecting opportunities for targeted strategies based on gender and branch-specific preferences.
*/