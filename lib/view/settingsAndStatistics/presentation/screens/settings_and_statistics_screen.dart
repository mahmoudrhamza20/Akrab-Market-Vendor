import 'package:flutter/material.dart';
import '../widgets/settings_and_statistics_appbar.dart';
import '../widgets/settings_and_statistics_body.dart';

class SettingsAndStatisticsView extends StatelessWidget {
  const SettingsAndStatisticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SettingsAndStatisticsAppBar(),
      body: SettingsAndStatisticsViewBody(),
    );
  }
}
