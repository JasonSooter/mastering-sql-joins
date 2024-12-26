------------------------
------------------------
-- Calculated Columns --
-- AKA Derived Column --
------------------------
------------------------
--
----------------------------------------------------------------------------------------------------
-- Display the employee rating with the final comments along with their name.
-- The name should be a Combination of First Name and Last Name Separated by a blank
-- and Should appear as Employee_Name in the final dataset. -
----------------------------------------------------------------------------------------------------
--
SELECT
  concat(e.first_name, ' ', e.last_name) AS Employee_Name,
  p.final_rating AS rating,
  p.final_comments AS comments
FROM
  employees e
  INNER JOIN performance_reviews p ON e.employee_id = p.employee_id;

--
-- "employee_name","rating","comments"
-- "Jane Smith",4,"Good performance during the year, Can be Improved."
-- "Dane Wade",3,"meets expectations."
-- "Michael Hoffman",5,"Superb performance, exceeding expectations."
-- "Sarah Brown",2,"Needs to be organized and improvement required in communication skills."
-- "Emily Ritter",4,"Good Overall Work! Demonstrates strong teamwork skills."
--
----------------------------------------------------------------------------------------------------
-- Exercise 1 - Mathematical Functions
-- Display the First_Name, Last_Name, and the salary of an employee if increased by 20%.
-- Employee must have a final rating of 4
----------------------------------------------------------------------------------------------------
--
SELECT
  first_name,
  last_name,
  final_rating AS rating,
  ROUND(salary * 1.2, 2) AS incremented_salary
FROM
  employees e
  INNER JOIN performance_reviews p ON e.employee_id = p.employee_id
WHERE
  p.final_rating >= 4
ORDER BY
  final_rating DESC;

--
-- "first_name","last_name","rating","incremented_salary"
-- "Michael","Hoffman",5,"7800.00"
-- "Jane","Smith",4,"7440.00"
-- "Emily","Ritter",4,"6120.00"
--
----------------------------------------------------------------------------------------------------
-- Exercise 2 - String Functions
-- Display the names of employees in the upper case along with their Final Performance Review Comments
----------------------------------------------------------------------------------------------------
--
SELECT
  UPPER(first_name),
  UPPER(last_name),
  final_comments
FROM
  employees e
  INNER JOIN performance_reviews p ON e.employee_id = p.employee_id;

--
-- "upper","upper (1)","final_comments"
-- "JANE","SMITH","Good performance during the year, Can be Improved."
-- "DANE","WADE","meets expectations."
-- "MICHAEL","HOFFMAN","Superb performance, exceeding expectations."
-- "SARAH","BROWN","Needs to be organized and improvement required in communication skills."
-- "EMILY","RITTER","Good Overall Work! Demonstrates strong teamwork skills."
--
----------------------------------------------------------------------------------------------------
-- Exercise 3 - Date & Time Functions
-- Write a SQL query to retrieve:
--   - first name of the employee
--   - month of the review date.
-- The extracted month should be displayed as a month name instead of a numeric value.
-- That means 1 represents January, 2 represents February, and so on.
----------------------------------------------------------------------------------------------------
--
SELECT
  first_name,
  TO_CHAR(review_date, 'Month') AS review_month
FROM
  employees e
  JOIN performance_reviews p ON e.employee_id = p.employee_id;

--
-- "first_name","review_month"
-- "Jane","January"
-- "Dane","February"
-- "Michael","March"
-- "Sarah","April"
-- "Emily","May"
--
----------------------------------------------------------------------------------------------------
-- Exercise 4 - Conditional Statements
-- Display the following for all employees:
--   - first name
--   - last name
--   - final rating
--   - rating status
-- To calculate the rating status based on the final rating value, use below logic:
--   1. "Top Rating" when the final rating is 4 or above
--   2. "Average Rating" when the final rating is between 2 and 4
--   3. "Low Rating" when the final rating is 2 or below
--   4. "No Rating Provided" when there is no rating provided
----------------------------------------------------------------------------------------------------
--
SELECT
  first_name,
  last_name,
  final_rating AS rating,
  CASE WHEN final_rating >= 4 THEN
    'Top Rating'
  WHEN final_rating > 2
    AND final_rating < 4 THEN
    'Average Rating'
  WHEN final_rating <= 2 THEN
    'Low Rating'
  ELSE
    'No Rating Provided'
  END AS rating_status
FROM
  employees e
  INNER JOIN performance_reviews p ON e.employee_id = p.employee_id
ORDER BY
  rating_status DESC;

--
-- "first_name","last_name","rating","rating_status"
-- "Jane","Smith",4,"Top Rating"
-- "Michael","Hoffman",5,"Top Rating"
-- "Emily","Ritter",4,"Top Rating"
-- "Sarah","Brown",2,"Low Rating"
-- "Dane","Wade",3,"Average Rating"
--
----------------------------------------------------------------------------------------------------
-- Exercise 5 - Conversion Functions
-- Display the following for all employees:
--   - first name
--   - final rating
--   - review date
-- The review_date should be in datetime format instead of date format
----------------------------------------------------------------------------------------------------
--
SELECT
  first_name,
  final_rating,
  review_date::timestamp AS review_date
FROM
  employees e
  INNER JOIN performance_reviews p ON e.employee_id = p.employee_id;

--
-- "first_name","final_rating","review_date"
-- "Jane",4,"2022-01-15 00:00:00"
-- "Dane",3,"2022-02-28 00:00:00"
-- "Michael",5,"2022-03-10 00:00:00"
-- "Sarah",2,"2022-04-05 00:00:00"
-- "Emily",4,"2022-05-20 00:00:00"
--
----------------------------------------------------------------------------------------------------
-- Exercise 6 - Aggregate Functions
-- Display the average rating of employees for each department along with department_Id
----------------------------------------------------------------------------------------------------
--
SELECT
  e.department_id,
  round(AVG(p.final_rating), 2) AS average_rating
FROM
  employees e
  INNER JOIN performance_reviews p ON e.employee_id = p.employee_id
GROUP BY
  e.department_id;

--
-- "department_id","average_rating"
-- 3,"4.00"
-- 2,"3.00"
-- 1,"4.00"
--
