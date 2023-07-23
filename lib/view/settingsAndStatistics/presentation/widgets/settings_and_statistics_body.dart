import 'package:akrab_market_vendor/core/utils/app_colors.dart';
import 'package:akrab_market_vendor/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class SettingsAndStatisticsViewBody extends StatefulWidget {
  const SettingsAndStatisticsViewBody({Key? key}) : super(key: key);

  @override
  State<SettingsAndStatisticsViewBody> createState() =>
      _SettingsAndStatisticsViewBodyState();
}

class _SettingsAndStatisticsViewBodyState
    extends State<SettingsAndStatisticsViewBody> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                ' بيانات أساسية',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextFieldandText(
                  text: 'ميعاد الفتح',
                ),
                CustomTextFieldandText(
                  text: 'ميعاد الإغلاق',
                ),
                CustomTextFieldandText(
                  text: 'متوسط رسوم التوصيل',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const CustomTextFieldandText(
                  text: 'الحد الأدنى للطلب',
                ),
                const SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'مفتوح',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomButton(
                  fontSize: 14.sp,
                  text: 'تحديث البيانات',
                  // onPress: () => cubit.editProfileDetails(),
                  onPress: () {}),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomStatisticsCard(
                  textNumber: '23',
                  firstText: 'رسائل',
                  secText: 'غير مقروءة',
                ),
                CustomStatisticsCard(
                  textNumber: '30',
                  firstText: 'إجمالى',
                  secText: 'رسائل',
                ),
                CustomStatisticsCard(
                  textNumber: '30',
                  firstText: 'إجمالى',
                  secText: 'الطلبات',
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomStatisticsCard(
                  textNumber: '10',
                  firstText: 'طلبات فى',
                  secText: 'إنتظار المراجعة',
                ),
                CustomStatisticsCard(
                  textNumber: '20',
                  firstText: 'طلبات تم',
                  secText: 'تنفيذها',
                ),
                CustomStatisticsCard(
                  textNumber: '0',
                  firstText: 'طلبات لم يتم',
                  secText: 'تنفيذها',
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () async {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                //cubit.photo = image!;
                // await cubit.editImageProfile();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: AppColors.primaryColor,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .15,
                child: const Column(
                  children: [
                    Text(
                      'مساحة إعلانية',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'ضع إعلانك هنا',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'سارع بالحجز',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomStatisticsCard extends StatelessWidget {
  const CustomStatisticsCard({
    super.key,
    required this.textNumber,
    required this.firstText,
    required this.secText,
  });
  final String textNumber;
  final String firstText;
  final String secText;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: Colors.grey, width: 2),
            shape: BoxShape.rectangle),
        child: Center(
            child: Column(
          children: [
            Text(
              textNumber,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              firstText,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              secText,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w700),
            ),
          ],
        )));
  }
}

class CustomTextFieldandText extends StatelessWidget {
  const CustomTextFieldandText({
    super.key,
    required this.text,
    this.controller,
    this.validator,
  });

  final String text;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
              color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w700),
        ),
        SizedBox(
            height: 35,
            width: 120,
            child: TextFormField(
                controller: controller,
                validator: validator,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.grey,
                  )),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.grey,
                  )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.grey,
                  )),
                )))
      ],
    );
  }
}
