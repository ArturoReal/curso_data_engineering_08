{{ config(
    materialized='incremental',
    unique_key = '_row'
    ) 
    }}

WITH stg_budget_products AS (
    SELECT * 
    FROM {{ source('google_sheets','budget') }}
    ),

renamed_casted AS (
    SELECT
    _row,
    product_id,
    cast(month as DATE) as Month,
    quantity,
    null as _fivetran_deleted, 
    convert_timezone('UTC', _fivetran_synced) as date_utc
    FROM stg_budget_products
    )

SELECT * FROM renamed_casted

{% if is_incremental() %}

  where _fivetran_synced > (select max(_fivetran_synced) from {{ this }})

{% endif %}