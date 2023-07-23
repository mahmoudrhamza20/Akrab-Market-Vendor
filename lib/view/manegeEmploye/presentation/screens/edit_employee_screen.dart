import 'package:akrab_market_vendor/view/manegeEmploye/presentation/bloc/manege_employee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/edit_employee_appbar.dart';
import '../widgets/edit_employee_body.dart';

class EditEmployeeView extends StatelessWidget {
  const EditEmployeeView({Key? key, required this.userId}) : super(key: key);
  final int userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManegeEmployeeCubit(),
      child: Scaffold(
        appBar: const EditEmployeeAppBar(),
        body: BlocBuilder<ManegeEmployeeCubit, ManegeEmployeeState>(
          builder: (context, state) {
            return EditEmployeeViewBody(
              userId: userId,
            );
          },
        ),
      ),
    );
  }
}
