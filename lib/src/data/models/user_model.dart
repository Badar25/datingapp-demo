import '../../common/constants/seed.dart';

class UserModel {
  final String? id;
  final String name;
  final String? imageUrl;
  final String? bio;

  UserModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.bio,
  });

  factory UserModel.create({
    required String name,
     String? imageUrl,
  }) {
    return UserModel(
      id: null,
      name: name,
      imageUrl: imageUrl ?? defaultImageUrl(),
      bio: generateRandomBio(),
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json['name'],
      imageUrl: json['imageUrl'].toString().isNotEmpty? json['imageUrl'] :  defaultImageUrl(),
      bio: generateRandomBio(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if(id != null) '_id': id,
      'name': name,
      'imageUrl': imageUrl ?? defaultImageUrl(),
      'bio': bio,
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? bio,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      bio: bio ?? this.bio,
    );
  }
}
