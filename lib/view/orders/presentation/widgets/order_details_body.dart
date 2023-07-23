import 'package:akrab_market_vendor/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../widgets/custom_button.dart';
import '../bloc/orders_cubit.dart';
import 'custom_dialog_of_close_order.dart';
import 'custom_order_details_item.dart';

// ignore: must_be_immutable
class OrdersDetailsViewBody extends StatelessWidget {
  const OrdersDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = OrderDataCubit.of(context);
    return BlocBuilder<OrderDataCubit, OrdersState>(
      builder: (context, state) {
        return state is OrdersLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        height: 90.w,
                        width: double.infinity,
                        color: const Color(0xff2c5b78),
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                'إسم العميل: ${cubit.orderData!.clientName}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              const Spacer(),
                              Text(
                                'رقم الطلب: ${cubit.orderData!.orderId}',
                                style: const TextStyle(
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
                              Text(
                                'منطقة: ${cubit.orderData!.clientName}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Container(
                                height: 18,
                                width: 1,
                                color: Colors.white,
                              ),
                              Text(
                                'رسوم التوصيل: ${cubit.orderData!.delevery}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Container(
                                height: 18,
                                width: 1,
                                color: Colors.white,
                              ),
                              Text(
                                ' ${cubit.orderData!.destance}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              CustomOrderDetailsItem(
                                productName:
                                    cubit.orderItem[index]!.productName,
                                price: cubit.orderItem[index]!.price,
                                quantity: cubit.orderItem[index]!.quantity,
                                sizeDetails:
                                    cubit.orderItem[index]!.sizeDetails,
                                thisTotal: cubit.orderItem[index]!.thisTotal
                                    .toString(),
                              ),
                          separatorBuilder: (context, index) => const Divider(
                              indent: 10, endIndent: 10, thickness: 1.1),
                          itemCount: cubit.orderItem.length),
                      const Divider(indent: 10, endIndent: 10, thickness: 1.1),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            border: Border.all(color: Colors.white),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'عدد الأصناف: ${cubit.orderData!.itemsNo.toString()}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                Container(
                                  height: 18,
                                  width: 1,
                                  color: Colors.white,
                                ),
                                Text(
                                  'إجمالي الفاتوره: ${cubit.orderData!.totalPrice}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .465,
                              child: CustomButton(
                                  buttonColor: const Color(0xff62d343),
                                  fontSize: 14.sp,
                                  text: 'قبول الطلب',
                                  onPress: () {
                                    cubit.acceptOrder();
                                  }),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .465,
                              child: CustomButton(
                                  buttonColor: const Color(0xffd34343),
                                  fontSize: 14.sp,
                                  text: 'رفض الطلب',
                                  onPress: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return customDialogOfCloseOrder(
                                            context);
                                      },
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .465,
                              child: CustomButton(
                                  buttonColor: const Color(0xffd3bd43),
                                  fontSize: 14.sp,
                                  text: 'تواصل مع العميل',
                                  onPress: () {}),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .465,
                              child: CustomButton(
                                  buttonColor: const Color(0xffa543d3),
                                  fontSize: 14.sp,
                                  text: 'إرسال لعامل التوصيل',
                                  onPress: () {}),
                            ),
                          ],
                        ),
                      ),
                    ]));
      },
    );
  }
}
