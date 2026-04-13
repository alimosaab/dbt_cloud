with source as (
    select * from {{ source('pagila', 'customer') }}
),
final as (
    select
        customer_id,
        store_id,
        first_name as customer_first_name,
        last_name as customer_last_name,
        email as customer_email,
        address_id,
        activebool as is_active,
        create_date as created_on,
        last_update as updated_at
    from source
)
select * from final