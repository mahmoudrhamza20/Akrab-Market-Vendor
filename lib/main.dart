import 'package:akrab_market_vendor/view/generalData/presentation/bloc/general_data_cubit.dart';
import 'package:akrab_market_vendor/view/orders/presentation/bloc/orders_cubit.dart';
import 'package:akrab_market_vendor/view/search/presentation/bloc/search_cubit.dart';
import 'package:akrab_market_vendor/view/splash/presentation/screens/splash_screen.dart';
import 'package:akrab_market_vendor/view/storeInfo/presentation/bloc/cubit/get_store_data_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/cacheHelper/cache_helper.dart';
import 'core/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GeneralDataCubit()..generalData(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
        BlocProvider(
          create: (context) => GetStoreDataCubit()..getStoreData(),
        ),
        BlocProvider(
          create: (context) => OrderDataCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            title: "تاجر أقرب ماركت",
            theme: ThemeData(
              fontFamily: 'Cairo',
            ),
            onGenerateRoute: onGenerateRoute,
            navigatorKey: navigatorKey,
            builder: (context, child) => Directionality(
              textDirection: TextDirection.rtl,
              child: child!,
            ),
          );
        },
      ),
    );
  }
}
