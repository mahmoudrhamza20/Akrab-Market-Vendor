import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductManagementAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductManagementAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        'إدارة المنتجات',
        style: TextStyle(
          fontSize: 17.sp,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
