import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generalData/presentation/bloc/general_data_cubit.dart';

class AboutAppViewBody extends StatelessWidget {
  const AboutAppViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralDataCubit, GeneralDataState>(
      builder: (context, state) {
        if (state is GeneralDataLoaded) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  state.listOfGeneralData
                      .firstWhere((element) => element.key == 'AboutApp')
                      .value!,
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
