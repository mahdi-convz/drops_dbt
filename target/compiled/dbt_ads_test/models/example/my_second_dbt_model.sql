-- Use the `ref` function to select from other models

select *
from `drops-bi`.`marketing_full_v2`.`my_first_dbt_model`
where id = 1