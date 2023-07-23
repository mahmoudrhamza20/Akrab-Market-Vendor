import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/models/categories_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../bloc/search_cubit.dart';

class CategoryTabItem extends StatelessWidget {
  const CategoryTabItem(
      {Key? key, required this.index , required this.fun, required this.getDataCategories})
      : super(key: key);

  final int index;
  final Function() fun;
  final Categories getDataCategories;

  @override
  Widget build(BuildContext context) {
    final cubit = SearchCubit.of(context);
    return InkWell(
      onTap: fun,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: cubit.selectedSubCateIndex == index
                  ? AppColors.primaryColor
                  : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              getDataCategories.name!,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
