import 'dart:convert';

Data dataModelFromJson(String str){
  var jsonResponse = jsonDecode(str);
  var data = jsonResponse['data'];
  return Data.fromJson(data);
}

class Data {
  int? id;
  String? title;
  String? slug;
  String? brand;
  String? brandSlug;
  String? vehicleModelName;
  String? vehicleYear;
  String? vehicleYearModel;
  dynamic vehicleShowPrice;
  String? vehiclePrice;
  String? vehicleKm;
  VehicleState vehicleState;
  String? vehicleMainPhoto;
  String? vehicleLongText;
  String? vehicleShortText1;
  String? vehicleShortText2;
  String? vehicleShortText3;
  VehicleShortTexts vehicleShortTexts;
  List<Photo> photos;

  Data({
    required this.id,
    required this.title,
    required this.slug,
    required this.brand,
    required this.brandSlug,
    required this.vehicleModelName,
    required this.vehicleYear,
    required this.vehicleYearModel,
    this.vehicleShowPrice,
    required this.vehiclePrice,
    required this.vehicleKm,
    required this.vehicleState,
    required this.vehicleMainPhoto,
    required this.vehicleLongText,
    required this.vehicleShortText1,
    required this.vehicleShortText2,
    required this.vehicleShortText3,
    required this.vehicleShortTexts,
    required this.photos,
  });

  factory Data.fromJson(Map<String?, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        brand: json["brand"],
        brandSlug: json["brand_slug"],
        vehicleModelName: json["vehicle_model_name"],
        vehicleYear: json["vehicle_year"],
        vehicleYearModel: json["vehicle_year_model"],
        vehicleShowPrice: json["vehicle_show_price"],
        vehiclePrice: json["vehicle_price"],
        vehicleKm: json["vehicle_km"],
        vehicleState: VehicleState.fromJson(json["vehicle_state"]),
        vehicleMainPhoto: json["vehicle_main_photo"],
        vehicleLongText: json["vehicle_long_text"],
        vehicleShortText1: json["vehicle_short_text_1"],
        vehicleShortText2: json["vehicle_short_text_2"],
        vehicleShortText3: json["vehicle_short_text_3"],
        vehicleShortTexts:
            VehicleShortTexts.fromJson(json["vehicle_short_texts"]),
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "brand": brand,
        "brand_slug": brandSlug,
        "vehicle_model_name": vehicleModelName,
        "vehicle_year": vehicleYear,
        "vehicle_year_model": vehicleYearModel,
        "vehicle_show_price": vehicleShowPrice,
        "vehicle_price": vehiclePrice,
        "vehicle_km": vehicleKm,
        "vehicle_state": vehicleState.toJson(),
        "vehicle_main_photo": vehicleMainPhoto,
        "vehicle_long_text": vehicleLongText,
        "vehicle_short_text_1": vehicleShortText1,
        "vehicle_short_text_2": vehicleShortText2,
        "vehicle_short_text_3": vehicleShortText3,
        "vehicle_short_texts": vehicleShortTexts.toJson(),
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
      };
}

class Photo {
  String? url;
  String? alt;
  String? title;
  String? caption;
  String? description;
  Sizes sizes;
  int width;
  int height;

  Photo({
    required this.url,
    required this.alt,
    required this.title,
    required this.caption,
    required this.description,
    required this.sizes,
    required this.width,
    required this.height,
  });

  factory Photo.fromJson(Map<String?, dynamic> json) => Photo(
        url: json["url"],
        alt: json["alt"],
        title: json["title"],
        caption: json["caption"],
        description: json["description"],
        sizes: Sizes.fromJson(json["sizes"]),
        width: json["width"],
        height: json["height"],
      );

  Map<String?, dynamic> toJson() => {
        "url": url,
        "alt": alt,
        "title": title,
        "caption": caption,
        "description": description,
        "sizes": sizes.toJson(),
        "width": width,
        "height": height,
      };
}

class Sizes {
  String? thumbnail;
  String? thumbnailWidth;
  String? thumbnailHeight;
  String? medium;
  dynamic mediumWidth;
  dynamic mediumHeight;
  String? mediumLarge;
  dynamic mediumLargeWidth;
  dynamic mediumLargeHeight;
  String? large;
  dynamic largeWidth;
  dynamic largeHeight;
  String? the1536X1536;
  dynamic the1536X1536Width;
  dynamic the1536X1536Height;
  String? the2048X2048;
  dynamic the2048X2048Width;
  dynamic the2048X2048Height;

  Sizes({
    required this.thumbnail,
    required this.thumbnailWidth,
    required this.thumbnailHeight,
    required this.medium,
    this.mediumWidth,
    this.mediumHeight,
    required this.mediumLarge,
    this.mediumLargeWidth,
    this.mediumLargeHeight,
    required this.large,
    this.largeWidth,
    this.largeHeight,
    required this.the1536X1536,
    this.the1536X1536Width,
    this.the1536X1536Height,
    required this.the2048X2048,
    this.the2048X2048Width,
    this.the2048X2048Height,
  });

  factory Sizes.fromJson(Map<String?, dynamic> json) => Sizes(
        thumbnail: json["thumbnail"],
        thumbnailWidth: json["thumbnail-width"],
        thumbnailHeight: json["thumbnail-height"],
        medium: json["medium"],
        mediumWidth: json["medium-width"],
        mediumHeight: json["medium-height"],
        mediumLarge: json["medium_large"],
        mediumLargeWidth: json["medium_large-width"],
        mediumLargeHeight: json["medium_large-height"],
        large: json["large"],
        largeWidth: json["large-width"],
        largeHeight: json["large-height"],
        the1536X1536: json["1536x1536"],
        the1536X1536Width: json["1536x1536-width"],
        the1536X1536Height: json["1536x1536-height"],
        the2048X2048: json["2048x2048"],
        the2048X2048Width: json["2048x2048-width"],
        the2048X2048Height: json["2048x2048-height"],
      );

  Map<String?, dynamic> toJson() => {
        "thumbnail": thumbnail,
        "thumbnail-width": thumbnailWidth,
        "thumbnail-height": thumbnailHeight,
        "medium": medium,
        "medium-width": mediumWidth,
        "medium-height": mediumHeight,
        "medium_large": mediumLarge,
        "medium_large-width": mediumLargeWidth,
        "medium_large-height": mediumLargeHeight,
        "large": large,
        "large-width": largeWidth,
        "large-height": largeHeight,
        "1536x1536": the1536X1536,
        "1536x1536-width": the1536X1536Width,
        "1536x1536-height": the1536X1536Height,
        "2048x2048": the2048X2048,
        "2048x2048-width": the2048X2048Width,
        "2048x2048-height": the2048X2048Height,
      };
}

class VehicleShortTexts {
  String? vehicleShortText1;
  String? vehicleShortText2;
  String? vehicleShortText3;

  VehicleShortTexts({
    required this.vehicleShortText1,
    required this.vehicleShortText2,
    required this.vehicleShortText3,
  });

  factory VehicleShortTexts.fromJson(Map<String?, dynamic> json) =>
      VehicleShortTexts(
        vehicleShortText1: json["vehicle_short_text_1"],
        vehicleShortText2: json["vehicle_short_text_2"],
        vehicleShortText3: json["vehicle_short_text_3"],
      );

  Map<String?, dynamic> toJson() => {
        "vehicle_short_text_1": vehicleShortText1,
        "vehicle_short_text_2": vehicleShortText2,
        "vehicle_short_text_3": vehicleShortText3,
      };
}

class VehicleState {
  String? value;
  String? label;

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
