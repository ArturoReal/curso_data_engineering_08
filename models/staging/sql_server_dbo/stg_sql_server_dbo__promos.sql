/* 
PROMOS STG SELECT
*/
{{
  config(
    materialized='view'
  )
}}

WITH src_promo as (
SELECT *
FROM {{source('sql_server_dbo','promos')}}
), 

promo_tr as (

SELECT 
    md5(lower(trim(promo_id))) as promo_id,
    promo_id as promo_names,
    discount as discount_usd,
    status,
    _fivetran_deleted,
    CONVERT_TIMEZONE('UTC', _fivetran_synced) AS utc_time

FROM src_promo
UNION ALL 
SELECT 
    md5('no_promo') as promo_id,
    'no_promo' as promo_names,
    0.0 as discount_usd,
    'inactive' as status,
    null as _fivetran_deleted,
    CONVERT_TIMEZONE('UTC', CURRENT_DATE()) AS utc_time
    


) SELECT * FROM promo_tr