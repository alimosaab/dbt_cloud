with customers as (
    select
        *
    from {{ ref('stg_pagila__customers') }}
),
payments as (
    select
        *
    from {{ ref('stg_pagila__payments') }}
),
final as (
    select
        c.customer_id,
        min(p.paid_at) as first_payment_at,
        max(p.paid_at) as last_payment_at,
        count(p.payment_id) as total_payments_count,
        sum(p.amount) as total_amount_spent
    from customers c
    left join payments p 
        on c.customer_id = p.customer_id
    group by 
        1
)
select * from final