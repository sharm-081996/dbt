{{
    config(materialized = 'table')
}}



select 
   emp_id,
   emp_name,
   experience,
   load_time

from {{
    ref("stage_emp")
}}

{%if is_incremental()%}
where load_time > (select coalesce(max(load_time),'1900-01-01 00:00:00') from {{this}})

{% endif %}