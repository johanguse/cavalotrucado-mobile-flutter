import 'package:flutter/material.dart';
import 'package:cavalo_trucado/theme/color.dart';

class FirstCardBrand extends StatelessWidget {
  final VoidCallback onTapItem;
  const FirstCardBrand({Key? key, required this.onTapItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapItem,
      child: const Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Card(
          color: AppColor.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          elevation: 0,
          child: SizedBox(
            width: 69,
            height: 85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                  child: Icon(
                    Icons.local_shipping_outlined,
                    color: AppColor.white,
                    weight: 30,
                  ),
                ),
                Text(
                  "Todos",
                  style: TextStyle(
                      fontSize: 14, fontFamily: 'Poppins', color: AppColor.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
