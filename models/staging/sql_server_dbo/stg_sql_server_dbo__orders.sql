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
    case when shipping_service = '' then md5('unknown')
    else md5(shipping_service) end as shipping_service_id,
    shipping_cost as shipping_cost_usd,
    trim(address_id) as address_id,
    CONVERT_TIMEZONE('UTC', created_at) as created_at_utc,
    case when promo_id = '' then md5('no_promo')
    else md5(promo_id) end as promo_id,
    CONVERT_TIMEZONE('UTC', estimated_delivery_at) as estimated_delivery_at_utc,
    order_cost as order_cost_usd,
    trim(user_id) as user_id,
    order_total as order_total_usd,
    CONVERT_TIMEZONE('UTC', delivered_at) as delivered_at_utc,
    nullif(trim(tracking_id), '') as tracking_id,
    status,
    _fivetran_deleted,
    CONVERT_TIMEZONE('UTC',_fivetran_synced) as date_utc

FROM src_orders

) SELECT * FROM orders_tr