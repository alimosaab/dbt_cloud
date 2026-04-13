with films as (
    select
        *
    from {{ ref('int_film_metadata_joined') }}
),
stats as (
    select
        *
    from {{ ref('int_film_rentals_aggregated') }}
),
final as (
    select
        f.film_id,
        f.film_title,
        f.release_year,
        f.mpaa_rating,
        f.category_name,
        f.language_name,
        f.rental_rate,
        f.replacement_cost,
        s.total_rental_count,
        s.unique_customer_count,
        s.avg_rental_duration_days
    from films f
    left join stats s 
        on f.film_id = s.film_id
)
select * from final