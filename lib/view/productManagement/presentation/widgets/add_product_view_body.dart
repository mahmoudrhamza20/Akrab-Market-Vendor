import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../widgets/custom_button.dart';
import '../../../search/presentation/bloc/search_cubit.dart';
import 'custom_choose_section_dropdown.dart';

// ignore: must_be_immutable
class AddProductViewBody extends StatelessWidget {
  const AddProductViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = SearchCubit.of(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Column(
          children: [
            ChooseSectionDropdown(
              selectedItemGovernorate: 0,
              selectedItemCity: 0,
              //selectedItemArea: 0,
              governorateFun: (value) {
                cubit.gid = value.id!;
              },
              citieFun: (value) {
                cubit.cid = value.id!;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'المنتجات بالقسم',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => const CustomAddProductItem(),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 5),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
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

class CustomAddProductItem extends StatelessWidget {
  const CustomAddProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 2),
                shape: BoxShape.rectangle),
            child: Center(
              child: Image.asset(AppAssets.imageProduct),
            )),
        Container(
          height: 80,
          width: 100,
          alignment: Alignment.topCenter,
          child: const Text(
            maxLines: 2,
            'إزازة زيت عافية',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }
}
