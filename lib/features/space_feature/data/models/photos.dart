import 'camera.dart';
import 'rover.dart';

class Photos {
  int? id;
  int? sol;
  Camera? camera;
  String? imgSrc;
  String? earthDate;
  Rover? rover;

  Photos({
    this.id,
    this.sol,
    this.camera,
    this.imgSrc,
    this.earthDate,
    this.rover,
  });

  Photos.fromJson(dynamic json) {
    id = json['id'];
    sol = json['sol'];
    camera = json['camera'] != null ? Camera.fromJson(json['camera']) : null;
    imgSrc = json['img_src'];
    earthDate = json['earth_date'];
    rover = json['rover'] != null ? Rover.fromJson(json['rover']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sol'] = sol;
    if (camera != null) {
      map['camera'] = camera?.toJson();
    }
    map['img_src'] = imgSrc;
    map['earth_date'] = earthDate;
    if (rover != null) {
      map['rover'] = rover?.toJson();
    }
    return map;
  }
}
