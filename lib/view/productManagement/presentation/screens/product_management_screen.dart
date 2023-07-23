import 'package:flutter/material.dart';
import '../widgets/product_management_body.dart';
import '../widgets/product_management_appbar.dart';

class ProductManagementView extends StatelessWidget {
  const ProductManagementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProductManagementAppBar(),
      body: ProductManagementViewBody(),
    );
  }
}
