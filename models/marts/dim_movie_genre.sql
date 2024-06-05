with

imdb_movies as (
    select *
    from {{ ref('imdb_movies') }}
),

distinct_genres as (
    select distinct genre
    from imdb_movies
),

add_pk as (
    select
        {{ dbt_utils.generate_surrogate_key(['genre']) }} as pk_dim_movie_genre,
        *
    from distinct_genres
    where genre is not null
)

select
    *,
    sysdate() as dbt_last_loaded_datetime
from add_pk
