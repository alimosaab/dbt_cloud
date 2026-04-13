with staff as (
    select
        *
    from {{ ref('stg_pagila__staff') }}
),
geography as (
    select
        *
    from {{ ref('int_geographic_location_joined') }}
),
final as (
    select
        s.staff_id,
        s.staff_first_name,
        s.staff_last_name,
        s.staff_email,
        s.store_id,
        s.is_active,
        s.username,
        g.city_name,
        g.country_name
    from staff s
    left join geography g 
        on s.address_id = g.address_id
)
select * from final