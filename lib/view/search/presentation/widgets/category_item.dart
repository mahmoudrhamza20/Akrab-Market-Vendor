import 'package:flutter/material.dart';
import '../../../../core/models/categories_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.getData, required this.fun})
      : super(key: key);

  final Categories getData;
  final Function() fun;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(getData.photo!),
          ),
        ),
      ),
    );
  }
}
