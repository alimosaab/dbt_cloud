with source as (
    select * from {{ source('pagila', 'city') }}
),
final as (
    select
        city_id,
        city as city_name,
        country_id,
        last_update as updated_at
    from source
)
select * from final