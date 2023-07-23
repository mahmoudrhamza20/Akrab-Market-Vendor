import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_func.dart';
import '../../../../core/validator/validator.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/input_form_field.dart';
import '../../../generalData/presentation/bloc/general_data_cubit.dart';
import '../bloc/contact_us_cubit.dart';

class ContactUsViewBody extends StatelessWidget {
  const ContactUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = ContactUsCubit.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Form(
          key: cubit.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<GeneralDataCubit, GeneralDataState>(
                builder: (context, state) {
                  if (state is GeneralDataLoaded) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            AppFunc.launchUrlFun(
                                "mailto:${state.listOfGeneralData.firstWhere((element) => element.key == 'email').value!}subject= &body= ");
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.message,
                                size: 30,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                state.listOfGeneralData
                                    .firstWhere(
                                        (element) => element.key == 'email')
                                    .value!,
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        InkWell(
                          onTap: () {
                            AppFunc.launchUrlFun(
                                'tel:${state.listOfGeneralData.firstWhere((element) => element.key == 'phone').value!}');
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.phone,
                                size: 30,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                state.listOfGeneralData
                                    .firstWhere(
                                        (element) => element.key == 'phone')
                                    .value!,
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        InkWell(
                          onTap: () {
                            AppFunc.launchUrlFun(
                                'whatsapp://send?phone=${state.listOfGeneralData.firstWhere((element) => element.key == 'whatsApp').value!}');
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.phone,
                                size: 30,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                state.listOfGeneralData
                                    .firstWhere(
                                        (element) => element.key == 'whatsApp')
                                    .value!,
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InputFormField(
                hint: 'الاسم',
                textColor: AppColors.primaryColor,
                controller: cubit.nameController,
                maxLines: 1,
                validator: (value) => Validator.name(value),
                fillColor: Colors.white,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              InputFormField(
                hint: 'البريد الالكتروني',
                textColor: AppColors.primaryColor,
                controller: cubit.emailController,
                maxLines: 1,
                validator: (value) => Validator.email(value),
                fillColor: Colors.white,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              InputFormField(
                hint: 'رقم الهاتف',
                textColor: AppColors.primaryColor,
                controller: cubit.phoneController,
                maxLines: 1,
                validator: (value) => Validator.phoneNumber(value),
                fillColor: Colors.white,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              InputFormField(
                hint: 'نص الرساله',
                textColor: AppColors.primaryColor,
                controller: cubit.msgController,
                maxLines: 1,
                validator: (value) => Validator.notes(value),
                fillColor: Colors.white,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomButton(
                  fontSize: 14.sp,
                  text: 'ارسال',
                  onPress: cubit.contactUs,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
