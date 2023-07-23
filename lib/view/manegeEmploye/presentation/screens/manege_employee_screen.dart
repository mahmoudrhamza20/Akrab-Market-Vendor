import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/manege_employee_cubit.dart';
import '../widgets/manege_employee_appbar.dart';
import '../widgets/manege_employee_body.dart';

class ManegeEmployeeView extends StatelessWidget {
  const ManegeEmployeeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManegeEmployeeCubit()..getEmployees(),
      child: Scaffold(
        appBar: const ManegeEmployeeAppBar(),
        body: BlocBuilder<ManegeEmployeeCubit, ManegeEmployeeState>(
          builder: (context, state) {
            return const ManegeEmployeeViewwBody();
          },
        ),
      ),
    );
  }
}
