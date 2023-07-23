import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/new_employee_cubit.dart';
import '../widgets/new_employee_appbar.dart';
import '../widgets/new_employee_body.dart';

class NewEmployeeView extends StatelessWidget {
  const NewEmployeeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewEmployeeCubit(),
      child: Scaffold(
        appBar: const NewEmployeeAppBar(),
        body: BlocBuilder<NewEmployeeCubit, NewEmployeeState>(
          builder: (context, state) {
            return NewEmployeeViewBody();
          },
        ),
      ),
    );
  }
}
