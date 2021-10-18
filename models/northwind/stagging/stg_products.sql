WITH 
    sources as (
    SELECT 
        product_id	---PrimaryKey	

        , category_id  ---Foreign Key
        , supplier_id ---Foreign Key			
        
        , product_name	
        , unit_price
        , units_in_stock	
        , units_on_order			
        , quantity_per_unit
        , reorder_level 	
        , case when
            when discontinued = 1 then True
            else False
            end as is_discotinued
            
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    from {{ source('northwind_erp','products') }}
    )

SELECT * from sources