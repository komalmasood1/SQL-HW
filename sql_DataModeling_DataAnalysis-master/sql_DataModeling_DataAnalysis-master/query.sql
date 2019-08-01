--List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no as employee_number,last_name,first_name,gender,salary
from employees e
join salaries s
on e.emp_no = s.emp_no;

--List employees who were hired in 1986.
select emp_no as employee_number, last_name,first_name, hire_date
from employees
where date_trunc('year',hire_date) = '1986-01-01';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select dept_name,dm.dept_no,e.emp_no,last_name,first_name,from_date,to_date
from dept_manager dm
join employees e
on dm.emp_no = e.emp_no
join departments d
on d.dept_no = dm.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no,last_name,first_name,dept_name
from dept_emp de
join employees e
on de.emp_no = e.emp_no
join departments d
on d.dept_no = de.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
select last_name,first_name
from employees
where 
last_name like 'B%' 
and first_name = 'Hercules';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, last_name,first_name,dept_name
from (select * from departments where dept_name = 'Sales') as d
join dept_emp de
on d.dept_no = de.dept_no
join employees e
on de.emp_no = e.emp_no;

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, last_name,first_name,dept_name
from (select * from departments where dept_name in ('Development','Sales')) as d
join dept_emp de
on d.dept_no = de.dept_no
join employees e
on de.emp_no = e.emp_no;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select distinct last_name,count(last_name)
from employees
group by last_name
order by 2 desc;


