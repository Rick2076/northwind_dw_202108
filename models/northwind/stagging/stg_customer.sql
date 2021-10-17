WITH
    source as (
    SELECT country,
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
    FROM {{ source('northwind_erp','customers') }}
    )

SELECT* From source