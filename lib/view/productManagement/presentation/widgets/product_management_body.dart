import 'package:flutter/material.dart';
import '../../../search/presentation/bloc/search_cubit.dart';
import 'custom_choose_section_dropdown.dart';
import 'custom_product_management_item.dart';

// ignore: must_be_immutable
class ProductManagementViewBody extends StatelessWidget {
  const ProductManagementViewBody({Key? key}) : super(key: key);

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
                itemBuilder: (context, index) =>
                    const CustomProductManagementItem(),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 6)
          ],
        ),
      ),
    );
  }
}
