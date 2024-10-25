class FavoriteNewsModel {
  final String title;
  final String image;
  final String author;

  FavoriteNewsModel({
    required this.title,
    required this.image,
    required this.author,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'author': author,
    };
  }

  factory FavoriteNewsModel.fromMap(Map<String, dynamic> map) {
    return FavoriteNewsModel(
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      author: map['author'] ?? '',
    );
  }
}
