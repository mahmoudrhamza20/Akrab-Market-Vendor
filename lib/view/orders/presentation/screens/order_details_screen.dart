import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/orders_cubit.dart';
import '../widgets/order_details_appbar.dart';
import '../widgets/order_details_body.dart';

class OrdersDetailsView extends StatelessWidget {
  const OrdersDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDataCubit()..getOrderData(),
      child: const Scaffold(
        appBar: OrdersDetailsAppBar(),
        body: OrdersDetailsViewBody(),
      ),
    );
  }
}
