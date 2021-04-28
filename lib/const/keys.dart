class Constants {
  static const APIKEY = "a6af4a77320a4607be3a84a0df32bf18";
  static const TOPHEADLINES =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$APIKEY";

  static String headliensFor(String country) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$APIKEY';
  }

  static const Map<String, String> Countries = {
    'USA': 'us',
    'India': 'in',
    'Korea': 'kr',
    'China': 'cn',
  };
}
