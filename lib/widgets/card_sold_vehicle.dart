import 'package:flutter/material.dart';
import 'package:cavalo_trucado/utils/models/vehicle_model.dart';
import 'dart:math' as math;
import 'package:cavalo_trucado/theme/color.dart';

class CardSoldVehicle extends StatelessWidget {
  final Vehicle vehicle;
  const CardSoldVehicle({Key? key, required this.vehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          elevation: 1,
          shadowColor: AppColor.colorShadow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    child: Container(
                      width: 146,
                      height: 125,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  vehicle.vehicleMainPhoto.toString()))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Transform.rotate(
                      angle: -math.pi / 4,
                      child: Container(
                        color: AppColor.secondary,
                        child: const Text(' VENDIDO ',
                            style: TextStyle(color: AppColor.white, fontSize: 12)),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(9, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${vehicle.brand}  ",
                      style: const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                    ),
                    Text(
                      vehicle.vehicleModelName.toString(),
                      style: const TextStyle(
                          fontSize: 16,
                          color: AppColor.primary,
                          fontFamily: 'Poppins'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(9, 12, 0, 0),
                child: Text(
                  "Ano: ${vehicle.vehicleYear}/${vehicle.vehicleYearModel}         ",
                  style: const TextStyle(fontFamily: 'Poppins', fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(9, 12, 0, 0),
                child: Text(
                  "Km: ${vehicle.vehicleKm}",
                  style: const TextStyle(fontFamily: 'Poppins', fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
