--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT E.emp_no, E.last_name, E.first_name, E.sex, S.salary
FROM [Jay_SQL_CHALLENGE].[dbo].[employees] E
LEFT OUTER JOIN [Jay_SQL_CHALLENGE].[dbo].[salaries] S
ON S.emp_no = E.emp_no
go

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT E.first_name, E.last_name, E.hire_date
FROM [Jay_SQL_CHALLENGE].[dbo].[employees] E
WHERE DatePart(yyyy, E.hire_date) = '1996'
go

-- 3. List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name.
SELECT D.dept_no, D.dept_name, DM.emp_no, E.last_name, E.first_name
FROM [Jay_SQL_CHALLENGE].[dbo].[departments] D
LEFT OUTER JOIN [Jay_SQL_CHALLENGE].[dbo].[dept_manager] DM
ON DM.dept_no = D.dept_no
LEFT OUTER JOIN [Jay_SQL_CHALLENGE].[dbo].[employees] E
ON E.emp_no = DM.emp_no

--4. List the department of each employee with the following information:
--employee number, last name, first name, and department name.
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM [Jay_SQL_CHALLENGE].[dbo].[employees] E
LEFT OUTER JOIN [Jay_SQL_CHALLENGE].[dbo].[dept_emp] DE
ON DE.emp_no = E.emp_no
LEFT OUTER JOIN [Jay_SQL_CHALLENGE].[dbo].[departments] D
ON D.dept_no = DE.dept_no

go


--5. List first name, last name, and sex for employees whose
--first name is "Hercules" and last names begin with "B."
SELECT E.first_name, E.last_name, E.sex
FROM [Jay_SQL_CHALLENGE].[dbo].[employees] E
WHERE E.first_name = 'Hercules'
  AND E.last_name LIKE 'B%'
go

--6. List all employees in the Sales department,
--including their employee number, last name, first name, and department name.
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM [Jay_SQL_CHALLENGE].[dbo].[employees] E
LEFT OUTER JOIN [Jay_SQL_CHALLENGE].[dbo].[dept_emp] DE
ON DE.emp_no = E.emp_no
LEFT OUTER JOIN [Jay_SQL_CHALLENGE].[dbo].[departments] D
ON D.dept_no = DE.dept_no
WHERE D.dept_no in('d007' -- Sales
             )
go

-- 7. List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.

SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM [Jay_SQL_CHALLENGE].[dbo].[employees] E
LEFT OUTER JOIN [Jay_SQL_CHALLENGE].[dbo].[dept_emp] DE
ON DE.emp_no = E.emp_no
LEFT OUTER JOIN [Jay_SQL_CHALLENGE].[dbo].[departments] D
ON D.dept_no = DE.dept_no
WHERE D.dept_no in('d005' --Development
                ,'d007' -- Sales
             )
go
--8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
SELECT [last_name]
      ,COUNT(*) "CNT"
FROM [Jay_SQL_CHALLENGE].[dbo].[employees]
GROUP BY [last_name]
ORDER BY [last_name]

GO