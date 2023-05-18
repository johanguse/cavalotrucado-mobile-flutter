import 'dart:convert';

List<Vehicle> vehicleModelFromJson(String str){
  var jsonResponse = jsonDecode(str);
  var data = jsonResponse['data'];
  return List<Vehicle>.from(data.map((x) => Vehicle.fromJson(x)));
}

class Vehicle {
  int id;
  String? title;
  String? slug;
  String? brand;
  String? vehicleModelName;
  String? vehicleYear;
  String? vehicleYearModel;
  dynamic vehicleShowPrice;
  String? vehiclePrice;
  String? vehicleKm;
  VehicleState vehicleState;
  String? vehicleMainPhoto;
  String? vehicleShortText1;
  String? vehicleShortText2;
  String? vehicleShortText3;

  Vehicle({
    required this.id,
    required this.title,
    required this.slug,
    required this.brand,
    required this.vehicleModelName,
    required this.vehicleYear,
    this.vehicleYearModel,
    this.vehicleShowPrice,
    required this.vehiclePrice,
    required this.vehicleKm,
    required this.vehicleState,
    required this.vehicleMainPhoto,
    this.vehicleShortText1,
    this.vehicleShortText2,
    this.vehicleShortText3,
  });

  factory Vehicle.fromJson(Map<String?, dynamic> json) => Vehicle(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    brand: json["brand"],
    vehicleModelName: json["vehicle_model_name"],
    vehicleYear: json["vehicle_year"],
    vehicleYearModel: json["vehicle_year_model"],
    vehicleShowPrice: json["vehicle_show_price"],
    vehiclePrice: json["vehicle_price"],
    vehicleKm: json["vehicle_km"],
    vehicleState: VehicleState.fromJson(json["vehicle_state"]),
    vehicleMainPhoto: json["vehicle_main_photo"],
    vehicleShortText1: json["vehicle_short_text_1"],
    vehicleShortText2: json["vehicle_short_text_2"],
    vehicleShortText3: json["vehicle_short_text_3"],
  );

  Map<String?, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "brand": brand,
    "vehicle_model_name": vehicleModelName,
    "vehicle_year": vehicleYear,
    "vehicle_year_model": vehicleYearModel,
    "vehicle_show_price": vehicleShowPrice,
    "vehicle_price": vehiclePrice,
    "vehicle_km": vehicleKm,
    "vehicle_state": vehicleState.toJson(),
    "vehicle_main_photo": vehicleMainPhoto,
    "vehicle_short_text_1": vehicleShortText1,
    "vehicle_short_text_2": vehicleShortText2,
    "vehicle_short_text_3": vehicleShortText3,
  };
}

class VehicleState {
  String value;
  String label;

  VehicleState({
    required this.value,
    required this.label,
  });

  factory VehicleState.fromJson(Map<String?, dynamic> json) => VehicleState(
    value: json["value"],
    label: json["label"],
  );

  Map<String?, dynamic> toJson() => {
    "value": value,
    "label": label,
  };
}
