-----------------
-----------------
-- OUTER JOIN --
-----------------
-----------------
--
---------------------
-- LEFT OUTER JOIN --
---------------------
--
-- Query all students and their food choices
--
SELECT
  *
FROM
  students s
  LEFT OUTER JOIN food_choices f ON s.student_id = f.student_id;

--
-- "student_id","student_name","food_id","food_name","student_id (1)"
-- 1,"Liz","F2","Pizza",1
-- 1,"Liz","F3","Noodles",1
-- 2,"Dane","F1","Burger",2
-- 2,"Dane","F4","Beans & Rice",2
-- 3,"Sara","","","" -- Sara has no food choices
--
-------------------------------------------------------------------------------------
-- Question 1 - Implement a LEFT OUTER JOIN between the loans and customers tables. -
-------------------------------------------------------------------------------------
--
SELECT
  *
FROM
  loans l
  LEFT OUTER JOIN customers c ON l.customer_id = c.customer_id;

--
-- "loan_id","customer_id","loan_amount","interest_rate","terms_of_repayment","customer_id (1)","first_name","last_name","phone_number"
-- 1,101,"15000.0000","0.0522",24,101,"Dane","Wade","555-1234"
-- 2,102,"15000.0000","0.0651",12,102,"Jane","Smith","555-5678"
-- 3,103,"7510.0000","0.0445",18,103,"Michael","Hoffman","555-9998"
-- 4,104,"18000.0000","0.0675",6,104,"Sarah","Ritter","555-3456"
-- 5,105,"22000.0000","0.0950",36,105,"David","Gabier","555-6410"
--
----------------------------------------------------------------------------------------------------
-- Question 2 - Implement a LEFT OUTER JOIN between the employees and performance_reviews tables. -
----------------------------------------------------------------------------------------------------
--
SELECT
  *
FROM
  performance_reviews p
  LEFT OUTER JOIN employees e ON p.employee_id = e.employee_id;

--
-- "performance_review_id","employee_id","review_date","final_rating","final_comments","employee_id (1)","first_name","last_name","email","department_id","salary"
-- 1,102,"2022-01-15",4,"Good performance during the year, Can be Improved.",102,"Jane","Smith","jane.smith@dataceps.com",2,"6200.00"
-- 2,101,"2022-02-28",3,"meets expectations.",101,"Dane","Wade","danewade@dataceps.com",1,"7666.00"
-- 3,103,"2022-03-10",5,"Superb performance, exceeding expectations.",103,"Michael","Hoffman","michael.hoffman@dataceps.com",1,"6500.00"
-- 4,105,"2022-04-05",2,"Needs to be organized and improvement required in communication skills.",105,"Sarah","Brown","sarah.brown@dataceps.com",2,"5821.00"
-- 5,104,"2022-05-20",4,"Good Overall Work! Demonstrates strong teamwork skills.",104,"Emily","Ritter","emily.ritter@dataceps.com",3,"5100.00"
--
--------------------------------------------------------------------------------------------
-- Question 3 - Implement a LEFT OUTER JOIN between the advertisers and campaigns tables. -
--------------------------------------------------------------------------------------------
--
SELECT
  *
FROM
  advertisers a
  LEFT OUTER JOIN campaigns c ON a.advertiser_id = c.advertiser_id;

--
-- "advertiser_id","advertiser_name","email_id","phone","campaign_id","campaign_name","begin_date","end_date","total_budget","advertiser_id (1)"
-- 1,"DigiXMedia","ads@digixmedia.com","7894123166",2,"Holiday Special Final Offer","2022-12-01","2022-12-31","8020.0000",1
-- 1,"DigiXMedia","ads@digixmedia.com","7894123166",1,"Summer Clearance Sale","2022-06-01","2022-06-30","5430.0000",1
-- 2,"TRX Ventures","ads@trxventures.com","9864890453",4,"Year-End Stock Clearance","2022-12-15","2023-01-15","10050.0000",2
-- 2,"TRX Ventures","ads@trxventures.com","9864890453",3,"Product Launch Sale","2022-09-01","2022-09-30","3300.0000",2
-- 3,"HiROI Ads Agency","ads@hiroiads.com","9811537891",5,"Spring Collection","2022-03-01","2022-04-30","6450.0000",3
-- 4,"Dataceps Digital Solutions","ads@dcdsoltion.com","5516542310",6,"Back-to-College Sale","2022-08-01","2022-08-31","4067.0000",4
--
---------------------
-- RIGHT OUTER JOIN --
---------------------
--
--
-- Query all students and their food choices
--
SELECT
  *
