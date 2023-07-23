import 'package:akrab_market_vendor/core/router/router.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../widgets/delete_alert_dialog.dart';
import '../../../manegeEmploye/presentation/widgets/manege_employee_body.dart';
import '../screens/product_edit.dart';

class CustomProductManagementItem extends StatelessWidget {
  const CustomProductManagementItem({
    super.key,
  });

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
        Container(
          height: 80,
          width: 100,
          alignment: Alignment.topCenter,
          child: const Text(
            maxLines: 2,
            'إزازة زيت عافية',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        const Spacer(),
        CustomeEditButton(
            bgColor: const Color(0xff009fff),
            icon: Icons.edit,
            onTap: () => MagicRouter.navigateTo(const ProductEditView())),
        CustomeEditButton(
            bgColor: const Color(0xffff0000),
            icon: Icons.delete_outline,
            onTap: () {
              showAlertDialog(
                  context: context,
                  title: const Text('حذف المنتج'),
                  body: const Text('هل أنت متأكد من أنك تريد حذف المنتج'));
            }),
      ],
    );
  }
}
