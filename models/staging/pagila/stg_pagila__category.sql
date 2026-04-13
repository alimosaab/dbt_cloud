with source as (
    select * from {{ source('pagila', 'category') }}
),
final as (
    select
        category_id,
        name as category_name,
        last_update as updated_at
    from source
)
select * from final