/* 
BUDGET STG SELECT
*/
{{
  config(
    materialized='view'
  )
}}

WITH src_budget as (
SELECT *
FROM {{source('google_sheets','budget')}}
) 
 SELECT 
    product_id,
    cast(month as DATE) as date_utc,
    quantity,
    null as _fivetran_deleted, 
    _fivetran_synced
 FROM src_budget