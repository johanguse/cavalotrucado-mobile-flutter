import 'package:flutter/material.dart';
import 'package:cavalo_trucado/utils/models/vehicle_model.dart';
import 'package:cavalo_trucado/utils/api_service.dart';
import 'package:cavalo_trucado/widgets/card_vehicle.dart';
import 'package:cavalo_trucado/utils/models/brand_model.dart';
import 'package:cavalo_trucado/widgets/card_brand.dart';
import 'package:cavalo_trucado/widgets/first_card_brand.dart';
import 'package:cavalo_trucado/widgets/card_sold_vehicle.dart';
import 'package:cavalo_trucado/theme/color.dart';
import 'package:cavalo_trucado/utils/models/data_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Vehicle>? _vehicleModel = [];
  late List<Vehicle>? _soldTrucksModel = [];
  late List<Brand>? _brandModel = [];
  late Data? _dataModel;
  bool light = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _vehicleModel = (await ApiService().getVehicles())!;
    _brandModel = (await ApiService().getBrands())!;
    _soldTrucksModel = (await ApiService().getSoldTrucks())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  _getTruckBySlug(String slug) async {
    _dataModel = (await ApiService().getTruckBySlug(slug))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  Future refresh() async {
    setState(() {
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          elevation: 1,
          shadowColor: AppColor.colorShadow,
          title: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/logo_cavalo-trucado.png',
              width: 200,
              height: 56,
              fit: BoxFit.fitHeight,
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.notifications_none),
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Notifications',
                    child: Text('Notifications'),
                  ),
                ];
              },
            ),
          ],
          backgroundColor: AppColor.white,
          iconTheme: const IconThemeData(color: AppColor.primary),
          centerTitle: true,
        ),
      ),
      body: _vehicleModel == null || _vehicleModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColor.primary,
              ),
            )
          : RefreshIndicator(
              color: AppColor.primary,
              onRefresh: refresh,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 10),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColor.white,
                            hintText: "Burcar por algo...",
                            suffixIcon: Icon(
                              Icons.search,
                              color: AppColor.primary,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: AppColor.primary),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Marcas",
                          style: TextStyle(
                            fontSize: 22,
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 90,
                        child: ListView.builder(
                            itemCount: (_brandModel?.length ?? 0) + 1,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return FirstCardBrand(
                                  onTapItem: () {},
                                );
                              } else {
                                return CardBrand(
                                    onTapItem: () {},
                                    brand: _brandModel![index - 1]);
                              }
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Novidades",
                              style: TextStyle(
                                fontSize: 22,
                                color: AppColor.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                child: const Text(
                                  "Ver todas",
                                  style:
                                      TextStyle(color: AppColor.grayTextColor),
                                ))
                          ],
                        ),
                      ),
                      ListView.builder(
                          itemCount: _vehicleModel?.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: CardVehicle(
                                  vehicle: _vehicleModel![index],
                                  onTapItem: () async {
                                    await _getTruckBySlug(
                                        _vehicleModel![index].slug.toString());
                                    if (_dataModel != null) {
                                      Navigator.pushNamed(context, "/detail",
                                          arguments: {
                                            'dataModel': _dataModel!,
                                            'soldTruck': _soldTrucksModel
                                          });
                                    }
                                  },
                                ));
                          }),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Vendidos",
                          style: TextStyle(
                            fontSize: 22,
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                            itemCount: _soldTrucksModel?.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CardSoldVehicle(
                                  vehicle: _soldTrucksModel![index]);
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: OrientationBuilder(
                                builder: (context, orientation) {
                                  return Image(
                                    image: const AssetImage(
                                        'assets/image_banner.png'),
                                    width: orientation == Orientation.portrait
                                        ? 816
                                        : 416,
                                    height: 199,
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Opacity(
                                opacity: 0.9,
                                child: Container(
                                    height: 70,
                                    color: AppColor.pageColor,
                                    child: const Center(
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0),
                                              child: Text(
                                                  "Você não encontrou o que estava procurando?",
                                                  style: TextStyle(
                                                      color: AppColor.primary,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0),
                                              child: Text(
                                                "Entre em contato conosco!",
                                                style: TextStyle(
                                                    color: AppColor.primary,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                              child: Center(
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Image.asset('assets/whatsapp.png',
                                      height: 24.0),
                                  label: const Text('Conversar no WhatsApp'),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.colorButtonWpp,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      fixedSize: const Size(230, 50)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
              )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColor.white,
              ),
              child: Image(
                image: AssetImage('assets/logo_cavalo-trucado.png'),
                width: 180,
                height: 56,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home_filled,
                color: AppColor.grayDrawer,
              ),
              title: const Text(
                'Dashboard',
                style: TextStyle(
                    color: AppColor.grayDrawer, fontFamily: 'Poppins'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.edit,
                color: AppColor.grayDrawer,
              ),
              title: const Text(
                'Posts',
                style: TextStyle(
                    color: AppColor.grayDrawer, fontFamily: 'Poppins'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.image,
                color: AppColor.grayDrawer,
              ),
              title: const Text(
                'Media',
                style: TextStyle(
                    color: AppColor.grayDrawer, fontFamily: 'Poppins'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.description,
                color: AppColor.grayDrawer,
              ),
              title: const Text(
                'Pages',
                style: TextStyle(
                    color: AppColor.grayDrawer, fontFamily: 'Poppins'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.chat,
                color: AppColor.grayDrawer,
              ),
              title: const Text(
                'Comments',
                style: TextStyle(
                    color: AppColor.grayDrawer, fontFamily: 'Poppins'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.grid_view_rounded,
                color: AppColor.grayDrawer,
              ),
              title: const Text(
                'Appearance',
                style: TextStyle(
                    color: AppColor.grayDrawer, fontFamily: 'Poppins'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_bag,
                color: AppColor.grayDrawer,
              ),
              title: const Text(
                'Plugins',
                style: TextStyle(
                    color: AppColor.grayDrawer, fontFamily: 'Poppins'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.groups,
                color: AppColor.grayDrawer,
              ),
              title: const Text(
                'Users',
                style: TextStyle(
                    color: AppColor.grayDrawer, fontFamily: 'Poppins'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: AppColor.grayDrawer,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(
                    color: AppColor.grayDrawer, fontFamily: 'Poppins'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.tune,
                color: AppColor.grayDrawer,
              ),
              title: const Text(
                'Tools',
                style: TextStyle(
                    color: AppColor.grayDrawer, fontFamily: 'Poppins'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.dark_mode,
                color: AppColor.grayDrawer,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Dark Mode',
                    style: TextStyle(
                        color: AppColor.grayDrawer, fontFamily: 'Poppins'),
                  ),
                  Switch(
                      value: light,
                      activeColor: AppColor.primary,
                      onChanged: (bool value) {
                        setState(() {
                          light = value;
                        });
                      })
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              tileColor: AppColor.grayDrawer,
              leading: const Icon(
                Icons.logout,
                color: AppColor.white,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(color: AppColor.white, fontFamily: 'Poppins'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
