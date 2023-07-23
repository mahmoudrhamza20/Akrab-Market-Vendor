import 'package:flutter/material.dart';
import '../widgets/add_product_appbar.dart';
import '../widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AddProductAppBar(),
      body: AddProductViewBody(),
    );
  }
}
