with

imdb_movies as (
    select *
    from {{ ref('imdb_movies') }}
),

distinct_years as (
    select distinct year
    from imdb_movies
),

add_pk as (
    select
        {{ dbt_utils.generate_surrogate_key(['year']) }} as pk_dim_movie_year,
        *
    from distinct_years
    where year is not null
)

select
    *,
    sysdate() as dbt_last_loaded_datetime
from add_pk
