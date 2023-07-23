part of 'new_employee_cubit.dart';

@immutable
abstract class NewEmployeeState {}

class NewEmployeeInitial extends NewEmployeeState {}

class NewEmployeeLoading extends NewEmployeeState {}

class NewEmployeeLoaded extends NewEmployeeState {}

//class EditNewEmployeeLoading extends NewEmployeeState {}
