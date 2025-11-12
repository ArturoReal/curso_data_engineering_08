/* 
STATE STG SELECT
*/
{{
  config(
    materialized='view'
  )
}}

WITH src_addresses as (
SELECT *
FROM {{source('sql_server_dbo','addresses')}}
), 

addresses_tr as (

SELECT DISTINCT
     md5(state) as state_id,
     state as state_name,
     md5(country) as country_id
FROM src_addresses


) SELECT * FROM addresses_tr