import 'photos.dart';

class MarsPictureModel{
  List<Photos>? photos;

  MarsPictureModel({
    this.photos,
  });

  MarsPictureModel.fromJson(dynamic json) {
    if (json['photos'] != null) {
      photos = [];
      json['photos'].forEach((v) {
        photos?.add(Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (photos != null) {
      map['photos'] = photos?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
