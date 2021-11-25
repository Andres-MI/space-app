enum CameraType { FHAZ, RHAZ, MAST, CHEMCAM, MAHLI, MARDI, NAVCAM }

///Extension to retrieve the String value of the enum
extension ParseToString on CameraType{
  String stringValue(){
    return toString().split('.').last;
  }
}
