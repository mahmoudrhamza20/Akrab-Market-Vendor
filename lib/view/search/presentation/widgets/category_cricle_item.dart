import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/models/categories_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../bloc/search_cubit.dart';

class CategoryCricleItem extends StatelessWidget {
  const CategoryCricleItem(
      {Key? key,
      required this.index,
      required this.getData,
      required this.function})
      : super(key: key);

  final int index;
  final Categories getData;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    final cubit = SearchCubit.of(context);
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: cubit.selectedCateIndex == index
                        ? AppColors.primaryColor
                        : Colors.grey,
                    width: 3),
                image: DecorationImage(
                  image: NetworkImage(getData.photo!),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Text(
              getData.name!,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: cubit.selectedCateIndex == index
                      ? AppColors.primaryColor
                      : Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
