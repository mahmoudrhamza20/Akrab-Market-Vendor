import 'package:akrab_market_vendor/core/router/router.dart';
import 'package:akrab_market_vendor/view/newEmployee/presentation/screens/new_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManegeEmployeeAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ManegeEmployeeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        InkWell(
          onTap: () {
            MagicRouter.navigateTo(const NewEmployeeView());
          },
          child: Container(
              height: 50,
              width: 40,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  shape: BoxShape.rectangle),
              child: const Center(child: Icon(Icons.add))),
        )
      ],
      elevation: 0,
      title: Text(
        'إدارة الموظفين',
        style: TextStyle(
          fontSize: 17.sp,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
