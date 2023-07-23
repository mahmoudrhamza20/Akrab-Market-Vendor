import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import 'custom_order_item.dart';

// ignore: must_be_immutable
class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Row(
              children: [
                Text(
                  'الطلبات السابقة',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  '15-01-2022',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '  -  ',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '10-01-2022',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: CustomOrderItem(),
              ),
            )
          ]),
        ));
  }
}
