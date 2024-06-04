with

imdb_movies as (
    select *
    from {{ ref('imdb_movies') }}
),

remove_null_duration as (
    select *
    from imdb_movies
    where duration is not null
)

select
    title,
    year,
    genre,
    duration,
    sysdate() as dbt_last_loaded_datetime
from remove_null_duration
