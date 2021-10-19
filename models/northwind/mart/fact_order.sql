{{ config(materialized='table') }}

with 
    customers as (
        Select
        customer_sk
        , customer_id
        from {{ ref('dim_customers') }}
),
    order_with_sk as (
        Select
        order.order_id
        , customer.customer_id
        , order.order_date
        , order.ship_region
        , order.shipped_date
        , order.ship_country
        , order.ship_address
        , order.ship_postal_code
        , order.ship_city as cidade
        , order.ship_name
        , order.freight
        , order.required_date]
        from {{ref('stg_orders')}} order
        left join customers customer on order.customer_id = customer.customer_id
    )
Select * from order_with_sk