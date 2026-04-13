with source as (
    select * from {{ source('pagila', 'film') }}
),
final as (
    select
        film_id,
        title as film_title,
        description as film_description,
        release_year,
        language_id,
        original_language_id,
        rental_duration,
        rental_rate,
        length as film_length_minutes,
        replacement_cost,
        rating as mpaa_rating,
        special_features,
        last_update as updated_at
    from source
)
select * from final