with source as (
    select * from {{ source('pagila', 'film_category') }}
),
final as (
    select
        film_id,
        category_id,
        last_update as updated_at
    from source
)
select * from final