WITH
    source as (
    SELECT *
    FROM {{ source('northwind_erp','order') }}
    )

SELECT* From source