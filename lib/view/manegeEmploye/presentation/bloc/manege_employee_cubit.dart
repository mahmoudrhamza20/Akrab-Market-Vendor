import 'dart:developer';

import 'package:akrab_market_vendor/core/router/router.dart';
import 'package:akrab_market_vendor/view/manegeEmploye/data/models/get_employees_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../widgets/snack_bar.dart';
import '../../data/repositories/manege_employee_repo.dart';
part 'manege_employee_state.dart';

class ManegeEmployeeCubit extends Cubit<ManegeEmployeeState> {
  ManegeEmployeeCubit() : super(ManegeEmployeeInitial());

  static ManegeEmployeeCubit of(context) => BlocProvider.of(context);
  final manegeEmployeeRepo = ManegeEmployeeRepo();
  late List<GetEmployeesData?> getEmployeesData;

  Future getEmployees() async {
    emit(ManegeEmployeeDetailsLoading());
    final res = await manegeEmployeeRepo.getEmployees();
    res.fold(
      (err) {
        showSnackBar(err);
        emit(ManegeEmployeeInitial());
      },
      (res) async {
        getEmployeesData = res.data;

        emit(ManegeEmployeeDetailsLoaded());
      },
    );
  }

  //Delete employee
  Future deleteEmployees({required int userId}) async {
    emit(DeleteLoadeing());
    final res = await manegeEmployeeRepo.deleteEmployees(userId: userId);
    res.fold(
      (err) {
        showSnackBar(err);
        emit(ManegeEmployeeInitial());
      },
      (res) async {
        showSnackBar('تم الحذف بنجاح');
        MagicRouter.pop();
        getEmployees();
        emit(DeleteLoaded());
      },
    );
  }

//Edit Employee
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  XFile? photo;
  int provianceID = 0, cityID = 0, areaID = 0, storeId = 50;

  Future editEmployee({required int userId}) async {
    emit(EditLoadeing());
    final res = await manegeEmployeeRepo.editEmployee(
      userId: userId,
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
      provianceID: provianceID,
      cityID: cityID,
      areaID: areaID,
      photo: '',
    );

    res.fold(
      (err) {
        showSnackBar(err);
        log(err);
        emit(ManegeEmployeeInitial());
      },
      (res) async {
        showSnackBar('تمت التعديل بنجاح');
        MagicRouter.pop();
        emit(EditLoaded());
      },
    );
  }
}
