{{
    config(materialized ='table')
}}

select emp_id,
emp_name,
experience
from {{ref('employee_inter')}}