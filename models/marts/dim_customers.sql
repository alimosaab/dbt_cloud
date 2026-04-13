with customers as (
    select
        *
    from {{ ref('stg_pagila__customers') }}
),
geography as (
    select
        *
    from {{ ref('int_geographic_location_joined') }}
),
stats as (
    select
        *
    from {{ ref('int_customer_order_history') }}
),
final as (
    select
        c.customer_id,
        c.customer_first_name,
        c.customer_last_name,
        c.customer_email,
        c.is_active,
        g.address_line_1,
        g.city_name,
        g.country_name,
        g.district,
        s.total_amount_spent as lifetime_value,
        s.total_payments_count,
        s.first_payment_at,
        s.last_payment_at
    from customers c
    left join geography g 
        on c.address_id = g.address_id
    left join stats s 
        on c.customer_id = s.customer_id
)
select * from final