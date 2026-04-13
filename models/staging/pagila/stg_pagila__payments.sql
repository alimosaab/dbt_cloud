with source as (
    select * from {{ source('pagila', 'payment') }}
),

final as (
    select
        payment_id,
        customer_id,
        staff_id,
        rental_id,
        amount,
        payment_date as paid_at
    from source
)

select * from final