with source as (
    select * from {{ source('pagila', 'address') }}
),
final as (
    select
        address_id,
        address as address_line_1,
        address2 as address_line_2,
        district,
        city_id,
        postal_code,
        phone,
        last_update as updated_at
    from source
)
select * from final