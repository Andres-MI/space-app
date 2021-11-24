class Rover {
  Rover({
      this.id, 
      this.name, 
      this.landingDate, 
      this.launchDate, 
      this.status,});

  Rover.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    landingDate = json['landing_date'];
    launchDate = json['launch_date'];
    status = json['status'];
  }
  int? id;
  String? name;
  String? landingDate;
  String? launchDate;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['landing_date'] = landingDate;
    map['launch_date'] = launchDate;
    map['status'] = status;
    return map;
  }

}