import 'package:flutter/material.dart';
import 'package:cavalo_trucado/screens/home/home.dart';
import 'package:cavalo_trucado/screens/truck_details/details.dart';
import 'package:cavalo_trucado/utils/models/data_model.dart';
import 'package:cavalo_trucado/utils/models/vehicle_model.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final name = settings.name;

    if (name == '/') {
      return MaterialPageRoute(builder: (context) => const Home());
    } else if (name == '/detail') {
      final args = settings.arguments as Map;
      final dataModel = args['dataModel'];
      final soldTruck = args['soldTruck'];
      return MaterialPageRoute(builder: (context) => DetailScreen(dataModel as Data, soldTruck as List<Vehicle>));
    }

    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Screen not found."),
        ),
        body: const Center(
          child: Text("Screen not found."),
        ),
      );
    });
  }
}
