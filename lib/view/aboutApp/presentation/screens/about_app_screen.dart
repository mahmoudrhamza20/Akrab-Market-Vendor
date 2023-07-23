import 'package:flutter/material.dart';
import '../widgets/about_app_appbar.dart';
import '../widgets/about_app_body.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AboutAppAppBar(),
      body: AboutAppViewBody(),
    );
  }
}
