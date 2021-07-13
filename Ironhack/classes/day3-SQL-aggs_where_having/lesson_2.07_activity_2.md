# 2.07 Activity 2

1. What could be possible anomalies in a table?

2. In the class, we looked at an example where the problem statement was -> "What is the average loan amount taken by customers in each of the status categories?     Arrange them from highest to lowest"
  The query is shown below: 

    ```sql
    select avg(amount) as Average, status from bank.loan
    group by Status
    order by Average asc;
    ```
  
    Your objective is to find the **maximum** and the **minimum** in each `Status` category. 
  
  
