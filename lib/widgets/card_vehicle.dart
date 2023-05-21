import 'package:flutter/material.dart';
import 'package:cavalo_trucado/utils/models/vehicle_model.dart';
import 'package:cavalo_trucado/theme/color.dart';

class CardVehicle extends StatelessWidget {
  final Vehicle vehicle;
  final VoidCallback onTapItem;

  const CardVehicle({Key? key, required this.vehicle, required this.onTapItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapItem,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          elevation: 1,
          shadowColor: AppColor.colorShadow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 410,
                  height: 348,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(vehicle.vehicleMainPhoto.toString()))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 16, 16, 3),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${vehicle.brand}    ",
                      style: const TextStyle(fontSize: 22, fontFamily: 'Poppins'),
                    ),
                    Text(
                      vehicle.vehicleModelName.toString(),
                      style: const TextStyle(
                          fontSize: 22,
                          color: AppColor.primary,
                          fontFamily: 'Poppins'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 3),
                child: Text(
                  "R\$ ${vehicle.vehiclePrice}",
                  style: const TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      vehicle.vehicleShortText1.toString(),
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          color: AppColor.grayTextColor),
                    ),
                    Text(
                      vehicle.vehicleShortText2.toString(),
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          color: AppColor.grayTextColor),
                    ),
                    Text(
                      vehicle.vehicleShortText3.toString(),
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          color: AppColor.grayTextColor),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 16, 3),
                  child: Row(
                    children: [
                      Text(
                        "Ano: ${vehicle.vehicleYear}/${vehicle.vehicleYearModel}         ",
                        style: const TextStyle(fontFamily: 'Poppins', fontSize: 13),
                      ),
                      Text(
                        "Km: ${vehicle.vehicleKm}",
                        style: const TextStyle(fontFamily: 'Poppins', fontSize: 13),
                      ),
                    ],
                  )),
              const Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 3, 0, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.pin_drop,
                      color: AppColor.grayTextColor,
                      weight: 15,
                    ),
                    Text(
                      " Localizada em ${vehicle.vehicleState.label} - ${vehicle.vehicleState.value}",
                      maxLines: 2,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          color: AppColor.grayTextColor),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
