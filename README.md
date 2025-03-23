Pizza Sales Analysis SQL Project
================================

This project contains an SQL analysis of a pizza sales dataset. The objective is to perform a series of analytical queries—from basic aggregations to advanced revenue breakdowns—to better understand pizza sales dynamics. The project is implemented using MySQL.

Project Overview
----------------

The analysis covers three levels of complexity:

### Basic Analysis

*   **Total Orders:** Retrieve the total number of orders placed.
    
*   **Total Revenue:** Calculate the total revenue generated from pizza sales.
    
*   **Highest-Priced Pizza:** Identify the highest-priced pizza.
    
*   **Common Pizza Size:** Identify the most common pizza size ordered.
    
*   **Top 5 Pizza Types:** List the top 5 most ordered pizza types along with their quantities.
    

### Intermediate Analysis

*   **Category Quantity:** Join the necessary tables to find the total quantity of each pizza category ordered.
    
*   **Hourly Distribution:** Determine the distribution of orders by the hour of the day.
    
*   **Category-Wise Distribution:** Join relevant tables to find the category-wise distribution of pizzas.
    
*   **Daily Average Orders:** Group the orders by date and calculate the average number of pizzas ordered per day.
    
*   **Top 3 by Revenue:** Determine the top 3 most ordered pizza types based on revenue.
    

### Advanced Analysis

*   **Revenue Contribution:** Calculate the percentage contribution of each pizza type to total revenue.
    
*   **Cumulative Revenue:** Analyze the cumulative revenue generated over time.
    
*   **Top 3 per Category:** Determine the top 3 most ordered pizza types based on revenue for each pizza category.
    

The SQL queries for all the above analyses are implemented in the provided `SQL Learn.sql` file.

Data Source
-----------

The dataset used for this project is available on Kaggle:

*   [Pizza Sales Analysis Dataset](https://www.kaggle.com/datasets/soumaghara/pizza-sales-analysis)
    

Tutorial Reference
------------------

The project was inspired by and follows along with the tutorial available on YouTube:

*   [SQL Project Tutorial](https://youtu.be/zZpMvAedh_E?si=CTsUtQmbdTJjfrCL)
    

How to Use
----------

1.  **Clone the Repository:**
    
    `git clone https://github.com/yourusername/Pizza-Sales-Analysis-SQL.git` 
    
2.  **Set Up the Database:**
    
    *   Import the dataset into your MySQL database.
        
    *   Run the `SQL Learn.sql` file in your MySQL client to create views and execute all the queries.
        
3.  **Review and Modify:**
    
    *   Feel free to modify the SQL queries or extend the analysis as needed.
        
    *   Use this project as a learning tool for SQL data analysis and for reference in your own projects.
        

Requirements
------------

*   MySQL Server (or any MySQL-compatible database)
    
*   Basic knowledge of SQL and database management
    

License
-------

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

Credits
-------

*   **Dataset:** [Kaggle - Pizza Sales Analysis](https://www.kaggle.com/datasets/soumaghara/pizza-sales-analysis)
    
*   **Tutorial:** [YouTube SQL Tutorial](https://youtu.be/zZpMvAedh_E?si=CTsUtQmbdTJjfrCL)
