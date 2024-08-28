class ApiConstants {
  /*
curl --request GET \
     --url 'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1' \
     --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZDA3ZWI0NDJlMzhmMzcwNGU4NWQ4OGUzYTg4ZTk0ZCIsIm5iZiI6MTcyNDY4MTU2Mi43MDgyNTgsInN1YiI6IjY2Y2M4NzcyYmI0Yzk2YTdjZjBkNTk5MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0hKZWf4kVTPvPMGxfwTv53QMQ8TN0f3Kuw4gtOiauPo' \
     --header 'accept: application/json'
  */
  /*
curl --request GET \
     --url 'https://api.themoviedb.org/3/search/movie?include_adult=false&language=en-US&page=1' \
     --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZDA3ZWI0NDJlMzhmMzcwNGU4NWQ4OGUzYTg4ZTk0ZCIsIm5iZiI6MTcyNDY4MTU2Mi43MDgyNTgsInN1YiI6IjY2Y2M4NzcyYmI0Yzk2YTdjZjBkNTk5MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0hKZWf4kVTPvPMGxfwTv53QMQ8TN0f3Kuw4gtOiauPo' \
     --header 'accept: application/json'
  */
  /*
curl --request GET \
     --url 'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1' \
     --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZDA3ZWI0NDJlMzhmMzcwNGU4NWQ4OGUzYTg4ZTk0ZCIsIm5iZiI6MTcyNDY4MTU2Mi43MDgyNTgsInN1YiI6IjY2Y2M4NzcyYmI0Yzk2YTdjZjBkNTk5MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0hKZWf4kVTPvPMGxfwTv53QMQ8TN0f3Kuw4gtOiauPo' \
     --header 'accept: application/json'
  */
  /*
curl --request GET \
     --url 'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1' \
     --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZDA3ZWI0NDJlMzhmMzcwNGU4NWQ4OGUzYTg4ZTk0ZCIsIm5iZiI6MTcyNDY4MTU2Mi43MDgyNTgsInN1YiI6IjY2Y2M4NzcyYmI0Yzk2YTdjZjBkNTk5MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0hKZWf4kVTPvPMGxfwTv53QMQ8TN0f3Kuw4gtOiauPo' \
     --header 'accept: application/json'
  */
  static const Map<String, String> headers = {
    'Authorization': authorization,
    'accept': 'application/json',
  };
  static const authorization =
      ' Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzODBjMjY5MGM3ZjU3NjM0NDI4MjEwZjEzMDNhNmM1NCIsIm5iZiI6MTcyNDY2NDc1Mi4wNDgzMzgsInN1YiI6IjY2Y2MzNWViNjgxZTUwNmQ3MTIwNjk5YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vGfbfXiE7UsmPMXk8JEIyix0_wjYxkQ2klpiTtW9nYw';

  static const String baseUrl = 'api.themoviedb.org';
  static const String popularEndPoint = '/3/movie/popular';
  static const String recommendedEndPoint = '/3/search/movie';
  static const String newReleasedEndPoint = '/3/movie/upcoming';
  static const String searchEndPoint = '/3/movie/top_rated';
}
