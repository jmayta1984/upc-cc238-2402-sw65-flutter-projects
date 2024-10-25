class FavoriteModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String image;

  FavoriteModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
  });

  factory FavoriteModel.fromMap(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      status: json['status'] ?? '',
      species: json['species'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'image': image,
    };
  }

  
}