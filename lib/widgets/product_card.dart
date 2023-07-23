// import 'package:akrab_market/core/router/router.dart';
// import 'package:akrab_market/view/productDetails/presentation/screens/product_details_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../core/models/product_details_model.dart';
// import '../core/utils/app_colors.dart';
// import '../view/cart/presentation/bloc/cart_cubit.dart';

// class ProductCard extends StatefulWidget {
//   const ProductCard({Key? key, required this.getData}) : super(key: key);

//   final ProductDetailsModel getData;

//   @override
//   State<ProductCard> createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   int quantity = 0;
//   double selectedPrice = 0;
//   double selectedOffer = 0;

//   @override
//   Widget build(BuildContext context) {
//     final cubitCart = CartCubit.of(context);
//     return InkWell(
//       onTap: () {
//         cubitCart.productDetailsModel = widget.getData;
//         cubitCart.selectedPrice = double.parse(widget.getData.defaultSize!.price!);
//         MagicRouter.navigateTo(const ProductDetailsScreen());
//       },
//       child: SizedBox(
//         width: MediaQuery.of(context).size.width * 0.45,
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 Image.network(
//                   widget.getData.photo!,
//                   width: MediaQuery.of(context).size.width * 0.45,
//                   height: MediaQuery.of(context).size.height * 0.21,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 1),
//                   child: Column(
//                     children: [
//                       Text(
//                         widget.getData.name!,
//                         maxLines: 1,
//                         style: TextStyle(
//                           fontSize: 15.sp,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             flex: 3,
//                             child: Text(
//                               widget.getData.defaultSize!.size!,
//                               maxLines: 1,
//                               style: const TextStyle(
//                                 color: Colors.black54,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.01,
//                           ),
//                           BlocBuilder<CartCubit, CartState>(
//                             buildWhen: (previous, current) =>
//                                 current is IncreaseQuantity ||
//                                 current is DecreaseQuantity,
//                             builder: (context, state) {
//                               return Expanded(
//                                 flex: 5,
//                                 child: Text(
//                                   "${selectedPrice == 0 ? double.parse(widget.getData.defaultSize!.price!) : selectedPrice} جنيه",
//                                   style: const TextStyle(
//                                     color: Colors.red,
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.005,
//                           ),
//                           widget.getData.defaultSize!.offer == null ||
//                                   widget.getData.defaultSize!.offer ==
//                                       widget.getData.defaultSize!.price ||
//                                   widget.getData.defaultSize!.offer!.isEmpty
//                               ? const SizedBox()
//                               : Expanded(
//                                   flex: 5,
//                                   child: Text(
//                                     '${widget.getData.defaultSize!.offer}جنيه',
//                                     style: const TextStyle(
//                                       color: Colors.grey,
//                                       decoration: TextDecoration.lineThrough,
//                                     ),
//                                   ),
//                                 ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.05,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: AppColors.primaryColor, width: 2),
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 4,
//                         child: Container(
//                           color: Colors.white,
//                           // padding: const EdgeInsets.symmetric(vertical: 5),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   setState(() {
//                                     quantity++;
//                                     selectedPrice = double.parse(widget
//                                             .getData.defaultSize!.price!) *
//                                         quantity;
//                                     widget.getData.defaultSize!.offer!.isEmpty
//                                         ? null
//                                         : selectedOffer = double.parse(widget
//                                         .getData.defaultSize!.offer!) *
//                                         quantity;
//                                   });
//                                 },
//                                 child: Container(
//                                   height: MediaQuery.of(context).size.height * 0.022,
//                                   width: MediaQuery.of(context).size.height * 0.022,
//                                   decoration: const BoxDecoration(
//                                     color: AppColors.primaryColor,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: const Center(
//                                     child: Icon(
//                                       Icons.add,
//                                       color: Colors.white,
//                                       size: 10,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 quantity.toString(),
//                                 style: TextStyle(
//                                     color: Colors.black, fontSize: 15.sp),
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   setState(() {
//                                     if (quantity > 1) {
//                                       selectedPrice = double.parse(widget
//                                               .getData.defaultSize!.price!) *
//                                           quantity;
//                                       widget.getData.defaultSize!.offer!.isEmpty
//                                           ? null
//                                           : selectedOffer = double.parse(widget
//                                           .getData.defaultSize!.offer!) *
//                                           quantity;
//                                       quantity--;
//                                     }
//                                     selectedPrice = double.parse(widget
//                                             .getData.defaultSize!.price!) *
//                                         quantity;
//                                     widget.getData.defaultSize!.offer!.isEmpty
//                                         ? null
//                                         : selectedOffer = double.parse(widget
//                                                 .getData.defaultSize!.offer!) *
//                                             quantity;
//                                   });
//                                 },
//                                 child: Container(
//                                   height: MediaQuery.of(context).size.height * 0.022,
//                                   width: MediaQuery.of(context).size.height * 0.022,
//                                   decoration: const BoxDecoration(
//                                     color: AppColors.primaryColor,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: const Center(
//                                     child: Icon(
//                                       Icons.remove,
//                                       color: Colors.white,
//                                       size: 10,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 2,
//                         child: InkWell(
//                           onTap: () {
//                             cubitCart.addToCart(
//                               widget.getData.marketProductId!,
//                               quantity,
//                               widget.getData.defaultSize!.size!,
//                               widget.getData.defaultSize!.offer == null ||
//                                       widget.getData.defaultSize!.offer ==
//                                           widget.getData.defaultSize!.price ||
//                                       widget.getData.defaultSize!.offer!.isEmpty
//                                   ? selectedPrice == 0
//                                       ? double.parse(widget
//                                               .getData.defaultSize!.price!) *
//                                           quantity
//                                       : selectedPrice
//                                   : selectedOffer == 0
//                                       ? double.parse(widget
//                                               .getData.defaultSize!.offer!) *
//                                           quantity
//                                       : selectedOffer,
//                             );
//                           },
//                           child: Container(
//                             color: AppColors.primaryColor,
//                             height: MediaQuery.of(context).size.height * 0.05,
//                             // padding: EdgeInsets.symmetric(vertical: 13.sp),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: const [
//                                 Icon(
//                                   Icons.shopping_cart_rounded,
//                                   color: Colors.white,
//                                   size: 18,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             widget.getData.defaultSize!.offer == null ||
//                     widget.getData.defaultSize!.offer ==
//                         widget.getData.defaultSize!.price ||
//                     widget.getData.defaultSize!.offer!.isEmpty
//                 ? const SizedBox()
//                 : Positioned(
//                     left: 0,
//                     top: 10,
//                     child: Container(
//                       height: MediaQuery.of(context).size.height * 0.035,
//                       width: MediaQuery.of(context).size.width * 0.2,
//                       decoration: BoxDecoration(
//                         color: Colors.red.withOpacity(0.9),
//                         borderRadius: const BorderRadius.only(
//                           topRight: Radius.circular(7),
//                           bottomRight: Radius.circular(7),
//                         ),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           'خصم ١٠٪',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }
