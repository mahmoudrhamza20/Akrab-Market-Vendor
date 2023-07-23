import 'package:flutter/material.dart';
import '../widgets/orders_appbar.dart';
import '../widgets/orders_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: OrdersAppBar(),
      body: OrdersViewBody(),
    );
  }
}
