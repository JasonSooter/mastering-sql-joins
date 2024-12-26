CREATE TABLE loans(
  loan_id smallint,
  customer_id smallint,
  loan_amount numeric(9, 4) DEFAULT NULL,
  interest_rate numeric(5, 4) DEFAULT NULL,
  terms_of_repayment smallint
);

INSERT INTO loans(loan_id, customer_id, loan_amount, interest_rate, terms_of_repayment)
  VALUES (1, 101, 15000.0000, 0.0522, 24),
(2, 102, 15000.0000, 0.0651, 12),
(3, 103, 7510.0000, 0.0445, 18),
(4, 104, 18000.0000, 0.0675, 6),
(5, 105, 22000.0000, 0.0950, 36);

CREATE TABLE customers(
  customer_id smallint,
  first_name character varying(50) DEFAULT NULL,
  last_name character varying(50) DEFAULT NULL,
  phone_number character varying(15) DEFAULT NULL
);

INSERT INTO customers(customer_id, first_name, last_name, phone_number)
  VALUES (101, 'Dane', 'Wade', '555-1234'),
(102, 'Jane', 'Smith', '555-5678'),
(103, 'Michael', 'Hoffman', '555-9998'),
(104, 'Sarah', 'Ritter', '555-3456'),
(105, 'David', 'Gabier', '555-6410');

CREATE TABLE performance_reviews(
  performance_review_id smallint,
  employee_id smallint,
  review_date character varying(10) DEFAULT NULL,
  final_rating smallint,
  final_comments character varying(72) DEFAULT NULL
);

INSERT INTO performance_reviews(performance_review_id, employee_id, review_date, final_rating, final_comments)
  VALUES (1, 102, '2022-01-15', 4, 'Good performance during the year, Can be Improved.'),
(2, 101, '2022-02-28', 3, 'meets expectations.'),
(3, 103, '2022-03-10', 5, 'Superb performance, exceeding expectations.'),
(4, 105, '2022-04-05', 2, 'Needs to be organized and improvement required in communication skills.'),
(5, 104, '2022-05-20', 4, 'Good Overall Work! Demonstrates strong teamwork skills.');

CREATE TABLE employees(
  employee_id smallint,
  first_name character varying(50) DEFAULT NULL,
  last_name character varying(50) DEFAULT NULL,
  email character varying(50) DEFAULT NULL,
  department_id smallint,
  salary numeric(10, 2)
);

INSERT INTO employees(employee_id, first_name, last_name, email, department_id, salary)
  VALUES (101, 'Dane', 'Wade', 'danewade@dataceps.com', 1, 7666),
(102, 'Jane', 'Smith', 'jane.smith@dataceps.com', 2, 6200),
(103, 'Michael', 'Hoffman', 'michael.hoffman@dataceps.com', 1, 6500),
(104, 'Emily', 'Ritter', 'emily.ritter@dataceps.com', 3, 5100),
(105, 'Sarah', 'Brown', 'sarah.brown@dataceps.com', 2, 5821);

CREATE TABLE advertisers(
  advertiser_id smallint,
  advertiser_name character varying(26) DEFAULT NULL,
  email_id character varying(19) DEFAULT NULL,
  phone bigint
);

INSERT INTO advertisers(advertiser_id, advertiser_name, email_id, phone)
  VALUES (1, 'DigiXMedia', 'ads@digixmedia.com', 7894123166),
(2, 'TRX Ventures', 'ads@trxventures.com', 9864890453),
(3, 'HiROI Ads Agency', 'ads@hiroiads.com', 9811537891),
(4, 'Dataceps Digital Solutions', 'ads@dcdsoltion.com', 5516542310);

CREATE TABLE campaigns(
  campaign_id smallint,
  campaign_name character varying(27) DEFAULT NULL,
  begin_date character varying(10) DEFAULT NULL,
  end_date character varying(10) DEFAULT NULL,
  total_budget numeric(9, 4) DEFAULT NULL,
  advertiser_id smallint
);

INSERT INTO campaigns(campaign_id, campaign_name, begin_date, end_date, total_budget, advertiser_id)
  VALUES (1, 'Summer Clearance Sale', '2022-06-01', '2022-06-30', 5430.0000, 1),
(2, 'Holiday Special Final Offer', '2022-12-01', '2022-12-31', 8020.0000, 1),
(3, 'Product Launch Sale', '2022-09-01', '2022-09-30', 3300.0000, 2),
(4, 'Year-End Stock Clearance', '2022-12-15', '2023-01-15', 10050.0000, 2),
(5, 'Spring Collection', '2022-03-01', '2022-04-30', 6450.0000, 3),
(6, 'Back-to-College Sale', '2022-08-01', '2022-08-31', 4067.0000, 4);

CREATE TABLE students(
  student_id smallint,
  student_name character varying(5) DEFAULT NULL
);

INSERT INTO students(student_id, student_name)
  VALUES (1, 'Liz'),
(2, 'Dane'),
(3, 'Sara');

CREATE TABLE food_choices(
  food_id varchar(2) DEFAULT NULL,
  food_name varchar(12) DEFAULT NULL,
  student_id smallint DEFAULT NULL
);

INSERT INTO food_choices(food_id, food_name, student_id)
  VALUES ('F1', 'Burger', 2),
('F2', 'Pizza', 1),
('F3', 'Noodles', 1),
('F4', 'Beans & Rice', 2),
('F5', 'Pasta', NULL);

