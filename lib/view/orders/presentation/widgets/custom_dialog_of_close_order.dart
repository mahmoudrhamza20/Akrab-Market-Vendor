import 'dart:developer';
import 'package:akrab_market_vendor/core/router/router.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../bloc/orders_cubit.dart';

Widget customDialogOfCloseOrder(BuildContext context) {
  final cubit = OrderDataCubit.of(context);
  // Group Value for Radio Button.
  String radioItem = 'عامل التوصيل غير متوفر حالياً';
  int id = 0;
  List<ReasonsModel> reasons = [
    ReasonsModel(
      index: 1,
      name: 'لا يوجد توصيل لهذه المنطقة',
    ),
    ReasonsModel(
      index: 2,
      name: 'المتجر مغلق الأن',
    ),
    ReasonsModel(
      index: 3,
      name: 'عامل التوصيل غير متوفر حالياً',
    ),
  ];

  return AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    actions: [
      InkWell(
        onTap: () => Navigator.pop(context),
        child: const Text(
          'إغلاق القائمة',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16,
          ),
        ),
      ),
    ],
    contentPadding: EdgeInsets.zero,
    content: Builder(builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => SizedBox(
          height: 170,
          child: Column(
            children: reasons
                .map((data) => RadioListTile(
                      activeColor: AppColors.primaryColor,
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        data.name,
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                      groupValue: id,
                      value: data.index,
                      onChanged: (val) {
                        setState(() {
                          radioItem = data.name;
                          id = data.index;
                        });
                        cubit.refuseOrder(comment: radioItem);
                        MagicRouter.pop();
                        log(id.toString());
                        log(radioItem);
                      },
                    ))
                .toList(),
          ),
        ),
      );
    }),
  );
}

class ReasonsModel {
  String name;
  int index;
  ReasonsModel({required this.name, required this.index});
}
