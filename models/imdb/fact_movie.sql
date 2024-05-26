with

imdb_movies as (
    select *
    from {{ ref('imdb_movies') }}
)

select
    title,
    year,
    genre,
    duration
from imdb_movies
