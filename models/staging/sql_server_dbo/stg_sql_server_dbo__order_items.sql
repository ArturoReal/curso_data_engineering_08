/* 
ORDER_ITEMS STG SELECT
*/
{{
  config(
    materialized='view'
  )
}}

WITH src_order_items as (
SELECT *
FROM {{source('sql_server_dbo','order_items')}}
) SELECT * FROM src_order_items