import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:cavalo_trucado/utils/constants.dart';
import 'package:cavalo_trucado/utils/models/vehicle_model.dart';
import 'package:cavalo_trucado/utils/models/brand_model.dart';
import 'package:cavalo_trucado/utils/models/data_model.dart';

class ApiService {
  Future<List<Vehicle>?> getVehicles() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.vehicleEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Vehicle> model = vehicleModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<Brand>?> getBrands() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.brandEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Brand> model = brandsModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<Vehicle>?> getSoldTrucks() async {
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.soldTrucksEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Vehicle> model = vehicleModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Data?> getTruckBySlug(String slug) async {
    try {
      var url =
      Uri.parse('${ApiConstants.baseUrl}/truck/$slug');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Data model = dataModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
