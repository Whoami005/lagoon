import 'package:lagoon/models/avatar.dart';

class Author {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? username;
  String? bio;
  String? email;
  String? phone;
  String? rating;
  Avatar? avatar;

  Author(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.username,
      this.bio,
      this.email,
      this.phone,
      this.rating,
      this.avatar});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      name: json['name'],
      username: json['username'],
      bio: json['bio'],
      email: json['email'],
      phone: json['phone'],
      rating: json['rating'],
      avatar: json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null,
    );
  }
}
