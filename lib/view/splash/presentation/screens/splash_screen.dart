import 'dart:async';
import 'dart:developer';
import 'package:akrab_market_vendor/core/cacheHelper/cache_helper.dart';
import 'package:akrab_market_vendor/view/home/presentation/screens/home_screen.dart';
import 'package:akrab_market_vendor/view/login/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/router/router.dart';
import '../widgets/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _splashTimer() {
    Timer(const Duration(seconds: 5), () {
      if (CacheHelper.getData(key: 'login') == true) {
        MagicRouter.navigateAndPopAll(const HomeView());
        log('${CacheHelper.getData(key: 'login')}');
      } else {
        MagicRouter.navigateAndPopAll(const LoginView());
      }
    });
  }

  @override
  void initState() {
    _splashTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
