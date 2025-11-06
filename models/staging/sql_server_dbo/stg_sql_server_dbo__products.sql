/* 
PRODUCTS STG SELECT
*/
{{
  config(
    materialized='view'
  )
}}

WITH src_products as (
SELECT *
FROM {{source('sql_server_dbo','products')}}
) SELECT * FROM src_products