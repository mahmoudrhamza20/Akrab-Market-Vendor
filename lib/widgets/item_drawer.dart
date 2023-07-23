import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer(
      {Key? key, required this.icon, required this.text, required this.ontap})
      : super(key: key);

  final IconData icon;
  final String text;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(right: 10, bottom: 12),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30.sp,
              color: Colors.grey,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
