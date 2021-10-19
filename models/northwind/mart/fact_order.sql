{{ config(materialized='table') }}

with 
    customers as (
        Select *
        from {{ ref('dim_customers') }}
),
    products as (
        Select *
        from {{ ref('dim_products') }}
),
    shippers as (
        Select *
        from {{ ref('dim_shippers') }}
),
    order_with_sk as (
        Select
        order_id
        , shippers.shipper_sk  as shipper_fk
        , customers.customer_sk as customer_fk
        , o.order_date
        , o.ship_region
        , o.shipped_date
        , o.ship_country
        , o.ship_address
        , o.ship_postal_code
        , o.ship_city
        , o.ship_name
        , o.freight
        , o.required_date
        from {{ref('stg_orders')}} as o
        left join customers on o.customer_id = customers.customer_id
        left join shippers on o.shipper_id = shippers.shipper_id
),
    order_detail_with_sk as (
        Select 
        order_id	
        , p.product_sk as product_fk	
        , od.discount	
        , od.unit_price	
        , od.quantity	
        from {{ref('stg_order_details')}} as od
        left join products p on od.product_id = p.product_id
),
    final as (
        Select
        o.order_id
        , o.shipper_fk
        , o.custom_fk
        , od.product_fk
        , o.order_date
        , o.ship_region
        , o.shipped_date
        , o.ship_country
        , o.ship_address
        , o.ship_postal_code
        , o.ship_city
        , o.ship_name
        , o.freight
        , o.required_date
        , od.discount	
        , od.unit_price	
        , od.quantity
        from order_with_sk as o
        left join order_detail_with_sk od on o.order_id=od.order_id
        order by order_id
    )
Select * from final