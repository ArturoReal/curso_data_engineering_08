/* 
STATUS STG SELECT
*/
{{
  config(
    materialized='view'
  )
}}

WITH src_orders as (
SELECT *
FROM {{source('sql_server_dbo','orders')}}
), 

orders_tr as (

SELECT DISTINCT
    md5(status) as status_id,
    status

FROM src_orders

) SELECT * FROM orders_tr