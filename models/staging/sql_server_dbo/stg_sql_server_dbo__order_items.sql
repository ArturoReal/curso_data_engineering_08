/* 
ORDER_ITEMS STG SELECT
*/
{{
  config(
    materialized='view'
  )
}}

WITH src_order_items as (
SELECT 
order_id,
product_id,
quantity,
_fivetran_deleted,
convert_timezone('UTC', _fivetran_synced) as date_utc
FROM {{source('sql_server_dbo','order_items')}}
) SELECT * FROM src_order_items