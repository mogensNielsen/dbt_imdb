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
    where year is not null
)

select
    *,
    sysdate() as dbt_last_loaded_datetime
from final
