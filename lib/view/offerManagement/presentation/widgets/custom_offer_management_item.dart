import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../widgets/delete_alert_dialog.dart';
import '../../../manegeEmploye/presentation/widgets/manege_employee_body.dart';

class CustomOfferManagementItem extends StatelessWidget {
  const CustomOfferManagementItem({
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
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: Text(
                maxLines: 2,
                'إزازة زيت عافية',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              maxLines: 2,
              'تاريخ الإنتهاء: 2020-02-20',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
        const Spacer(),
        CustomeEditButton(
            bgColor: const Color(0xff009fff), icon: Icons.edit, onTap: () {}),
        CustomeEditButton(
            bgColor: const Color(0xffff0000),
            icon: Icons.delete_outline,
            onTap: () {
              showAlertDialog(
                  context: context,
                  title: const Text('حذف العرض'),
                  body: const Text('هل أنت متأكد من أنك تريد حذف العرض؟'));
            }),
      ],
    );
  }
}
