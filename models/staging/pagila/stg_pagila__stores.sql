with source as (
    select * from {{ source('pagila', 'store') }}
),
final as (
    select
        store_id,
        manager_staff_id,
        address_id,
        last_update as updated_at
    from source
)
select * from final