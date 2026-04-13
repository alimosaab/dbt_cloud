with rentals as (
    select
        *
    from {{ ref('stg_pagila__rentals') }}
),
inventory as (
    select
        *
    from {{ ref('stg_pagila__inventory') }}
),
final as (
    select
        i.film_id,
        count(r.rental_id) as total_rental_count,
        count(distinct r.customer_id) as unique_customer_count,
        avg(extract(day from (r.return_date - r.rental_date))) as avg_rental_duration_days
    from rentals r
    join inventory i 
        on r.inventory_id = i.inventory_id
    group by 
        1
)
select * from final