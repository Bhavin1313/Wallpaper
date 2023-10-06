class ApiModel {
  String pageURL;
  String largeImageURL;
  var downloads;
  var likes;
  String user;

  ApiModel({
    required this.pageURL,
    required this.largeImageURL,
    required this.downloads,
    required this.likes,
    required this.user,
  });

  factory ApiModel.formJSON({required Map data}) {
    return ApiModel(
      pageURL: data['pageURL'],
      largeImageURL: data['largeImageURL'],
      downloads: data['downloads'],
      likes: data['likes'],
      user: data['user'],
    );
  }
}
