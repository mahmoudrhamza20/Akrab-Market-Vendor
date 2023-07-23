// import 'package:akrab_market/core/models/list_of_markets.dart';
// import 'package:akrab_market/view/reviews/presentation/screens/reviews_screen.dart';
// import 'package:akrab_market/view/search/presentation/bloc/search_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../core/router/router.dart';
// import '../view/search/presentation/screens/categories_of_markets_screen.dart';

// class MarketItem extends StatelessWidget {
//   const MarketItem({Key? key, required this.getData}) : super(key: key);

//   final ListOfMarketsData getData;

//   @override
//   Widget build(BuildContext context) {
//     final cubit = SearchCubit.of(context);
//     return InkWell(
//       onTap: () {
//         cubit.storeId = getData.id!;
//         MagicRouter.navigateTo(const CategoriesOfMarketsScreen());
//       },
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.network(getData.cover!),
//             ),
//             Positioned(
//               top: 5,
//               right: 15,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.55,
//                     padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
//                     decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.5),
//                         borderRadius: BorderRadius.circular(5)),
//                     child: Row(
//                       children: [
//                         Image.network(
//                           getData.photo!,
//                           width: MediaQuery.of(context).size.width * 0.15,
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.03,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               getData.name!,
//                               style: TextStyle(
//                                 fontSize: 12.sp,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               getData.category!.name!,
//                               style: TextStyle(
//                                 fontSize: 10.sp,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.01,
//                             ),
//                             Container(
//                               width: MediaQuery.of(context).size.width * 0.15,
//                               decoration: BoxDecoration(
//                                 color: getData.onOff == 'On'
//                                     ? Colors.green
//                                     : Colors.red,
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(
//                                   color: Colors.white,
//                                   width: 2,
//                                 ),
//                               ),
//                               alignment: Alignment.center,
//                               child: Text(
//                                 getData.onOff == 'On' ? 'مفتوح' : 'مغلق',
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.001,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       MagicRouter.navigateTo(ReviewsScreen(
//                         getListComments: getData.comments!,
//                         getDataMarket: getData,
//                       ));
//                     },
//                     child: RatingBarIndicator(
//                       rating:
//                           getData.rate == null ? 0.0 : getData.rate!.toDouble(),
//                       itemBuilder: (context, index) => const Icon(
//                         Icons.star,
//                         color: Colors.amber,
//                       ),
//                       itemCount: 5,
//                       itemSize: 18,
//                       direction: Axis.horizontal,
//                     ),
//                   ),
//                   Text(
//                     'مواعيد العمل من ${getData.workFrom} حتي ${getData.workTo} \nرسوم التوصيل ${getData.delevery == '0' ? 'مجانا' : '${getData.delevery} جنيه'}',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 12.sp,
//                       height: 1.4,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
