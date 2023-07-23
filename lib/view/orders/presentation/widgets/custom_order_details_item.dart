import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class CustomOrderDetailsItem extends StatelessWidget {
  const CustomOrderDetailsItem({
    super.key,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.sizeDetails,
    required this.thisTotal,
  });
  final String productName;
  final String quantity;
  final String price;
  final String sizeDetails;
  final String thisTotal;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 2),
                shape: BoxShape.rectangle),
            child: Center(
              child: Image.asset(AppAssets.imageProduct),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 40,
                width: 70,
                margin: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.primaryColor, width: 2),
                    shape: BoxShape.rectangle),
                child: Center(
                  child: Text(
                    sizeDetails,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                )),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$quantity * $price ',
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
              Text(
                ' $thisTotal',
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        )
      ],
    );
  }
}
