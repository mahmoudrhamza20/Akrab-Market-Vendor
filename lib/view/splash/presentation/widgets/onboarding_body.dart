// import 'package:akrab_market/core/router/router.dart';
// import 'package:akrab_market/core/utils/app_colors.dart';
// import 'package:akrab_market/view/home/presentation/screens/home_screen.dart';
// import 'package:akrab_market/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../core/utils/app_assets.dart';

// class OnboardingBody extends StatelessWidget {
//   const OnboardingBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Image.asset(
//           AppAssets.background,
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           fit: BoxFit.cover,
//         ),
//         Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 AppAssets.logo,
//                 width: MediaQuery.of(context).size.width * 0.4,
//                 height: MediaQuery.of(context).size.height * 0.2,
//               ),
//               Text(
//                 'اكتشف اقرب ماركت اليك في منطقتك \n وتسوق بسهوله',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18.sp,
//                 ),
//               ),
//               Image.asset(
//                 AppAssets.map_icon,
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 height: MediaQuery.of(context).size.height * 0.2,
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.05,
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.6,
//                 child: CustomButton(
//                   text: 'التالي',
//                   fontSize: 12.sp,
//                   buttonColor: Colors.white,
//                   fontColor: AppColors.primaryColor,
//                   onPress: () {
//                     MagicRouter.navigateAndPopAll(const HomeScreen());
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
