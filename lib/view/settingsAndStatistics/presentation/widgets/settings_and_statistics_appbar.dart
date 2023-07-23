import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsAndStatisticsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SettingsAndStatisticsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      // centerTitle: true,
      title: Text(
        'إعدادات وإحصائيات',
        style: TextStyle(
          fontSize: 17.sp,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
