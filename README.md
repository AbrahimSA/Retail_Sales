# Capstone Project: Retail Sales
# Data Science Institute - Cohort 5 - Team 11 Project

# Project Overview:

As part of the Data Science Certificate program at the University of Toronto our machine learning capstone project involved applying our theoretical and technical skillset to a real world scenario. The dataset we chose was a Retail Sales dataset that can be used to predict the product category a customer is likely to purchase based on factors such as their age, gender/sex, and previous purchase history. This project aims to apply exploratory data analysis, advanced analytics, and machine learning techniques to gain actionable insights that can help businesses optimize product inventory, and enhance customer engagement. 

# Dataset:

Our retail sales dataset from Kaggle ([Retail Sales Dataset](https://www.kaggle.com/datasets/mohammadtalib786/retail-sales-dataset)) consists of attributes that drive retail operations and customer interactions that can be oberved in the real world. The dataset consists of essential attributes such as Transaction ID, Date, Customer ID, Gender, Age, Product Category, Quantity, Price per Unit, and Total Amount. These attributes allow for an in-depth exploration of sales trends, product preferences, and puchasing behaviour. The analysis and insights gained from this project can be used to personalize products to each customer in the future. Based on our insights, this project demonstrates our team work and potential to contribute to the data science or machine learning field.

# Members
Abrahim Senra Abrahao ()
Amit Kumar Sindhwani ()
Hamid Moaf ()
Lisa Thurairasu (lthurair)
Nipun Puri ()
Sreesha Pannikode Puthanveedu ()

# Business Case:

Our project will focus on the following objectives:
- predict the product category a customer is likely to purchase based on their age, gender/sex, previous purchase history, and other factors

# Project Plan:

To explore the retail sales dataset, we will focus on the following objectives:
1. Exploratory Data Analysis (EDA): Understanding sales trends, customer purchasing behaviour, product preferences, and influential factors
2. Customer Segmentation: Applying clustering algorithms (i.e., K-Means or KNN) to identify customer groups based on purchasing behaviour
3. Product Recommendation System: Utilizing deep learning to recommend products

# Requirements
This project uses the following Python libraries

- numPy : For faster numeric operations.
- pandas : For data manipulation and analysis.
- matplotlib : For creating graphs and plots.
- seaborn : For improving visualization of matplotlib plots.
- sklearn : For machine learning models.


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















