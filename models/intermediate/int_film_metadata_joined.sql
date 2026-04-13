with films as (
    select
        *
    from {{ ref('stg_pagila__films') }}
),
languages as (
    select
        *
    from {{ ref('stg_pagila__language') }}
),
film_categories as (
    select
        *
    from {{ ref('stg_pagila__film_category') }}
),
categories as (
    select
        *
    from {{ ref('stg_pagila__category') }}
),
final as (
    select
        f.film_id,
        f.film_title,
        f.release_year,
        f.mpaa_rating,
        f.rental_rate,
        f.replacement_cost,
        l.language_name,
        c.category_name
    from films f
    left join languages l 
        on f.language_id = l.language_id
    left join film_categories fc 
        on f.film_id = fc.film_id
    left join categories c 
        on fc.category_id = c.category_id
)
select * from final