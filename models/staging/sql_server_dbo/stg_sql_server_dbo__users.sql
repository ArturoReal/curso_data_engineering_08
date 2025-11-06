/* 
USERS STG SELECT
*/
{{
  config(
    materialized='view'
  )
}}

WITH src_users as (
SELECT *
FROM {{source('sql_server_dbo','users')}}
) SELECT * FROM src_users