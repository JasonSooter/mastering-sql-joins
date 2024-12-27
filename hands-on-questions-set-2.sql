-- SET II HANDS ON QUESTIONS
--
-- Practice Question #5
-- Retrieve the first name and last name of a customer
-- AND the order date for all those customers from the table "Customer" and "SalesOrderHeader" tables.
--
SELECT
  firstname,
  lastname,
  orderdate::date
FROM
  customers c
  JOIN sales_order_header soh ON c.customerid = soh.customerid;

--
--
-- Practice Question #6
-- Find the SalesOrderId, ProductId, ProductName, ProductName, and ProductNumber
-- for all the products present in the [SalesOrderDetail] and [Product] tables.
--
SELECT
  salesorderid,
  p.productid,
  name,
  productnumber
FROM
  sales_order_detail sod
  JOIN products p ON sod.productid = p.productid;

--
--
-- Practice Question #7
-- Find all the Product_Id, ProductName, ProductNumber, SalesOrderId, And OrderQuantity
-- from the [Product] and [SalesOrderDetail] tables,
-- even if the [SalesOrderDetail] doesn't have any data related to the corresponding product.
--
SELECT
  p.productid,
  name,
  productnumber,
  salesorderid,
  orderqty
FROM
  products p
  LEFT OUTER JOIN sales_order_detail sod ON p.productid = sod.productid;

--
--
-- Practice Question #8
-- Find all the AddressID, AddressLine1, CountryRegion, and CustomerID data
-- from the tables [CustomerAddress] and [Address] tables,
-- even if it doesn't have any related customer_id in the customer_address table.
--
SELECT
  a.addressid,
  addressline1,
  countryregion,
  customerid
FROM
  addresses a
  LEFT JOIN customer_address ca ON a.addressid = ca.addressid;

--
--
-- Practice Question #9
-- Display the Customer's First_Name, Last_Name, Company_Name, Address and Country_Region
-- of all the customers present in the customer table. The other related information can
-- be pulled from [CustomerAddress] and [Address] table.
--
SELECT
  firstname,
  lastname,
  companyname,
  addressline1,
  countryregion
FROM
  customers c
  INNER JOIN customer_address ca ON c.customerid = ca.customerid
  INNER JOIN addresses a ON ca.addressid = a.addressid;

--
--
-- Practice Question #10
-- Display the Customer's First_Name, Last_Name, Company_Name, Address and Country_Region
-- of all the customers present in the customer table
-- even if they don't have any address related information in [CustomerAddress] and [Address] table
--
SELECT
  firstname,
  lastname,
  companyname,
  addressline1,
  countryregion
FROM
  customers c
  LEFT JOIN customer_address ca ON c.customerid = ca.customerid
  LEFT JOIN addresses a ON ca.addressid = a.addressid;

--
--
-- Practice Question #11
-- Display the name, colour, and list price of products where the product category name is Accessories
-- by joining the tables  [Product] and [ProductCategory]
--
SELECT
  p.name,
  p.color,
  p.listprice,
  pc.name AS product_category_name,
  pc.parentproductcategoryid
FROM
  products p
  INNER JOIN product_category pc ON p.productid = p.productid
WHERE
  pc.name ILIKE '%accessories%';

--
--
-- Practice Question #12
-- Find all the names, productnumber, color, and description from the tables product
-- and ProductAndDescription where the description contains the word "off-road."
--
SELECT
  p.name,
  p.productnumber,
  p.color,
  pad.description
FROM
  products p
  INNER JOIN product_and_description pad ON p.productid = pad.productid
WHERE
  pad.description ILIKE '%off-road%';

--
--
-- Practice Question #13
-- Find the ProductModels and their total count where the description contains the word "aluminum"
-- and the color of the product IS 'Black'
--
SELECT
  pad.productmodel,
  count(*) AS total_count
FROM
  product_and_description pad
  INNER JOIN products p ON p.productid = pad.productid
WHERE
  p.color = 'Black'
  AND pad.description ILIKE '%aluminum%'
GROUP BY
  pad.productmodel;

--
--
-- Practice Question # 14
-- Find Country WITH most shipped ORDER quantities
-- WHERE Status = 5 FROM sales ORDER header TABLE means shipped
--
SELECT
  countryregion AS country_with_most_shipped_order_quantities
FROM
  sales_order_header soh
  INNER JOIN addresses a ON soh.shiptoaddressid = a.addressid
  INNER JOIN sales_order_detail sod ON soh.salesorderid = sod.salesorderid
