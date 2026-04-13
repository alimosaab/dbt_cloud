with addresses as (
    select
        *
    from {{ ref('stg_pagila__address') }}
),
cities as (
    select
        *
    from {{ ref('stg_pagila__city') }}
),
countries as (
    select
        *
    from {{ ref('stg_pagila__country') }}
),
final as (
    select
        a.address_id,
        a.address_line_1,
        a.district,
        a.postal_code,
        a.phone,
        ci.city_name,
        co.country_name
    from addresses a
    join cities ci 
        on a.city_id = ci.city_id
    join countries co 
        on ci.country_id = co.country_id
)
select * from final