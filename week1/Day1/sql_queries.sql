-- Query 1:  Display all records from Sales table

SELECT -- Data retrieval command used to select data from a database.
*      -- Selects all columns from Sales Table (everything)
FROM      -- Used for retrieving data from a Sales table.
Sales;    -- Table name from which data is being retrieved.

===============================================================================================================

-- Query 2: Retrieve records from Sales table where region is 'East'
Select 
  * 
from 
  Sales
where               -- condition used to filter records.
  region = 'East';  -- Filters the records to only include those where the region is 'East'.

==============================================================================================================

-- Query 3: Retrieve records from Sales table where sales amount is greater than 1000 and region is 'West'
Select 
  * 
from
  Sales
where 
  sales_amount > 1000 and region = 'West';  -- Filters the records to only include those where sales amount is greater than 1000 and region is 'West'.

-- AND Operator is used to combine multiple conditions in a WHERE clause.In this case, both conditions must be true for a record. 
========================================================================================================================================================

-- Query 4: Retrieve records from Sales table where state is 'Florida' or 'California'.
Select 
  *
from 
  Sales
where 
  state = 'Florida' or state = 'California';  -- Filters the records to only include those where state is either 'Florida' or 'California'.

-- OR Operator is used to combine multiple conditions in a WHERE clause. In this case, at least one of the conditions must be true for a record.

=========================================================================================================================================================

-- Query 5: Retrieve records from Sales table where sales amount is between 300 and 600.
Select 
  *
from 
  Sales
where 
  sales between 300 and 600;  -- Filters the records to only include those where sales amount is between 300 and 600.

-- BETWEEN Operator is used to filter the records based on a range of values.
==================================================================================================================================


-- Query 6: Retrieve records from Sales table where region are not in  ('North'  and 'West')
Select 
  *
from 
  Sales
where 
  region not in ('North', 'West');  -- Filters the records to only include those where region are not  in ('North',  'West').

-- NOT IN Operator is used to filter the records based on a list of values. In this case, it excludes records where the region is either 'North' or 'West'.
=============================================================================================================================================================

-- Query 7: Retrieve records from Sales table where state is not null.
Select 
  *
from 
  Sales
where 
  state is not null;  -- Filters the records to only include those where state is not null.

-- IS NOT NULL Operator is used to filter the records where a specific column does not contain null values.
==============================================================================================================================

-- Query 8: Retrieve records from Sales table where customer order id  starts with 'US'.
Select 
  *
from 
  Sales
where 
  order_id like 'US%';  -- Filters the records to only include those where customer order id starts with 'US'.

-- LIKE Operator is used to pattern match the records based on a specific string.
==============================================================================================================================

-- Query 9: Retrieve records from Sales table where customer Id ends with '195'.
Select 
  *
from
  Sales
where 
  customer_id like '%195';  -- Filters the records to only include those where customer Id ends with '195'.

==============================================================================================================================

-- Query 10: Retrieve records from Sales table where city is in ('Columbus', 'Chicago').
Select 
  *
from
  Sales
where 
  city in ('Columbus', 'Chicago');  -- Filters the records to only include those where city is in ('Columbus', 'Chicago').

-- IN Operator is used to filter the records based on a list of values. In this case, it includes records where the city is either 'Columbus' or 'Chicago'.

