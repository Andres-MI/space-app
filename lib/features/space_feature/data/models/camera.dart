class Camera {
  Camera({
      this.id, 
      this.name, 
      this.roverId, 
      this.fullName,});

  Camera.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    roverId = json['rover_id'];
    fullName = json['full_name'];
  }
  int? id;
  String? name;
  int? roverId;
  String? fullName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['rover_id'] = roverId;
    map['full_name'] = fullName;
    return map;
  }

}