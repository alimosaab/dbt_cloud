with source as (
    select * from {{ source('pagila', 'country') }}
),

renamed as (
    select
        country_id as country_id,
        country as nom_pays,
        last_update as derniere_maj
    from source
)

select * from renamed