# 2.07 Activity 3

In this activity, we will be using the `bank` database.

1. Find out how many cards of each type have been issued.
2. Find out how many customers there are by the district.
3. Find out average transaction value by type.
4. As you might have seen in the query shown below, there are 19 rows returned by this query. But there a few places where the column `k_symbol` is an empty string. Your task it to use a filter to remove those rows of data. After the filter gets applied, you would see that the number of rows have reduced.

    ```sql
    select type, operation, k_symbol, round(avg(balance),2)
    from bank.trans
    group by type, operation, k_symbol
    order by type, operation, k_symbol;
    ```

