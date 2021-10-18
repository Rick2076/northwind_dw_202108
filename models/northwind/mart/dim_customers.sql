{{ config(materialized='table') }}

WITH
    selected as (
    SELECT 
        customer_id
        , contact_name
        , contact_title
        , country
        , city
        , postal_code
        , address
        , region
        , phone
        , company_name
        , fax
    FROM {{ ref('stg_customers') }}
)
, transformed as (
    SELECT
        row_number() over (order by customer_id) as customer_sk
        ,*
    from selected
)

SELECT* From transformed