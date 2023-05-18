import 'package:flutter/material.dart';
import 'package:cavalo_trucado/utils/models/vehicle_model.dart';
import 'package:cavalo_trucado/theme/color.dart';
import 'package:cavalo_trucado/utils/models/data_model.dart';
import 'package:cavalo_trucado/widgets/card_sold_vehicle.dart';

class DetailScreen extends StatefulWidget {
  Data data;
  List<Vehicle> vehicle;
  DetailScreen(this.data, this.vehicle, {super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String imageMainPhoto = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          widget.data.vehicleModelName.toString(),
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Container(
                  width: 410,
                  height: 348,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(imageMainPhoto != ""
                              ? imageMainPhoto
                              : widget.data.vehicleMainPhoto.toString()))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.data.photos.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          imageMainPhoto =
                              widget.data.photos[index].url.toString();
                        });
                      },
                      child: Card(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Container(
                            width: 88,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(widget
                                        .data.photos[index].url
                                        .toString()))),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 16, 16, 3),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${widget.data.brand}    ",
                            style:
                                const TextStyle(fontSize: 22, fontFamily: 'Poppins'),
                          ),
                          Text(
                            widget.data.vehicleModelName.toString(),
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
                        "R\$ ${widget.data.vehiclePrice}",
                        style: const TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 5, 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.data.vehicleShortText1.toString(),
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: AppColor.grayTextColor),
                          ),
                          Text(
                            widget.data.vehicleShortText2.toString(),
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: AppColor.grayTextColor),
                          ),
                          Text(
                            widget.data.vehicleShortText3.toString(),
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
                              "Ano: ${widget.data.vehicleYear}/${widget.data.vehicleYearModel}         ",
                              style: const TextStyle(
                                  fontFamily: 'Poppins', fontSize: 13),
                            ),
                            Text(
                              "Km: ${widget.data.vehicleKm}",
                              style: const TextStyle(
                                  fontFamily: 'Poppins', fontSize: 13),
                            ),
                          ],
                        )),
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
                            " Localizada em ${widget.data.vehicleState.label} - ${widget.data.vehicleState.value}",
                            maxLines: 2,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: AppColor.grayTextColor),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Image.asset('assets/whatsapp.png', height: 24.0),
                        label: const Text('Conversar no WhatsApp'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.colorButtonWpp,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            fixedSize: const Size(230, 50)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 16, 16, 5),
                      child: Text(
                        "Descrição",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 16, 16),
                      child: Text(widget.data.vehicleLongText.toString()),
                    )
                  ],
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(20,0,0,0),
                child:  Text(
                  "Vendidos",
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SizedBox(
                  height: 250,
                  child: ListView.builder(
                      itemCount: widget.vehicle.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CardSoldVehicle(vehicle: widget.vehicle[index]);
                      }),
                )),
          ],
        ),
      ),
    );
  }
}
