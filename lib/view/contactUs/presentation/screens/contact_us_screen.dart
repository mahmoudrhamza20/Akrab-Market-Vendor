import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/contact_us_cubit.dart';
import '../widgets/contact_us_appbar.dart';
import '../widgets/contact_us_body.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsCubit(),
      child: const Scaffold(
        appBar: ContactUsAppBar(),
        body: ContactUsViewBody(),
      ),
    );
  }
}
