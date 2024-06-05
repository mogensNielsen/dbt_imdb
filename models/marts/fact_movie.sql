with

imdb_movies as (
    select *
    from {{ ref('imdb_movies') }}
),

dim_movie_year as (
    select *
    from {{ ref('dim_movie_year') }}
),

remove_null_duration as (
    select *
    from imdb_movies
    where duration is not null
),

add_fks as (
    select
        remove_null_duration.*,
        dim_movie_year.pk_dim_movie_year as fk_dim_movie_year
    from remove_null_duration
    left outer join dim_movie_year
        on remove_null_duration.year = dim_movie_year.year
)

select
    title,
    year,
    genre,
    duration,
    fk_dim_movie_year,
    sysdate() as dbt_last_loaded_datetime
from add_fks
