import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/faqs_cubit.dart';
import '../widgets/faqs_appbar.dart';
import '../widgets/faqs_body.dart';

class FAQsView extends StatelessWidget {
  const FAQsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FaqsCubit()..getFAQs(),
      child: const Scaffold(
        appBar: FAQsAppBar(),
        body: FAQsViewBody(),
      ),
    );
  }
}
