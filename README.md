# Where2WatchApp

## specification

### Versions
- Flutter: 2.10.5
- Dart: 2.16.2

### Functionalities
  - View popular movies
  - View top rated movies
  - View movie details(title, description, poster, length, rate, actors, where to watch)
  - Search for movies
  - View where to watch movies
  - Save movies to favorites
  - View movie trailer

### API
  - themoviedb.org api : https://www.themoviedb.org/
  - nothing to configure, everything is in the code, using my apikey

### Screens
- Home
  - List of populars movies
    - on tap open view with the movie details
  - List of top rated movies
    - on tap open view with the movie details
  - List of favorite movies
    - on tap open view with the movie details
  - Search Input to search movies
    - on tap open view with the search results

- Search
  - List of movies from the query
    - on tap open view with the movie details

- Movie details
  - Movie title
  - Movie description
  - Movie poster
  - Movie length
  - Movie rate
  - Movie actors
  - Movie trailer
  - Movie where to watch
  - Add movie to favorite >>>> shared preferences