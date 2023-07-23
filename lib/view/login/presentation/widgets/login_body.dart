import 'package:akrab_market_vendor/core/router/router.dart';
import 'package:akrab_market_vendor/core/utils/app_assets.dart';
import 'package:akrab_market_vendor/view/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/cacheHelper/cache_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/validator/validator.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_input_field.dart';
import '../../../../widgets/loading_indicator.dart';
import '../bloc/login_cubit.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = LoginCubit.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Form(
          key: cubit.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.logo,
                width: 200,
                color: AppColors.primaryColor,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              CustomTextField(
                labelText: 'البريد الالكتروني',
                inputType: TextInputType.emailAddress,
                controller: cubit.emailController,
                validator: (value) => Validator.email(value!),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              CustomTextField(
                labelText: 'كلمة المرور',
                inputType: TextInputType.visiblePassword,
                controller: cubit.passwordController,
                validator: (value) => Validator.password(value!),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return state is LoginLoading
                      ? const LoadingIndicator()
                      : SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CustomButton(
                            fontSize: 14.sp,
                            text: 'تسجيل الدخول',
                            // onPress: cubit.login,
                            onPress: () async {
                              if (cubit.formKey.currentState!.validate()) {
                                await CacheHelper.saveData(
                                    key: 'login', value: true);
                                MagicRouter.navigateAndPopAll(const HomeView());
                              }
                            },
                          ),
                        );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
