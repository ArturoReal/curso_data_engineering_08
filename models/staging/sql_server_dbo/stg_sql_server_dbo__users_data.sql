/* 
USER_DATA STG SELECT
*/
{{
  config(
    materialized='view'
  )
}}

WITH src_users as (
SELECT 
    user_id,
    last_name,
    first_name,
    phone_number,
    email
FROM {{source('sql_server_dbo','users')}}
) SELECT * FROM src_users