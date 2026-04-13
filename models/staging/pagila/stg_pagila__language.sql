with source as (
    select 
        * from {{ source('pagila', 'language') }}
),
final as (
    select
        language_id,
        name as language_name,
        last_update as updated_at
    from source
)
select * from final