WHERE
  soh.status = 5
GROUP BY
  countryregion,
  status
ORDER BY
  sum(orderqty) DESC
LIMIT 1;

--
--
-- Practice Question #15
-- Find and display the customerId, FirstName, LastName, EmailAddress and Company Name
-- of customers who never made an order.
--
SELECT
  c.customerid,
  c.firstname,
  c.lastname,
  c.emailaddress,
  c.companyname
FROM
  customers c
  LEFT JOIN sales_order_header soh ON c.customerid = soh.customerid
WHERE
  soh.customerid IS NULL;

--
--
-- Practice Question #16
-- Find the TOP 10 Company Names With the Highest Order values (Line Total Values) DESC
-- Consolidate the sum of all orders for each company
--
SELECT
  c.companyname,
  round(sum(sod.linetotal), 2) AS total_order_value
FROM
  customers c
  INNER JOIN sales_order_header soh ON c.customerid = soh.customerid
  INNER JOIN sales_order_detail sod ON soh.salesorderid = sod.salesorderid
GROUP BY
  c.companyname
ORDER BY
  total_order_value DESC
LIMIT 10;

--
--
-- Practice Question #17
-- Find Company Names With the Lowest Order Values Order By Order Values ASC
-- consolidate the orders value for each company.
--
SELECT
  c.companyname,
  round(sum(sod.linetotal), 2) AS total_order_value
FROM
  customers c
  INNER JOIN sales_order_header soh ON c.customerid = soh.customerid
  INNER JOIN sales_order_detail sod ON soh.salesorderid = sod.salesorderid
GROUP BY
  c.companyname
ORDER BY
  total_order_value ASC
LIMIT 10;

--
--
-- Practice Question #18
-- Find the top 5 customers with the highest total order values across all countries,
-- along with their respective country and total order values.
--
SELECT
  c.companyname,
  a.countryregion,
  round(sum(sod.linetotal), 2) AS total_order_value
FROM
  customers c
  INNER JOIN sales_order_header soh ON c.customerid = soh.customerid
  INNER JOIN addresses a ON soh.shiptoaddressid = a.addressid
  INNER JOIN sales_order_detail sod ON soh.salesorderid = sod.salesorderid
GROUP BY
  c.companyname,
  a.countryregion
ORDER BY
  total_order_value DESC
LIMIT 5;

--
--
-- Practice Question #19
-- SELECT the product models along with their total count where the color IS 'Red'
-- and the description of the product has the word aluminium in it
-- and the total count is greater than 250.
--
SELECT
  pad.productmodel,
  count(*) AS total_count
FROM
  product_and_description pad
  INNER JOIN products p ON p.productid = pad.productid
WHERE
  p.color = 'Red'
  AND pad.description ILIKE '%aluminum%'
GROUP BY
  pad.productmodel
HAVING
  count(1) > 250;

--
--
-- Practice Question #20
-- SELECT the product names along with their total count where the color
-- is neither red 'Red' nor 'Black'
-- and the description of the product category is not 'Bikes'.
--
SELECT
  p.name,
  count(*) AS total_count
FROM
  products p
  INNER JOIN product_category pc ON p.productcategoryid = pc.productcategoryid
WHERE
  p.color NOT IN ('%Red%', '%Black%')
  AND pc.name NOT ILIKE '%Bikes%'
GROUP BY
  p.name;

--
--
-- Practice Question #21
-- Find the name, ListPrice, OrderQuantity, SalesPerson, and the customer name
-- that is concatenated using the customer's first name and last name
-- where the Salesperson field contains the string 'jae0'
-- from the tables SalesOrderDetail, Customer and Product and order by DESC.
--
SELECT
  p.name,
  p.listprice,
  sod.orderqty,
  c.salesperson,
  c.firstname || ' ' || c.lastname AS customer_name
FROM
  sales_order_detail sod
  INNER JOIN sales_order_header soh ON sod.salesorderid = soh.salesorderid
  INNER JOIN customers c ON soh.customerid = c.customerid
  INNER JOIN products p ON sod.productid = p.productid
WHERE
  c.salesperson ILIKE '%jae0%'
ORDER BY
  sod.orderqty DESC;

