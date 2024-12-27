-- SET I HANDS ON QUESTIONS
--
-- Practice Question #1
-- Select the product name and product number from the product table
-- AND unit price from the SalesOrderDetail table after implementing the CROSS JOIN
--
SELECT
  p.name,
  p.productnumber,
  s.unitprice
FROM
  products p
  CROSS JOIN sales_order_detail s;

-- count: 159,890
--
-- Practice Question #2
-- Select the product name from the product table and the unit price from the SalesOrderDetail table
-- after implementing the INNER JOIN on the column Product_Id.
--
SELECT
  p.name,
  p.productnumber,
  s.unitprice
FROM
  products p
  INNER JOIN sales_order_detail s ON p.productid = s.productid;

-- count: 542
--
-- Practice Question #3
-- Select the product name from the product table, and the unit price from the SalesOrderDetail table
-- after implementing the LEFT JOIN on the column ProductId.
--
SELECT
  p.name,
  p.productnumber,
  s.unitprice
FROM
  products p
  LEFT JOIN sales_order_detail s ON p.productid = s.productid;

-- count: 695
--
-- Practice Question #4
-- Select the product name from the product table and the  unit price from the SalesOrderDetail table
-- after implementing the RIGHT JOIN from salesorderDetail table to product table on the column ProductId
--
SELECT
  p.name,
  p.productnumber,
  s.unitprice
FROM
  sales_order_detail s
  RIGHT JOIN products p ON s.productid = p.productid;

-- count: 695
--
