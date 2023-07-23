import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/validator/validator.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_input_field.dart';
import '../../../getArea/presentation/screens/get_area_widget.dart';
import '../../../search/presentation/bloc/search_cubit.dart';
import '../bloc/profile_cubit.dart';

// ignore: must_be_immutable
class ProfileViewBody extends StatelessWidget {
  ProfileViewBody({Key? key}) : super(key: key);
  String? password;

  @override
  Widget build(BuildContext context) {
    final cubit = ProfileCubit.of(context);
    final cubitTest = SearchCubit.of(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: MediaQuery.of(context).size.height * 0.13,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey, width: 1),
                            image: const DecorationImage(
                              image: AssetImage(AppAssets.homeAvatar),
                              fit: BoxFit.fill,
                            )

                            // image: cubit.photo == null
                            //     ? cubit.userData!.photo == null
                            //         ? const DecorationImage(
                            //             image: AssetImage(AppAssets.avater_icon),
                            //             fit: BoxFit.fill,
                            //           )
                            //         : DecorationImage(
                            //             image:
                            //                 NetworkImage(cubit.userData!.photo!),
                            //             fit: BoxFit.fill,
                            //           )
                            //     : DecorationImage(
                            //         image: FileImage(File(cubit.photo!.path)),
                            //         fit: BoxFit.fill,
                            //       ),
                            ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      TextButton(
                        child: Text(
                          'تغيير الصوره الشخصيه',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        onPressed: () async {
                          final image = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          //cubit.photo = image!;
                          // await cubit.editImageProfile();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomTextField(
              labelText: 'الاسم',
              inputType: TextInputType.name,
              controller: cubit.nameController,
              validator: (value) => Validator.name(value!),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            CustomTextField(
              labelText: ' البريد الالكتروني',
              inputType: TextInputType.emailAddress,
              controller: cubit.emailController,
              validator: (value) => Validator.email(value!),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            CustomTextField(
              labelText: ' رقم الهاتف ',
              inputType: TextInputType.number,
              controller: cubit.phoneController,
              validator: (value) => Validator.phoneNumber(value!),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            CustomTextField(
              labelText: ' كلمة المرور',
              inputType: TextInputType.text,
              controller: cubit.passwordController,
              validator: (value) => Validator.password(value!),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            CustomTextField(
              labelText: ' تاكيد كلمة المرور',
              inputType: TextInputType.text,
              controller: cubit.passwordConfirmationController,
              validator: (value) =>
                  Validator.confirmPassword(value!, password!),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            GetAreaWidget(
              isProfile: true,
              selectedItemGovernorate: 0,
              selectedItemCity: 0,
              selectedItemArea: 0,
              governorateFun: (value) {
                cubitTest.gid = value.id!;
              },
              citieFun: (value) {
                cubitTest.cid = value.id!;
              },
              areaFun: (value) {
                cubitTest.aid = value.id!;
              },
            ),
            // GetAreaWidget(
            //   selectedItemGovernorate: cubit.userData!.provianceID != null
            //       ? cubit.userData!.provianceID!.id!
            //       : 0,
            //   selectedItemCity: cubit.userData!.cityID != null
            //       ? cubit.userData!.cityID!.id!
            //       : 0,
            //   selectedItemArea: cubit.userData!.areaID != null
            //       ? cubit.userData!.areaID!.id!
            //       : 0,
            //   governorateFun: (value) => cubit.provianceID = value.id!,
            //   citieFun: (value) => cubit.cityID = value.id!,
            //   areaFun: (value) => cubit.areaID = value.id!,
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomButton(
                  fontSize: 14.sp,
                  text: 'تعديل البيانات',
                  // onPress: () => cubit.editProfileDetails(),
                  onPress: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
