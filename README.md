# Capstone Project: Retail Sales
# Data Science Institute - Cohort 5 - Team 11 Project

# Project Overview:

As part of the Data Science Certificate program at the University of Toronto our machine learning capstone project involved applying our theoretical and technical skillset to a real world scenario. The dataset we chose was a Retail Sales dataset that can be used to predict the product category a customer is likely to purchase based on factors such as their age, gender/sex, and previous purchase history. This project aims to apply exploratory data analysis, advanced analytics, and machine learning techniques to gain actionable insights that can help businesses optimize product inventory, and enhance customer engagement. 

# Dataset:

Our retail sales dataset from Kaggle ([Retail Sales Dataset](https://www.kaggle.com/datasets/mohammadtalib786/retail-sales-dataset)) consists of attributes that drive retail operations and customer interactions that can be oberved in the real world. The dataset consists of essential attributes such as Transaction ID, Date, Customer ID, Gender, Age, Product Category, Quantity, Price per Unit, and Total Amount. These attributes allow for an in-depth exploration of sales trends, product preferences, and puchasing behaviour. The analysis and insights gained from this project can be used to personalize products to each customer in the future. Based on our insights, this project demonstrates our team work and potential to contribute to the data science or machine learning field.

# Members

| Name                     | LinkedIn Profile | GitHub Profile |
|--------------------------|-----------------|---------------|
| Abrahim Senra Abrahao   | [LinkedIn](https://www.linkedin.com/in/abrahimsa) | [GitHub](https://github.com/AbrahimSA) |
| Amit Kumar Sindhwani    | [LinkedIn](https://www.linkedin.com/in/amit-sindhwani/) | [GitHub](https://github.com/amitsindhwani) |
| Hamid Moaf             | [LinkedIn](#) | [GitHub](https://github.com/hamimoaf) |
| Lisa Thurairasu        | [LinkedIn](https://www.linkedin.com/in/lisathurairasu/) | [GitHub](https://github.com/lthurair) |
| Nipun Puri            | [LinkedIn](https://www.linkedin.com/in/nipunpuri/) | [GitHub](https://github.com/nipunpuri) |
| Sreesha Pannikode Puthanveedu | [LinkedIn](https://www.linkedin.com/in/sreesha-pannikode-puthanveedu-22216498) | [GitHub](https://github.com/Sreeshap01) |


# Business Case:

Retail businesses often struggle to identify which products are most likely to be purchased by specific customer segments. This results in:

- **Inefficient marketing strategies** Generic promotions instead of personalized recommendations.
- **Suboptimal inventory management** Stocking products without understanding demand from different customer groups.
- **Missed revenue opportunities** Lack of tailored cross-sell and up-sell strategies.

This project focuses on the following objectives:
- Predict the likelihood of a customer purchasing specific product categories based on their age, gender/sex, previous purchase history
- Enable personalized recommendation of the next product category

# Project Plan:

To explore the retail sales dataset, we will focus on the following objectives:
1. **Data Preparation:** 
    - Data cleaning, determining outliers and missing values, transforming variables
2. **Exploratory Data Analysis (EDA):**
    - Understand sales trends, customer purchasing behaviour, product preferences, and influential factors
3. **Feature Engineering:** 
    - Create and derive new features, perform one-hot encoding or create dummy variables
4. **Customer Segmentation:** 
    - Apply clustering algorithms (i.e., K-Means or KNN) to identify customer groups based on purchasing behaviour
5. **Model development and Evaluation:** 
    - Build several models to predict what product category a customer will purchase and determine the best-fitting model based on evaluation metrics.
    
        Models include:
        - **XGBoost Model:** a decision tree classifier
        - **Feed Forward Neural Network:** deep learning model
        - **Recommendation System:** another deep learning model
6. **Business Insights:** 
    - Summary findings of the data analysis, models, and results will help the retail store owner manage product inventory by knowing what products customers are buying and thus, will help increase customer satisfaction.


# Exploratory Data Analysis:
Our retail sales dataset consists of following attributes: 

1. **Transaction ID:** Each transaction in the dataset is represented by a unique identifier that allows tracking and reference.

2. **Date:** Ths attribute represents the date when the transaction occurred, it helps in understanding sales in specific month or periods.

3. **Customer ID:** This is a unique identifier that represents the customer who made that transaction. This attributes enabling customer-centric analysis.

4. **Gender:** This attribute represents the gender of the customer - Male or Female. This helps in gaining insights into gender-based purchasing patterns.

5. **Age:** This attribure represents the age of the customer. The age allows to understand age related purchasing behaviours and segmentation. 

6. **Product Category:** This attribute Specifies the type of product purchased, such as Electronics, Clothing, or Beauty. This helps in identifying sales trends, customer preferences, and category-wise revenue distribution.

7. **Quantity:** Represents the number of units of a product bought in a transaction. Analyzing quantity data helps in demand forecasting, inventory management, and identifying high-volume products.

8. **Price per Unit:** This attribute indicates the cost of a single unit of the product. This is essential for calculating revenue, and analyzing price sensitivity among customers.

9. **Total Amount:** The overall transaction value derived from multiplying quantity by price per unit. This metric is crucial for revenue analysis, customer spending patterns, and profitability assessments.

## Findings on the Retail Dataset

- The dataset contains no missing values.
- There are no duplicate rows in the data.

### Some findings on the columns 
- Gender:
    - There are two unique values:
        - Female
        - Male
    - 51% of purchases were made by female customers, and 49% by male customers.

- Age
    - Customer ages range from 18 to 64 years old.
    - The mean age of customers is approximately 41 years.
    - The age range for Female customers is between 18 and 64 years.
    - Similarly, the age range for Male customers is between 18 and 64 years.

- Quantity
    - The minimum quantity purchased per transaction is 1, and the maximum is 4.
    - The average quantity purchased per transaction is 2.5 (approximately 3).

- Product Category
    - There are three unique product categories in the data:
        - Beauty
        - Clothing
        - Electronics 

    - The distribution of transactions in each of these categories is as follows
        - Clothing       35.1%
        - Electronics    34.2%
        - Beauty         30.7%

- Price per Unit
    - The minimum price per unit is $25, and the maximum price is $500.
    - The average price per unit is $180.
    - The price range for the Beauty category is between $25 and $500.
    - The price range for the Clothing category is between $25 and $500.
    - The price range for the Electronics category is between $25 and $500.


## Plotted the monthly max and min sales and the top performing product category
- The plot reveals that the Electronics product category recorded the highest sales in February, May, June, August, October, and December of 2023
- Meanwhile, the Clothing category led in sales during January, March, April, September, and November of the same year.

**This insight suggests that businesses should prioritize**
- stocking popular products in the high-performing Electronics category, followed by Clothing, to maximize sales opportunities.

## Plotted the total sales based on Age groups
- The plot indicates that the majority of customers fall within the 36-65 age range.
- The 56-65 age group has the highest number of purchases, followed closely by the 36-45 and 46-55 age groups, with only a slight variation in sales among them.

**This insight suggests that businesses should prioritize**
- Tailoring marketing strategies and product offerings to appeal to customers aged 36-65.
- Creating loyalty programs or personalized promotions for the 56-65 demographic, as they are the most active buyers.
- Ensuring a seamless shopping experience to cater to this age group’s preferences

# Limitations with Data set

- The dataset consists of only 1,000 rows, making it insufficient for addressing complex retail challenges.
- Each customer has only a single recorded transaction, preventing the identification of loyal customers.
- There is no indication of whether transactions occurred in-store or online, which could aid in customer segmentation based on purchasing preferences and enable personalized offers to drive more sales
- The dataset does not provide insights into customer purchase frequency.
- It is not possible to analyze monthly or quarterly purchase patterns for specific customers.
- The dataset includes only product categories without detailed product information. For example, within the electronics category, it is unclear whether customers are purchasing a TV or a monitor, or which TV brand is the most popular.


# Feature engineering
- We begin with a transaction dataset where each record represents a customer's transaction. Customer-level features are engineered for model training, as defined in feature_eng.sql

### Customer-Level Features

- **Customer_ID:** Unique customer identifier.
- **age_range:** Age binned into groups (<20, 20–29, 30–39, 40–49, 50–59, ≥60) and dummy-coded.
- **HolidayName:** Last holiday shopped, encoded as an indicator.
- **Month_name:** Transaction month to capture seasonality.
- **spend_3m:** Total spend in the last 3 months.
- **QTY_3m:** Total units purchased in the last 3 months.
- **spend_12m:** Total spend in the last 12 months.
- **QTY_12m:** Total units purchased in the last 12 months.
- **gender_dummy:** Gender encoded as a dummy variable.

### External Data (Toronto)

- **Max_Temp:** Daily maximum temperature.
- **Min_Temp:** Daily minimum temperature.
- **Mean_Temp:** Daily average temperature.
- **Total_Precip_mm:** Daily precipitation (mm).

### Target Variable

- **Product_Category**

### Customer-Level Features

# Segmentation
- Here we tried to find insights on the customer spending behaviours based on their age and the gender.
### K-Means clustering based on age and total amount.
K- means clustering was applied to cluster the customers based on age and total amount.The findings were plotted for visualization. 

Across all age groups, low spenders are more common, while high spenders are relatively rare. This suggests that age is not a significant factor in determining spending behavior within this population.

### K-Means clustering based on gender and total amount.
K- means clustering was applied to cluster the customers based on gender and total amount.The findings were plotted for visualization. 

In both genders, there is equal distribution of low , medium and high spenders. There is more of low spenders in both the genders in the population, which is consistent with the insights of the segmentation based on the age and the total amount spent.






# Business Insights

This will be the summary of findings at the conclusion of the team project based on the EDA and model results.

## Segmentation Insights


K-means clustering was performed using age and total amount, and gender and total amount.

Across all age groups, low spenders are more common, while high spenders are relatively rare. This suggests that age is not a significant factor in determining spending behavior within this population.

In both genders, there is equal distribution of low , medium and high spenders. There is more of low spenders in both the genders in the population, which is consistent with the insights of the segmentation based on the age and the total amount spent.











