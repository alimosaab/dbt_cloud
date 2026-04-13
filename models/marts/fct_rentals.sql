{{ config(
    materialized='incremental',
    unique_key='rental_id'
) }}

with rentals as (
    select
        *
    from {{ ref('stg_pagila__rentals') }}
    {% if is_incremental() %}
    where updated_at > (select max(rental_updated_at) from {{ this }})
    {% endif %}
),
inventory as (
    select
        *
    from {{ ref('stg_pagila__inventory') }}
),
payments as (
    select
        *
    from {{ ref('stg_pagila__payments') }}
),
final as (
    select
        r.rental_id,
        r.rental_date,
        r.customer_id,
        r.staff_id,
        i.film_id,
        i.store_id,
        p.amount as rental_amount,
        p.paid_at,
        r.updated_at as rental_updated_at
    from rentals r
    join inventory i 
        on r.inventory_id = i.inventory_id
    left join payments p 
        on r.rental_id = p.rental_id
)
select * from final