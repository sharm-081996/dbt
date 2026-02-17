

select 
   emp_id,
   emp_name,
   experience,
   load_time

from {{
    source('dbt_test','employee')
}}


