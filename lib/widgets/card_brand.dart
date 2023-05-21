import 'package:flutter/material.dart';
import 'package:cavalo_trucado/utils/models/brand_model.dart';
import 'package:cavalo_trucado/theme/color.dart';

class CardBrand extends StatelessWidget {
  final Brand brand;
  final VoidCallback onTapItem;
  const CardBrand({Key? key, required this.brand, required this.onTapItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapItem,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,0,10,0),
        child: Card(
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: AppColor.secondary,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          elevation: 0,
          child: SizedBox(
            width: 91,
            height: 85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage(brand.image.toString()),
                  height: 50,
                  width: 50,
                ),
                Text(
                  brand.slug.toString(),
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      color: AppColor.secondary),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
