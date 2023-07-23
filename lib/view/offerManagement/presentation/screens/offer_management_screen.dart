import 'package:flutter/material.dart';
import '../widgets/offer_management_appbar.dart';
import '../widgets/offer_management_body.dart';

class OfferManagementView extends StatelessWidget {
  const OfferManagementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: OfferManagementAppBar(),
      body: OfferManagementViewBody(),
    );
  }
}
