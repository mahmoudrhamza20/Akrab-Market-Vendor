import 'package:flutter/material.dart';
import '../widgets/product_edit_appbar.dart';
import '../widgets/product_edit_body.dart';

class ProductEditView extends StatelessWidget {
  const ProductEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProductEditAppBar(),
      body: ProductEditViewBody(),
    );
  }
}
