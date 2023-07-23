import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../widgets/custom_button.dart';
import 'custom_edit_product_quantity_row.dart';

// ignore: must_be_immutable
class ProductEditViewBody extends StatelessWidget {
  const ProductEditViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Column(
          children: [
            const Center(
              child: Text(
                'بيانات المنتج المتاحة',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Container(
                    height: 80,
                    width: 80,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey.shade300, width: 2),
                        shape: BoxShape.rectangle),
                    child: Center(
                      child: Image.asset(AppAssets.imageProduct),
                    )),
                const Text(
                  maxLines: 2,
                  'إزازة زيت عافية',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            const Divider(
              endIndent: 10,
              indent: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'الحجم',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text(
                      'الكمية المتوفرة',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '(بالأرقام)',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'سعر البيع',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '( بالأرقام والأعشار)',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomEditProductQuantityRow(
              text: '1 لتر',
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomEditProductQuantityRow(
              text: '3 لتر',
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomEditProductQuantityRow(
              text: '5 لتر',
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .3),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomButton(
                  fontSize: 14.sp, text: 'حفظ البيانات', onPress: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