--
--
-- Practice Question #22
-- Display the Customer_Id, Customer_Name ( after concatenating First Name and Last Name )
-- their shipping address as Customer_Shipping_Address( After concatenating Address line 1 and address line 2)
--  and replace null with blank space
-- And Country region-that have a shipping address in the United states region
-- and TaxAmount greater than 500.
--
SELECT
  c.customerid,
  c.firstname || ' ' || c.lastname AS customer_name,
  coalesce(a.addressline1, '') || ' ' || coalesce(a.addressline2, '') AS customer_shipping_address,
  a.countryregion
FROM
  customers c
  INNER JOIN sales_order_header soh ON c.customerid = soh.customerid
  INNER JOIN addresses a ON soh.shiptoaddressid = a.addressid
WHERE
  a.countryregion ILIKE '%united states%'
  AND soh.taxamt > 500;

--
--
-- Practice Question #23
-- Find the Names of the 5 highest selling products based on their total order quantities sold till date.
--
SELECT
  p.name,
  sum(sod.orderqty) AS total_order_quantities_sold
FROM
  products p
  INNER JOIN sales_order_detail sod ON p.productid = sod.productid
GROUP BY
  p.name
ORDER BY
  total_order_quantities_sold DESC
LIMIT 5;

--
--
-- Practice Question #24
-- Display the Product name, Total Order quantities for every product sold, along with Sales Status.
-- When the order quantity <=10, then the Sales status should be 'Low Sales';
-- when the order quantity <= 20, the Sales status should be 'Medium Sales'.
-- When the order quantity <= 30, the Sales status should be 'High Sales',
-- For other cases display 'Not Sufficient Data'.
-- When the order quantity > 30, the Sales status should be 'Super High Sales',
-- And the order should be based on TotalOrderQuantity in Descending order.
-- HINT: Do a GROUP BY based on the Column 'Name' based on the table
-- Product Tables Involved: SalesOrderDetail,Product
--
SELECT
  p.name,
  sum(sod.orderqty) AS total_order_quantities_sold,
  CASE WHEN sum(sod.orderqty) <= 10 THEN
    'Low Sales'
  WHEN sum(sod.orderqty) <= 20 THEN
    'Medium Sales'
  WHEN sum(sod.orderqty) <= 30 THEN
    'High Sales'
  WHEN sum(sod.orderqty) > 30 THEN
    'Super High Sales'
  ELSE
    'Not Sufficient Data'
  END AS sales_status
FROM
  products p
  INNER JOIN sales_order_detail sod ON p.productid = sod.productid
GROUP BY
  p.name
ORDER BY
  total_order_quantities_sold DESC;

--
--
-- Practice Question #25
-- Display the names of customers who have the highest order value within each country
-- ( based on shipping address), along with their order quantity.
-- Add the total sum of orders and find the highest order value customer for each country
--
SELECT
  customer_name,
  countryregion,
  total_order_value
FROM (
  SELECT
    c.firstname || ' ' || c.lastname AS customer_name,
    a.countryregion,
    sum(sod.linetotal) AS total_order_value,
    ROW_NUMBER() OVER (PARTITION BY a.countryregion ORDER BY sum(sod.linetotal) DESC) AS rn
  FROM
    customers c
    INNER JOIN sales_order_header soh ON c.customerid = soh.customerid
    INNER JOIN addresses a ON soh.shiptoaddressid = a.addressid
    INNER JOIN sales_order_detail sod ON soh.salesorderid = sod.salesorderid
  GROUP BY
    c.firstname,
    c.lastname,
    a.countryregion) subquery
WHERE
  rn = 1;

--
--
-- Practice Question #26
-- Find the 2nd highest selling product in each country
--
SELECT
  product_name,
  countryregion,
  total_order_quantities_sold
FROM (
  SELECT
    p.name AS product_name,
    a.countryregion,
    sum(sod.orderqty) AS total_order_quantities_sold,
    ROW_NUMBER() OVER (PARTITION BY a.countryregion ORDER BY sum(sod.orderqty) DESC) AS rn
  FROM
    products p
    INNER JOIN sales_order_detail sod ON p.productid = sod.productid
    INNER JOIN sales_order_header soh ON sod.salesorderid = soh.salesorderid
    INNER JOIN addresses a ON soh.shiptoaddressid = a.addressid
  GROUP BY
    p.name,
    a.countryregion) subquery
WHERE
  rn = 2;

--
--
-- Practice Question #27
-- Find the products that have never been sold.
--
SELECT
  p.name
FROM
  products p
  LEFT JOIN sales_order_detail sod ON p.productid = sod.productid
WHERE
  sod.productid IS NULL
GROUP BY
  p.name;

