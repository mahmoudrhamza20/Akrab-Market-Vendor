import 'package:akrab_market_vendor/core/router/router.dart';
import 'package:akrab_market_vendor/view/manegeEmploye/presentation/bloc/manege_employee_cubit.dart';
import 'package:akrab_market_vendor/view/manegeEmploye/presentation/screens/edit_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../widgets/delete_alert_dialog.dart';

// ignore: must_be_immutable
class ManegeEmployeeViewwBody extends StatelessWidget {
  const ManegeEmployeeViewwBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: BlocBuilder<ManegeEmployeeCubit, ManegeEmployeeState>(
          builder: (context, state) {
            final cubit = ManegeEmployeeCubit.of(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 60.w,
                      width: 60.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset(AppAssets.marketLogo),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'اسم السوبر ماركت',
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '3215',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Divider(),
                SizedBox(
                  height: 10.h,
                ),
                state is ManegeEmployeeDetailsLoading
                    ? const CircularProgressIndicator()
                    : cubit.getEmployeesData.isEmpty
                        ? const Center(
                            child: Text(
                              'لا يوجد موظفين',
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cubit.getEmployeesData.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: ManegeEmployeeListViweItem(
                                userId: cubit.getEmployeesData[index]!.userId,
                                name: cubit.getEmployeesData[index]!.userName,
                                photo: cubit.getEmployeesData[index]!.photo,
                                title: cubit.getEmployeesData[index]!.userTitle,
                                onPressed: () => cubit.deleteEmployees(
                                    userId:
                                        cubit.getEmployeesData[index]!.userId),
                              ),
                            ),
                          ),
                //const ManegeEmployeeListViweItem(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ManegeEmployeeListViweItem extends StatelessWidget {
  const ManegeEmployeeListViweItem({
    super.key,
    required this.name,
    required this.photo,
    required this.title,
    this.onPressed,
    required this.userId,
  });
  final String name;
  final String? photo;
  final String title;
  final VoidCallback? onPressed;
  final int userId;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60.w,
          width: 60.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: photo == null
              ? Image.asset(AppAssets.employee)
              : Image.network(photo!),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        CustomeEditButton(
            bgColor: const Color(0xff009fff),
            icon: Icons.edit,
            onTap: () =>
                MagicRouter.navigateTo(EditEmployeeView(userId: userId))),
        CustomeEditButton(
            bgColor: const Color(0xffff0000),
            icon: Icons.delete_outline,
            onTap: () {
              showAlertDialog(
                  onPressed: onPressed,
                  context: context,
                  title: const Text('حذف الموظف'),
                  body: const Text('هل أنت متأكد من أنك تريد حذف الموظف'));
            }),
      ],
    );
  }
}

class CustomeEditButton extends StatelessWidget {
  const CustomeEditButton({
    super.key,
    required this.bgColor,
    required this.icon,
    required this.onTap,
  });
  final Color bgColor;
  final IconData icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: Center(
              child: Icon(
            icon,
            color: Colors.white,
          ))),
    );
  }
}
