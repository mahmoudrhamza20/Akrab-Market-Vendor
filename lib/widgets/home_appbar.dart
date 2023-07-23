// import 'package:akrab_market/core/router/router.dart';
// import 'package:akrab_market/view/cart/presentation/screens/cart_order_screen.dart';
// import 'package:akrab_market/view/search/presentation/screens/location_for_search_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../view/notification/presentation/screens/notification_screen.dart';

// class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const HomeAppBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         child: InkWell(
//           onTap: () {
//             MagicRouter.navigateTo(const LocationForSearchScreen());
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(5),
//             ),
//             padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'ابحث عن اقرب ماركت',
//                   style: TextStyle(color: Colors.grey, fontSize: 13.sp),
//                 ),
//                 const Icon(
//                   Icons.search,
//                   color: Colors.blue,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       actions: [
//         IconButton(
//           icon: const Icon(Icons.shopping_cart),
//           onPressed: () {
//             MagicRouter.navigateTo(const CartOrderScreen());
//           },
//         ),
//         IconButton(
//           icon: const Icon(Icons.notifications),
//           onPressed: () {
//             MagicRouter.navigateTo(const NotificationScreen());
//           },
//         ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
