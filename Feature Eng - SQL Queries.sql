use Amazon_Db;

-- Creating MonthName column to analyze the monthly trends
Alter table Amazon 
add Month_Name nvarchar(10);

update Amazon
set Month_Name = FORMAT(Date,'MMM');

-- Creating DayName column to analyze the weekly trends
Alter table Amazon 
add Day_Name nvarchar(10);

update Amazon
set Day_Name = FORMAT(Date,'ddd');

-- Creating Time_of_Day column to analyze trends based on different parts of the day
Alter table Amazon 
add Time_of_Day nvarchar(10);

update Amazon
set Time_of_Day =
case 
when DATEPART(HOUR,Time)>=0 and DATEPART(HOUR,Time)<12
then 'Morning'
when DATEPART(HOUR,Time)>=12 and DATEPART(HOUR,Time)<17
then 'Afternoon'
else 'Evening'
end;


