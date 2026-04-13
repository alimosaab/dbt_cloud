with source as (
    select * from {{ source('pagila', 'staff') }}
),
final as (
    select
        staff_id,
        first_name as staff_first_name,
        last_name as staff_last_name,
        address_id,
        email as staff_email,
        store_id,
        active as is_active,
        username,
        last_update as updated_at
    from source
)
select * from final