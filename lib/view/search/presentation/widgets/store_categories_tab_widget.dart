import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../bloc/search_cubit.dart';

class StoreCategoriesTabWidget extends StatelessWidget {
  const StoreCategoriesTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SearchCubit.of(context);
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return cubit.listOfStoreCategories == null
            ? const LinearProgressIndicator()
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.077,
                color: AppColors.primaryColor.withOpacity(0.3),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cubit.listOfStoreCategories?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        cubit.cateId = cubit.listOfStoreCategories![index].id!;
                        await cubit.getMarketsByCategoryId();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 5),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              cubit.listOfStoreCategories![index].name!,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
