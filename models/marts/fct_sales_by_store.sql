with payments as (
    select
        *
    from {{ ref('stg_pagila__payments') }}
),
staff as (
    select
        *
    from {{ ref('stg_pagila__staff') }}
),
final as (
    select
        p.payment_id,
        p.paid_at,
        p.amount,
        s.store_id,
        s.staff_id
    from payments p
    join staff s 
        on p.staff_id = s.staff_id
)
select * from final