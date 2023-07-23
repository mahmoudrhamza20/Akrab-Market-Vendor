import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/utils/app_colors.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Column(
            children: [
              Center(child: Lottie.asset('assets/json/noOrders.json')),
              const Text(
                'لا يوجد طلبات حالية',
                style: TextStyle(fontSize: 20, color: AppColors.primaryColor),
              )
            ],
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center, children: [
          //   const Row(
          //     children: [
          //       Text(
          //         'الطلبات الحالية',
          //         style: TextStyle(
          //             color: AppColors.primaryColor,
          //             fontSize: 16,
          //             fontWeight: FontWeight.bold),
          //       ),
          //       Spacer(),
          //       Text(
          //         '20-07-2022',
          //         style: TextStyle(
          //             color: Colors.grey,
          //             fontSize: 17,
          //             fontWeight: FontWeight.bold),
          //       ),
          //       Text(
          //         '  -  ',
          //         style: TextStyle(
          //             color: Colors.grey,
          //             fontSize: 17,
          //             fontWeight: FontWeight.bold),
          //       ),
          //       Text(
          //         '10-07-2022',
          //         style: TextStyle(
          //             color: Colors.grey,
          //             fontSize: 17,
          //             fontWeight: FontWeight.bold),
          //       ),
          //     ],
          //   ),
          //   ListView.builder(
          //     physics: const NeverScrollableScrollPhysics(),
          //     shrinkWrap: true,
          //     itemCount: 5,
          //     itemBuilder: (context, index) => const Padding(
          //       padding: EdgeInsets.only(bottom: 8),
          //       child: CustomOrderItem(),
          //     ),
          //   )
          // ]),
        ));
  }
}
