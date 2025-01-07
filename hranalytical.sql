create database hranalytics;
use hranalytics;
CREATE TABLE Department (
    department_id INT PRIMARY KEY ,
    department_name VARCHAR(100) NOT NULL
);
INSERT INTO Department ( department_id, department_name) 
VALUES (1,'Sales'), (2,'Engineering'), (3,'HR'), (4,'Finance'), (5,'Marketing');
select * from  Department;

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY ,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    gender VARCHAR(10),
    birth_date DATE,
    hire_date DATE,
    department_id INT,
    job_role VARCHAR(100),
    status ENUM('Active', 'Resigned', 'Terminated', 'On Leave') DEFAULT 'Active',
    salary DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);
INSERT INTO Employee  ( employee_id, first_name, last_name, gender, birth_date, hire_date, department_id, job_role, salary) 
VALUES 
(101, 'John', 'Doe', 'Male', '1990-01-15', '2015-03-12', 1, 'Sales Executive', 55000),
(102, 'Jane', 'Smith', 'Female', '1992-05-20', '2017-07-01', 5, 'Marketing Manager', 62000),
(103, 'Michael', 'Johnson', 'Male', '1978-11-05', '2007-02-15', 2, 'Software Engineer', 75000),
(104, 'Linda', 'Lee', 'Female', '1985-03-25', '2012-09-30', 3, 'HR Manager', 68000),
(105, 'James', 'White', 'Male', '1995-07-18', '2020-01-10', 1, 'Sales Executive', 50000),
(106, 'Robert', 'Brown', 'Male', '1973-02-02', '2001-04-18', 1, 'Sales Executive', 90000),
(107, 'Jennifer', 'Clark', 'Female', '1991-08-11', '2016-11-05', 2, 'Software Engineer', 65000),
(108, 'William', 'Miller', 'Male', '1987-12-30', '2016-01-21', 3, 'HR Manager', 58000),
(109, 'Elizabeth', 'williams', 'Female', '1983-02-16', '2010-07-25', 5, 'Marketing Manager', 75000),
(110, 'David', 'Wilson', 'Male', '1990-03-12', '2016-09-19', 1, 'Sales Executive', 55000),
(111, 'Emily', 'Davis', 'Female', '1994-06-08', '2017-05-15', 4, 'Financial Analyst', 72000),
(112, 'Christopher', 'García', 'Male', '1982-10-30', '2008-03-09', 2, 'Software Engineer', 78000),
(113, 'Daniel', 'Lopez', 'Male', '1984-12-25', '2011-11-15', 3, 'HR Manager', 70000),
(114, 'Megan', 'Walker', 'Female', '1987-05-03', '2013-02-18', 1, 'Sales Executive', 88000),
(115, 'Amy', 'Young', 'Female', '1994-08-19', '2018-04-22', 4, 'Financial Analyst', 68000);
select * from  Employee;

CREATE TABLE Performance (
    performance_id INT PRIMARY KEY ,
    employee_id INT,
    review_date DATE,
    performance_score INT CHECK(performance_score BETWEEN 1 AND 5),
    review_comments TEXT(10000),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
INSERT INTO Performance ( performance_id, employee_id, review_date, performance_score, review_comments)
VALUES 
(1, 101, '2024-10-14', 4, 'Exceeded sales targets, strong Conviencing skills'),
(2, 102, '2024-10-18', 4, 'Excellent Marketing skills, but needs to improve collaboration'),
(3, 103, '2024-10-15', 4, 'Solid Performance, through needs to focus on time mangement'),
(4, 104,  '2024-10-16', 4, 'Consistently maintains a positive work environment and supports employee development'),
(5, 105, '2024-10-14', 3, 'Met expectations but lacks proactivity'),
(6, 106, '2024-10-14', 5, 'A Top performer in Sales Department, Great initiative and consistently meets high standards'),
(7, 107, '2024-10-15', 3, 'Strugles with adapting new technologies, needs further training'),
(8, 108,  '2024-10-16', 3, 'shows good efforts but needs to resolving complex employee relations issuses more efficiently'),
(9, 109, '2024-10-18', 5, 'A Top performer in Marketing Department, strong ability to adapt to changing market trends and drive innovative marketing solution that resonate with target audiences'),
(10, 110, '2024-10-14', 4, 'Exceeded sales targets, strong leadership skills'),
(11, 111, '2024-10-17', 5, 'A Top performer in Finance Department, Exceptional financial Strategy, Leading to improved profitability and xaost management'),
(12, 112,  '2024-10-15', 5, 'A Top performer in Engineering Department, very reliable and handle complex task as well'),
(13, 113, '2024-10-16', 5, 'A Top performer in Hr Department, Outstanding work in Talent Acquisition and employee engagement initiatives'),
(14, 114, '2024-10-14', 4, 'Excellent performance, consistent results, and strong team player'),
(15, 115, '2024-10-17', 4, 'strong at optimizing investment strategies, could improve in cross-departmental financial training');
select * from  Performance ;

CREATE TABLE Training (
    training_id INT PRIMARY KEY ,
    employee_id INT,
    training_name VARCHAR(100),
    training_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
INSERT INTO Training (training_id, employee_id, training_name, training_date)
VALUES 
(1, 101, 'Advanced sales techniques for success', '2024-08-05'),
(2, 102, 'SEO Strategies', '2024-08-09'),
(3, 103, 'Advanced Python Programming', '2024-08-06'),
(4, 104, 'Leadership Training', '2024-08-07'),
(5, 105, 'Advanced sales techniques for success', '2024-08-05'),
(6, 106, 'Advanced sales techniques for success', '2024-08-05'),
(7, 107, 'Advanced Python Programming', '2024-08-06'),
(8, 108, 'Leadership Training', '2024-08-07'),
(9, 109, 'SEO Strategies', '2024-08-09'),
(10, 110, 'Advanced sales techniques for success', '2024-08-05'),
(11, 111, 'Financial Modeling', '2024-08-08'),
(12, 112,'Advanced Python Programming', '2024-08-06'),
(13, 113, 'Leadership Training', '2024-08-07'),
(14, 114, 'Advanced sales techniques for success', '2024-08-05'),
(15, 115, 'Financial Modeling', '2024-08-08');
select * from  Training ;

CREATE TABLE EmployeeEngagement (
    engagement_id INT PRIMARY KEY ,
    employee_id INT,
    engagement_score INT CHECK(engagement_score BETWEEN 1 AND 10),
    survey_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
INSERT INTO EmployeeEngagement (engagement_id, employee_id, engagement_score, survey_date)
VALUES 
(1, 101, 7, '2024-09-02'),
(2, 102, 7, '2024-09-06'),
(3, 103, 8, '2024-09-03'),
(4, 104, 7, '2024-09-04'),
(5, 105, 6, '2024-09-02'),
(6, 106, 9, '2024-09-02'),
(7, 107, 7, '2024-09-03'),
(8, 108, 6, '2024-09-04'),
(9, 109, 8, '2024-09-06'),
(10, 110, 7, '2024-09-02'),
(11, 111, 8, '2024-09-05'),
(12, 112, 9, '2024-09-03'),
(13, 113, 8, '2024-09-04'),
(14, 114, 9, '2024-09-02'),
(15, 115, 7, '2024-09-05');
select * from EmployeeEngagement ;

CREATE TABLE SalaryChanges (
    salary_change_id INT PRIMARY KEY ,
    employee_id INT,
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    change_date DATE,
    change_reason VARCHAR(255),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
INSERT INTO SalaryChanges (salary_change_id, employee_id, old_salary, new_salary, change_date, change_reason)
VALUES 
(1, 101, 55000, 60000.00, '2024-11-01', 'Hike'),
(2, 102, 62000, 67000.00, '2024-11-01', 'Hike'),
(3, 103, 75000, 80000.00, '2024-11-01', 'Hike'),
(4, 104, 68000, 73000.00, '2024-11-01', 'Hike'),
(5, 105, 50000, 52000.00, '2024-11-01', 'Annual raise'),
(6, 106, 90000, 100000.00, '2024-11-01', 'Promotion'),
(7, 107, 65000, 67000.00, '2024-11-01', 'Annual raise'),
(8, 108, 58000, 60000.00, '2024-11-01', 'Annual raise'),
(9, 109, 75000, 85000.00, '2024-11-01', 'Promotion'),
(10, 110, 55000, 60000.00, '2024-11-01', 'Hike'),
(11, 111, 72000, 82000.00, '2024-11-01', 'Promotion'),
(12, 112, 78000, 88000.00, '2024-11-01', 'Promotion'),
(13, 113, 70000, 80000.00, '2024-11-01', 'Promotion'),
(14, 114, 88000, 93000.00, '2024-11-01', 'Hike'),
(15, 115, 68000, 73000.00, '2024-11-01', 'Hike');
select * from SalaryChanges;

CREATE TABLE EmployeeRetention (
    retention_id INT PRIMARY KEY ,
    employee_id INT,
    exit_date DATE,
    exit_reason VARCHAR(255),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
INSERT INTO EmployeeRetention ( retention_id, employee_id, exit_date, exit_reason)
VALUES 
(1, 103, '2024-12-23', 'Personal reasons'),
(2, 105, '2024-12-04', 'Performance issues'),
(3, 106, '2024-12-18', 'Health illness'),
(4, 113, '2024-12-31', 'Family commitments');
select * from EmployeeRetention;

CREATE TABLE Recruitment (
    recruitment_id INT PRIMARY KEY ,
    employee_id INT,
    hire_date DATE,
    recruitment_source VARCHAR(100),
    recruitment_status ENUM('Hired', 'Pending', 'Rejected'),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
INSERT INTO Recruitment (recruitment_id, employee_id, hire_date, recruitment_source, recruitment_status)
VALUES
(1, 101, '2015-03-12', 'Job Portal' , 'Hired'),
(2, 102, '2017-07-01', 'Social Media', 'Hired'),
(3, 103,'2007-02-15', 'Employee Referral', 'Hired'),
(4, 104, '2012-09-30', 'Recruitment Agency' , 'Hired'), 
(5, 105, '2020-01-10', 'University Career Fair', 'Hired'),
(6, 106, '2001-04-18', 'Internal Posting', 'Hired'),
(7, 107, '2016-11-05', 'Company Website', 'Hired'), 
(8, 108,  '2016-01-21', 'Networking Event', 'Hired'), 
(9, 109, '2010-07-25', 'Industry Conference', 'Hired'),
(10, 110, '2016-09-19', 'Recruitment Advertisement', 'Hired'), 
(11, 111, '2017-05-15', 'Freelance Platform', 'Hired'),
(12, 112, '2008-03-09', 'Job Portal', 'Hired'),
(13, 113,  '2011-11-15', 'Online Advertisement', 'Hired'),
(14, 114, '2013-02-18', 'Internship Program', 'Hired'),
(15, 115, '2018-04-22', 'Talent Pool', 'Hired');
 select * from Recruitment;
 
 ------------------------------------------- Queries---------------------------------------------
 -- 1. Stored Procedure: Get Employee Performance by Department
 DELIMITER $$
CREATE PROCEDURE GetEmployeePerformanceByDepartment (IN dept_name VARCHAR(100))
BEGIN
    SELECT 
        E.first_name,
        E.last_name,
        P.performance_score,
        P.review_comments
    FROM Employee E
    JOIN Performance P ON E.employee_id = P.employee_id
    JOIN Department D ON E.department_id = D.department_id
    WHERE D.department_name = dept_name;
END $$
DELIMITER ;
CALL GetEmployeePerformanceByDepartment('Sales');

-- 2.  To get details of promoted employees
CREATE VIEW PromotedEmployees AS
SELECT 
    E.employee_id, 
    E.first_name, 
    E.last_name, 
    S.old_salary, 
    S.new_salary, 
    S.change_date, 
    S.change_reason
FROM Employee E
JOIN SalaryChanges S ON E.employee_id = S.employee_id
WHERE S.change_reason = 'Promotion';
SELECT * FROM PromotedEmployees ;

-- 3. Join with Aggregation: calculate the average performance score per department.

SELECT d.department_name, AVG(p.performance_score) AS avg_performance
FROM Performance p
JOIN Employee e ON p.employee_id = e.employee_id
JOIN Department d ON e.department_id = d.department_id
GROUP BY d.department_name;

-- 4.  Window Function: Rank employees based on their salary.

SELECT employee_id, first_name, last_name, salary, 
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM Employee;


-- 5. Aggregate Query: Employee Count by Recruitment Source

SELECT recruitment_source, COUNT(*) AS employee_count
FROM Recruitment
GROUP BY recruitment_source;


-- 6. Get the total salary expense for each department

SELECT d.department_name, SUM(e.salary) AS total_salary_expense
FROM Employee e
JOIN Department d ON e.department_id = d.department_id
GROUP BY d.department_name;
