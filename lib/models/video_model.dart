class VideoModel {
  String? url;
  String? category;
  String? title;
  String? description;
  String? thumbnailUrl;

  VideoModel({
    this.url,
    this.category,
    this.title,
    this.description,
    this.thumbnailUrl,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      url: json['url'],
      title: json['title'],
      category: json['category'],
      description: json['description'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
