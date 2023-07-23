import 'package:akrab_market_vendor/view/newOffer/presentation/screens/new_offer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/router/router.dart';

class OfferManagementAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const OfferManagementAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: [
        InkWell(
          onTap: () {
            MagicRouter.navigateTo(const NewOfferView());
          },
          child: Container(
              height: 50,
              width: 40,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  shape: BoxShape.rectangle),
              child: const Center(child: Icon(Icons.add))),
        )
      ],
      title: Text(
        'إدارة العروض',
        style: TextStyle(
          fontSize: 17.sp,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
