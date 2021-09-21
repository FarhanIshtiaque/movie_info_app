class TopRatedRequest {
  final String api_key;
  final String language;
  final String page;
  final String region;

  TopRatedRequest(
      {required this.api_key,
        required this.language,
        required this.page,
        required this.region});

  Map<String, dynamic> toMap() {
    return {
      "api_key": this.api_key,
      "language": this.language,
      "page": this.page,
      "region": this.region,
    };
  }
}