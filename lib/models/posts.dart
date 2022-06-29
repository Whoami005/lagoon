import 'package:lagoon/models/author.dart';
import 'package:lagoon/models/photos.dart';

class Data {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  String? description;
  bool? isDeleted;
  int? score;
  Author? author;
  List<Photos>? photos;
  int? likesCount;
  int? commentsCount;
  bool? liked;

  Data({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.description,
    this.isDeleted,
    this.score,
    this.author,
    this.photos,
    this.likesCount,
    this.commentsCount,
    this.liked,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    final List<Photos> photos = [];
    json['photos'].forEach((json) {
      photos.add(Photos.fromJson(json));
    });
    return Data(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      title: json['title'] ?? '',
      description: json['description'],
      isDeleted: json['isDeleted'],
      score: json['score'],
      author: json['author'] != null ? Author.fromJson(json['author']) : null,
      photos: photos,
      likesCount: json['likesCount'],
      commentsCount: json['commentsCount'],
      liked: json['liked'],
    );
  }
}
