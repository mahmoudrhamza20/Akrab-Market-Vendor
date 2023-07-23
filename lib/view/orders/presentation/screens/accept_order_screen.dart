import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/accept_orders_view_body.dart';

class AcceptOrdersView extends StatelessWidget {
  const AcceptOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'تفاصيل الطلب',
          style: TextStyle(
            fontSize: 17.sp,
          ),
        ),
      ),
      body: const AcceptOrdersViewBody(),
    );
  }
}
