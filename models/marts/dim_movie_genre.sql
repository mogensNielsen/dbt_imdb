with

imdb_movies as (
    select *
    from {{ ref('imdb_movies') }}
),

distinct_genres as (
    select distinct genre
    from imdb_movies
),

final as (
    select *
    from distinct_genres
)

select *
from final
