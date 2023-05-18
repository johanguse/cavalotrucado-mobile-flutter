import 'dart:convert';

List<Brand> brandsModelFromJson(String str){
  var jsonResponse = jsonDecode(str);
  var data = jsonResponse['data'];
  return List<Brand>.from(data.map((x) => Brand.fromJson(x)));
}

class Brand {
  int id;
  String? name;
  String? slug;
  String? description;
  int count;
  String? image;

  Brand({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.count,
    required this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        count: json["count"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "count": count,
        "image": image,
      };
}
