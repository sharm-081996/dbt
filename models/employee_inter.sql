{{
    config(materialized ='table')
}}


select emp_id, emp_name,experience
from  TEMP.employee_src
where experience = 5 