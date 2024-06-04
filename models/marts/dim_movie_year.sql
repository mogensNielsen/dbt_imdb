with

imdb_movies as (
    select *
    from {{ ref('imdb_movies') }}
),

distinct_years as (
    select distinct year
    from imdb_movies
),

final as (
    select *
    from distinct_years
)

select *
from final
