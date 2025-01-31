# Amazon-Sales-Performance-Analysis
### 📖 Project Overview
The primary objective of this project is to analyze Amazon sales data to uncover key insights into sales trends, customer behavior, and product performance across different branches.

### 📂 Dataset
The dataset consists of sales transactions from three Amazon branches located in Mandalay, Yangon, and Naypyitaw. It contains 17 columns and 1000 rows, representing various details about sales transactions, customer information, and financial metrics.

### 📋 Analysis Goals
#### The project involves three main areas of analysis:
#### 1. Product Analysis
- Identify the most and least performing product lines.
- Understand which product categories require improvement.

#### 2. Sales Analysis
- Examine sales trends over time.
- Evaluate the effectiveness of different sales strategies.
- Identify peak sales periods.

#### 3. Customer Analysis
- Segment customers based on purchasing behavior.
- Identify high-value customer segments.
- Analyze customer demographics and preferences.

### 📌 Approach & Methodology
#### 1. Data Wrangling
- Inspect data for missing/null values.
- Handle missing values (if any) using appropriate replacement methods.
- Create and populate a database for structured analysis.

#### 2. Feature Engineering
- **Time of Day**: Categorizing transactions into Morning, Afternoon, and Evening.
- **Day of the Week**: Extracting weekday names to analyze sales distribution.
- **Month of the Year**: Identifying seasonal trends in sales performance.

#### 3. Exploratory Data Analysis (EDA)
- EDA is performed to derive meaningful insights and answer key business questions related to product sales, customer behavior, and financial performance

### 🛠️ Tools and Platform
- **SSMS (SQL Server Management Studio)** – Used for executing SQL queries and performing data analysis.

### 💡 Key Insights
#### 1. Product Analysis: 
- The 'Food and Beverages' product line leads in sales with a revenue of 56,144.84, followed by 'Sports and Travel' and 'Electronic Accessories'.
- All product lines are performing well above the total sales average, showcasing strong demand, while 'Home and Lifestyle' has the lowest average rating (6.84), indicating potential areas for improvement in     
  customer satisfaction.

#### 2. Sales Analysis: 
- January recorded the highest revenue of 116,291.87, as well as the peak cost of goods sold at 110,754.16, highlighting it as the most profitable month
- Afternoon hours see the most sales activity during weekdays, with 326 sales, emphasizing the importance of targeting this time slot.

#### 3. Customer Analysis: 
- 'Member' type customers dominate transactions, contributing the highest revenue and VAT payments, with 501 transactions and a VAT of 7,820.16.
- Females are the predominant customer group with 501 transactions, and Branch 'A' in Yangon leads in customer count with 340 customers, consisting of 161 females and 179 males.
