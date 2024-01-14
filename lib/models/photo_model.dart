// To parse this JSON data, do
//
//     final photosModel = photosModelFromJson(jsonString);

import 'dart:convert';

PhotosModel photosModelFromJson(String str) =>
    PhotosModel.fromJson(json.decode(str));

String photosModelToJson(PhotosModel data) => json.encode(data.toJson());

class PhotosModel {
  bool? success;
  int? totalPhotos;
  String? message;
  int? offset;
  int? limit;
  List<Photo>? photos;

  PhotosModel({
    this.success,
    this.totalPhotos,
    this.message,
    this.offset,
    this.limit,
    this.photos,
  });

  factory PhotosModel.fromJson(Map<String, dynamic> json) => PhotosModel(
        success: json["success"],
        totalPhotos: json["total_photos"],
        message: json["message"],
        offset: json["offset"],
        limit: json["limit"],
        photos: json["photos"] == null
            ? []
            : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "total_photos": totalPhotos,
        "message": message,
        "offset": offset,
        "limit": limit,
        "photos": photos == null
            ? []
            : List<dynamic>.from(photos!.map((x) => x.toJson())),
      };
}

class Photo {
  String? url;
  String? title;
  int? user;
  String? description;
  int? id;

  Photo({
    this.url,
    this.title,
    this.user,
    this.description,
    this.id,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        url: json["url"],
        title: json["title"],
        user: json["user"],
        description: json["description"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "title": title,
        "user": user,
        "description": description,
        "id": id,
      };
}
