{{
    config(
        materialized='incremental',
        unique_key='emp_id',
        pre_hook=[
            "insert into dbt.dbt_test.audit_log(model_name, run_id, start_time, end_time, user_name)
             values('stage_emp', '{{invocation_id}}', current_timestamp(), null, current_user())"
        ],

        post_hook=["
                   update dbt.dbt_test.audit_log 
                    set end_time = current_timestamp()
                    where model_name = 'stage_emp' and run_id = '{{invocation_id}}'
                    "]
    )
}}

select emp_id, emp_name, experience,load_time
from {{ source('dbt_test', 'employee') }}

