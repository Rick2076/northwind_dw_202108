---{{ config(materialized-'table') }}

WITH
    staging as (
    SELECT *
    FROM {{ ref('stg_customers') }}
    )

    ,transformed as (
    SELECT 
        row_number() over(order by customer_id) as customer_sk
        , country
        , city
        , fax
        , postal_code
        , address
        , region
        , customer_id
        , contact_name
        , phone
        , company_name
        , contact_title
    FROM staging
)

SELECT* From transformed