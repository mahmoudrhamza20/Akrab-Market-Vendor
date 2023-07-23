import 'package:flutter/material.dart';
import '../../../../core/utils/app_assets.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.background,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Image.asset(
              AppAssets.logo,
              width: 250,
              height: 250,
            ),
          ),
        ),
      ],
    );
  }
}
