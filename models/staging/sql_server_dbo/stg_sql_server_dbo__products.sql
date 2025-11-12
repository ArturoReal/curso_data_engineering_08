/* 
PRODUCTS STG SELECT
*/
{{
  config(
    materialized='view'
  )
}}

WITH src_products as (
SELECT 
    trim(product_id) as product_id,
    price as price_usd,
    trim(name) as name,
    inventory,
    _fivetran_deleted,
    convert_timezone('UTC',_fivetran_synced) as date_utc
FROM {{source('sql_server_dbo','products')}}
) SELECT * FROM src_products