FROM
  students s
  RIGHT OUTER JOIN food_choices f ON s.student_id = f.student_id;

--
-- "student_id","student_name","food_id","food_name","student_id (1)"
-- 1,"Liz","F2","Pizza",1
-- 1,"Liz","F3","Noodles",1
-- 2,"Dane","F1","Burger",2
-- 2,"Dane","F4","Beans & Rice",2
-- "","","F5","Pasta",""
--
-------------------------------------------------------------------------------------
-- Question 1 - Implement a RIGHT OUTER JOIN between the loans and customers tables. -
-------------------------------------------------------------------------------------
--
SELECT
  *
FROM
  loans l
  RIGHT OUTER JOIN customers c ON l.customer_id = c.customer_id;

--
-- "loan_id","customer_id","loan_amount","interest_rate","terms_of_repayment","customer_id (1)","first_name","last_name","phone_number"
-- 1,101,"15000.0000","0.0522",24,101,"Dane","Wade","555-1234"
-- 2,102,"15000.0000","0.0651",12,102,"Jane","Smith","555-5678"
-- 3,103,"7510.0000","0.0445",18,103,"Michael","Hoffman","555-9998"
-- 4,104,"18000.0000","0.0675",6,104,"Sarah","Ritter","555-3456"
-- 5,105,"22000.0000","0.0950",36,105,"David","Gabier","555-6410"
--
----------------------------------------------------------------------------------------------------
-- Question 2 - Implement a RIGHT OUTER JOIN between the employees and performance_reviews tables. -
----------------------------------------------------------------------------------------------------
--
SELECT
  *
FROM
  performance_reviews p
  RIGHT OUTER JOIN employees e ON p.employee_id = e.employee_id;

--
-- "performance_review_id","employee_id","review_date","final_rating","final_comments","employee_id (1)","first_name","last_name","email","department_id","salary"
-- 1,102,"2022-01-15",4,"Good performance during the year, Can be Improved.",102,"Jane","Smith","jane.smith@dataceps.com",2,"6200.00"
-- 2,101,"2022-02-28",3,"meets expectations.",101,"Dane","Wade","danewade@dataceps.com",1,"7666.00"
-- 3,103,"2022-03-10",5,"Superb performance, exceeding expectations.",103,"Michael","Hoffman","michael.hoffman@dataceps.com",1,"6500.00"
-- 4,105,"2022-04-05",2,"Needs to be organized and improvement required in communication skills.",105,"Sarah","Brown","sarah.brown@dataceps.com",2,"5821.00"
-- 5,104,"2022-05-20",4,"Good Overall Work! Demonstrates strong teamwork skills.",104,"Emily","Ritter","emily.ritter@dataceps.com",3,"5100.00"
--
--------------------------------------------------------------------------------------------
-- Question 3 - Implement a RIGHT OUTER JOIN between the advertisers and campaigns tables. -
--------------------------------------------------------------------------------------------
--
SELECT
  *
FROM
  advertisers a
  RIGHT OUTER JOIN campaigns c ON a.advertiser_id = c.advertiser_id;

--
-- "advertiser_id","advertiser_name","email_id","phone","campaign_id","campaign_name","begin_date","end_date","total_budget","advertiser_id (1)"
-- 1,"DigiXMedia","ads@digixmedia.com","7894123166",2,"Holiday Special Final Offer","2022-12-01","2022-12-31","8020.0000",1
-- 1,"DigiXMedia","ads@digixmedia.com","7894123166",1,"Summer Clearance Sale","2022-06-01","2022-06-30","5430.0000",1
-- 2,"TRX Ventures","ads@trxventures.com","9864890453",4,"Year-End Stock Clearance","2022-12-15","2023-01-15","10050.0000",2
-- 2,"TRX Ventures","ads@trxventures.com","9864890453",3,"Product Launch Sale","2022-09-01","2022-09-30","3300.0000",2
-- 3,"HiROI Ads Agency","ads@hiroiads.com","9811537891",5,"Spring Collection","2022-03-01","2022-04-30","6450.0000",3
-- 4,"Dataceps Digital Solutions","ads@dcdsoltion.com","5516542310",6,"Back-to-College Sale","2022-08-01","2022-08-31","4067.0000",4
--
---------------------
-- FULL OUTER JOIN --
---------------------
--
--
-- Query all students and their food choices
--
SELECT
  *
