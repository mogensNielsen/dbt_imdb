with

imdb_movies as (
    select *
    from {{ ref('imdb_movies') }}
)

select
    title,
    year,
    genre,
    duration,
    sysdate() as dbt_last_loaded_datetime
from imdb_movies
