import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/new_offer_cubit.dart';
import '../widgets/new_offer_appbar.dart';
import '../widgets/new_offer_body.dart';

class NewOfferView extends StatelessWidget {
  const NewOfferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewOfferAppBar(),
      body: BlocProvider(
        create: (context) => NewOfferCubit(),
        child: const NewOfferViewBody(),
      ),
    );
  }
}