FROM
  students s
  FULL OUTER JOIN food_choices f ON s.student_id = f.student_id;

--
-- "student_id","student_name","food_id","food_name","student_id (1)"
-- 1,"Liz","F2","Pizza",1
-- 1,"Liz","F3","Noodles",1
-- 2,"Dane","F1","Burger",2
-- 2,"Dane","F4","Beans & Rice",2
-- "","","F5","Pasta",""
-- 3,"Sara","","",""
--
-------------------------------------------------------------------------------------
-- Question 1 - Implement a FULL OUTER JOIN between the loans and customers tables. -
-------------------------------------------------------------------------------------
--
SELECT
  *
FROM
  loans l
  FULL OUTER JOIN customers c ON l.customer_id = c.customer_id;

--
-- "loan_id","customer_id","loan_amount","interest_rate","terms_of_repayment","customer_id (1)","first_name","last_name","phone_number"
-- 1,101,"15000.0000","0.0522",24,101,"Dane","Wade","555-1234"
-- 2,102,"15000.0000","0.0651",12,102,"Jane","Smith","555-5678"
-- 3,103,"7510.0000","0.0445",18,103,"Michael","Hoffman","555-9998"
-- 4,104,"18000.0000","0.0675",6,104,"Sarah","Ritter","555-3456"
-- 5,105,"22000.0000","0.0950",36,105,"David","Gabier","555-6410"
--
----------------------------------------------------------------------------------------------------
-- Question 2 - Implement a FULL OUTER JOIN between the employees and performance_reviews tables. -
----------------------------------------------------------------------------------------------------
--
SELECT
  *
FROM
  performance_reviews p
  FULL OUTER JOIN employees e ON p.employee_id = e.employee_id;

--
-- "performance_review_id","employee_id","review_date","final_rating","final_comments","employee_id (1)","first_name","last_name","email","department_id","salary"
-- 1,102,"2022-01-15",4,"Good performance during the year, Can be Improved.",102,"Jane","Smith","jane.smith@dataceps.com",2,"6200.00"
-- 2,101,"2022-02-28",3,"meets expectations.",101,"Dane","Wade","danewade@dataceps.com",1,"7666.00"
-- 3,103,"2022-03-10",5,"Superb performance, exceeding expectations.",103,"Michael","Hoffman","michael.hoffman@dataceps.com",1,"6500.00"
-- 4,105,"2022-04-05",2,"Needs to be organized and improvement required in communication skills.",105,"Sarah","Brown","sarah.brown@dataceps.com",2,"5821.00"
-- 5,104,"2022-05-20",4,"Good Overall Work! Demonstrates strong teamwork skills.",104,"Emily","Ritter","emily.ritter@dataceps.com",3,"5100.00"
--
--------------------------------------------------------------------------------------------
-- Question 3 - Implement a FULL OUTER JOIN between the advertisers and campaigns tables. -
--------------------------------------------------------------------------------------------
--
SELECT
  *
FROM
  advertisers a
  FULL OUTER JOIN campaigns c ON a.advertiser_id = c.advertiser_id;

--
-- "advertiser_id","advertiser_name","email_id","phone","campaign_id","campaign_name","begin_date","end_date","total_budget","advertiser_id (1)"
-- 1,"DigiXMedia","ads@digixmedia.com","7894123166",2,"Holiday Special Final Offer","2022-12-01","2022-12-31","8020.0000",1
-- 1,"DigiXMedia","ads@digixmedia.com","7894123166",1,"Summer Clearance Sale","2022-06-01","2022-06-30","5430.0000",1
-- 2,"TRX Ventures","ads@trxventures.com","9864890453",4,"Year-End Stock Clearance","2022-12-15","2023-01-15","10050.0000",2
-- 2,"TRX Ventures","ads@trxventures.com","9864890453",3,"Product Launch Sale","2022-09-01","2022-09-30","3300.0000",2
-- 3,"HiROI Ads Agency","ads@hiroiads.com","9811537891",5,"Spring Collection","2022-03-01","2022-04-30","6450.0000",3
-- 4,"Dataceps Digital Solutions","ads@dcdsoltion.com","5516542310",6,"Back-to-College Sale","2022-08-01","2022-08-31","4067.0000",4
--
