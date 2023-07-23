import 'package:akrab_market_vendor/core/cacheHelper/cache_helper.dart';
import 'package:akrab_market_vendor/view/manegeEmploye/presentation/screens/manege_employee_screen.dart';
import 'package:akrab_market_vendor/view/offerManagement/presentation/screens/offer_management_screen.dart';
import 'package:akrab_market_vendor/view/orders/presentation/screens/orders_screen.dart';
import 'package:akrab_market_vendor/view/productManagement/presentation/screens/product_management_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/router/router.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_func.dart';
import '../../../../core/utils/end_points.dart';
import '../../../../widgets/item_drawer.dart';
import '../../../FAQs/presentation/screens/faqs_screen.dart';
import '../../../aboutApp/presentation/screens/about_app_screen.dart';
import '../../../contactUs/presentation/screens/contact_us_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../../settingsAndStatistics/presentation/screens/settings_and_statistics_screen.dart';
import '../../../storeInfo/presentation/bloc/cubit/get_store_data_cubit.dart';
import '../../../storeInfo/presentation/screens/store_info_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.image,
    required this.storename,
    required this.ownerId,
  });
  final String image;
  final String storename;
  final String ownerId;
  @override
  Widget build(BuildContext context) {
    final cubit = GetStoreDataCubit.of(context);
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.77,
      child: SingleChildScrollView(
        child: BlocBuilder<GetStoreDataCubit, GetStoreDataState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  height: 200.w,
                  decoration:
                      const BoxDecoration(color: AppColors.primaryColor),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 35.w),
                    child: Column(children: [
                      Row(
                        children: [
                          Container(
                            height: 85.w,
                            width: 85.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: cubit.storeData!.photo == null
                                  ? const DecorationImage(
                                      image: AssetImage(
                                        AppAssets.homeAvatar,
                                      ),
                                    )
                                  : DecorationImage(
                                      image: NetworkImage(image),
                                      fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  storename,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'الرقم التعريفي:  $ownerId',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  'اسم المستخدم هنا',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () => CacheHelper.clear(),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.logout_outlined,
                              size: 22,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'تسجيل الخروج',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                Column(
                  children: [
                    ItemDrawer(
                      text: 'إعدادات وإحصائيات',
                      icon: Icons.home,
                      ontap: () {
                        MagicRouter.navigateTo(
                            const SettingsAndStatisticsView());
                      },
                    ),
                    ItemDrawer(
                      text: ' ملفى الشخصى',
                      icon: Icons.credit_card,
                      ontap: () {
                        MagicRouter.navigateTo(const ProfileView());
                      },
                    ),
                    ItemDrawer(
                      text: 'بيانات المتجر',
                      icon: Icons.local_grocery_store_outlined,
                      ontap: () {
                        MagicRouter.navigateTo(const StoreInfoView());
                      },
                    ),
                    ItemDrawer(
                      text: 'حافظة الطلبات',
                      icon: Icons.store,
                      ontap: () {
                        MagicRouter.navigateTo(const OrdersView());
                      },
                    ),
                    ItemDrawer(
                      text: 'إدارة الموظفين',
                      icon: Icons.favorite,
                      ontap: () {
                        MagicRouter.navigateTo(const ManegeEmployeeView());
                      },
                    ),
                    ItemDrawer(
                      text: 'إدارة المنتجات',
                      icon: Icons.manage_accounts,
                      ontap: () {
                        MagicRouter.navigateTo(const ProductManagementView());
                      },
                    ),
                    ItemDrawer(
                      text: 'إدارة العروض',
                      icon: Icons.discount,
                      ontap: () {
                        MagicRouter.navigateTo(const OfferManagementView());
                      },
                    ),
                    ItemDrawer(
                      text: 'عن التطبيق',
                      icon: Icons.info,
                      ontap: () {
                        MagicRouter.navigateTo(const AboutAppView());
                      },
                    ),
                    ItemDrawer(
                      text: 'الدعم',
                      icon: Icons.help_center,
                      ontap: () {
                        MagicRouter.navigateTo(const FAQsView());
                      },
                    ),
                    ItemDrawer(
                      text: 'اتصل بنا',
                      icon: Icons.message,
                      ontap: () {
                        MagicRouter.navigateTo(const ContactUsView());
                      },
                    ),
                    ItemDrawer(
                      text: 'قيم التطبيق',
                      icon: Icons.star,
                      ontap: () =>
                          AppFunc.launchUrlFun(EndPoints.appUrlPlaystore),
                    ),
                    const Divider(
                        color: Colors.grey, indent: 50, endIndent: 50),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: const Text(
                        'جميع الحقوق محفوظه لموقع و تطبيق اقرب ماركت كافه البيانات المعلن عنها مسئوليه المعلن فقط',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
