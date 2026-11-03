#----SQL practice – joins, unions and string functions

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
FROM parks_departments;


#---Q1. INNER JOIN

# Display the first name, last name, salary and occupation of employees who exist in both employee_demographics and employee_salary.

SELECT d.first_name,d.last_name,s.salary,s.occupation
FROM employee_demographics d
INNER JOIN employee_salary s
	ON d.employee_id = s.employee_id;

#-----Q2. LEFT JOIN

# Display all employees from employee_demographics along with their salary.Include employees even if their salary record doesn't exist.

SELECT d.employee_id,d.first_name,s.salary
FROM employee_demographics d
LEFT JOIN employee_salary s
	ON d.employee_id = s.employee_id;
    
    
#----Q3. UNION

# Display the first names from both employee tables in one column, without duplicate names.    

SELECT first_name
FROM employee_demographics 
UNION
SELECT first_name
FROM employee_salary
ORDER BY first_name ASC; 

#----Q4. CONCAT

# Display employees' full names in one column using CONCAT().

SELECT CONCAT(first_name,' ',last_name) AS Full_Name
FROM employee_demographics
LIMIT 5;

#--Q5. UPPER and LOWER

# Display first names in uppercase and last names in lowercase.

SELECT UPPER(first_name) AS First_Name, LOWER(last_name)
FROM employee_demographics
LIMIT 5;


#--Q6. LENGTH

# Display employees whose first names contain more than 4 characters.

SELECT first_name ,LENGTH(first_name) AS name_length
FROM employee_demographics
WHERE LENGTH(first_name) > 4;


#---Level 2 – Medium questions-----------

#---Q7. JOIN + WHERE (Scenario: HR department)
# The HR manager wants to find all female employees earning more than ₹50,000.

SELECT d.first_name, d.last_name,d.gender, s.salary
FROM employee_demographics d
LEFT JOIN employee_salary s
	ON d.employee_id = s.employee_id
WHERE gender = 'Female' AND salary > 50000;


#--Q8. Multiple JOINs (Scenario: Department report)

#The company wants an employee department report.
#Display employee name, occupation and department name. Include employees who don't have an assigned department

SELECT d.first_name, d.occupation, s.department_name
FROM employee_salary d
LEFT JOIN parks_departments s
	ON d.dept_id = s.department_id;


#----9. UNION ALL (Scenario: Employee records)

#Combine first names from both employee tables using UNION ALL.
#Display all records, including duplicate names.

SELECT first_name
FROM employee_demographics
UNION ALL
SELECT first_name
FROM employee_salary;

#----Q10. CONCAT + UPPER (Scenario: Employee ID cards)

#Generate employee display names in uppercase.
#Format: FIRSTNAME LASTNAME

SELECT 
    UPPER(CONCAT(first_name, ' ', last_name)) AS employee_name
FROM employee_demographics
LIMIT 5;

#---Q11. SUBSTRING (Scenario: Name analysis)
# Display the first three characters of every employee's first name.

SELECT first_name, SUBSTRING(first_name, 1, 3) AS Short_name
FROM employee_demographics;


#---Q12. REPLACE (Scenario: Job title correction)

#The company wants to replace the word Parks with City in employee occupation titles.
#Display the original occupation and modified occupation.

SELECT occupation,
	REPLACE(occupation,'Parks','City') AS Modified_Occupation
FROM employee_salary;

