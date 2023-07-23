import 'package:akrab_market_vendor/view/newOffer/presentation/bloc/new_offer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/validator/validator.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_input_field.dart';

// ignore: must_be_immutable
class NewOfferViewBody extends StatelessWidget {
  const NewOfferViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = NewOfferCubit.of(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: BlocBuilder<NewOfferCubit, NewOfferState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
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
                          'إختر صوره للعرض',
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CustomTextField(
                  labelText: 'عنوان العرض',
                  inputType: TextInputType.text,
                  controller: cubit.offerNameController,
                  validator: (value) => Validator.name(value!),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                CustomTextField(
                  labelText: 'تاريخ إنتهاء العرض',
                  inputType: TextInputType.text,
                  controller: cubit.expDateController,
                  validator: (value) => Validator.email(value!),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                CustomTextField(
                  labelText: 'نسبة الخصم المتوقع',
                  inputType: TextInputType.number,
                  controller: cubit.offerDescController,
                  validator: (value) => Validator.phoneNumber(value!),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CustomButton(
                      fontSize: 14.sp,
                      text: 'حفظ العرض والذهاب لإضافة المنتجات',
                      // onPress: () => cubit.editProfileDetails(),
                      onPress: () {}),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
