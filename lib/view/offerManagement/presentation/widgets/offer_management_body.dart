import 'package:flutter/material.dart';
import 'custom_offer_management_item.dart';

// ignore: must_be_immutable
class OfferManagementViewBody extends StatelessWidget {
  const OfferManagementViewBody({Key? key}) : super(key: key);

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
                'العروض المضافة',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    const CustomOfferManagementItem(),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 5)
          ],
        ),
      ),
    );
  }
}
