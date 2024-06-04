with

imdb_movie_dataset as (
    select *
    from {{ ref('imdb_movies_dataset') }}
),

renamed as (
    select
        "Poster" as poster_url,
        "Title" as title,
        "Year" as year,
        "Certificate" as certificate,
        "Duration (min)" as duration,
        "Genre" as genre,
        "Rating" as rating,
        "Metascore" as metascore,
        "Director" as director,
        "Cast" as cast,
        "Votes" as votes,
        "Description" as description,
        "Review Count" as review_count,
        "Review Title" as review_title,
        "Review" as review,
        sysdate() as dbt_last_loaded_datetime
    from imdb_movie_dataset
),

final as (
    select *
    from renamed
)

select *
from final
