import 'package:akrab_market_vendor/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/router/router.dart';
import '../screens/order_details_screen.dart';

// ignore: must_be_immutable
class AcceptOrdersViewBody extends StatelessWidget {
  const AcceptOrdersViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(
            alignment: Alignment.bottomLeft,
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                height: 90.w,
                width: double.infinity,
                color: const Color(0xff2c5b78),
                child: Column(children: [
                  const Row(
                    children: [
                      Text(
                        'إسم العميل',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Spacer(),
                      Text(
                        'رقم الطلب: 30555#',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'منطقة: حى الجامعة',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Container(
                        height: 18,
                        width: 1,
                        color: Colors.white,
                      ),
                      const Text(
                        'رسوم التوصيل: 15 ج.م',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Container(
                        height: 18,
                        width: 1,
                        color: Colors.white,
                      ),
                      const Text(
                        '1.2 كم',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ]),
              ),
              Positioned(
                top: 90,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      Container(
                        width: 120.w,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Color(0xff30affb),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: const Center(
                            child: Text(
                          'تواصل مع العميل من خلال',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )),
                      ),
                      const CustomCircleButton(
                        icon: Icons.location_on,
                      ),
                      const CustomCircleButton(
                        icon: Icons.phone_in_talk,
                      ),
                      const CustomCircleButton(
                        icon: Icons.chat_bubble,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          Theme(
            data: ThemeData(
              primarySwatch: Colors.green,
            ),
            child: Stepper(
              currentStep: 1,
              steps: steps,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(0),
                border: Border.all(color: Colors.white),
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'إستلم من العميل',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '450 ج.م',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]));
  }

  static final steps = [
    Step(
      state: StepState.complete,
      title: InkWell(
          onTap: () => MagicRouter.navigateTo(const OrdersDetailsView()),
          child: const Text('منجات الفاتورة')),
      isActive: true,
      content: const Text(''),
    ),
    const Step(
        isActive: true,
        title: Text('إسم العميل '),
        content: Row(
          children: [
            CustomCircleButton(
              icon: Icons.location_on,
            ),
            CustomCircleButton(
              icon: Icons.phone_in_talk,
            ),
            CustomCircleButton(
              icon: Icons.chat_bubble,
            ),
          ],
        )),
    const Step(
      //isActive: true,
      state: StepState.disabled,
      title: Text('إنهاء وتسليم الطلب'),
      content: Text(''),
    )
  ];
}

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    super.key,
    required this.icon,
    this.onTap,
  });
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40,
        decoration: const BoxDecoration(
          color: Color(0xff30affb),
          shape: BoxShape.circle,
        ),
        child: Center(
            child: Icon(
          icon,
          color: Colors.white,
        )),
      ),
    );
  }
}
