/* 
ORDERS STG SELECT
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

SELECT 
    trim(order_id) as order_id,
    shipping_service,
    shipping_cost as shipping_cost_usd,
    trim(address_id) as address_id,
    created_at as created_at_utc,
    md5(coalesce(lower(trim(promo_id)), 'no_promo')) as promo_id,
    estimated_delivery_at as estimated_delivery_at_utc,
    order_cost as order_cost_usd,
    trim(user_id) as user_id,
    order_total as order_total_usd,
    delivered_at as delivered_at_utc,
    nullif(trim(tracking_id), '') as tracking_id,
    status,
    _fivetran_deleted,
    _fivetran_synced

FROM src_orders

) SELECT * FROM orders_tr