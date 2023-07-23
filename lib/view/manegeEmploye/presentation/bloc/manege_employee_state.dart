part of 'manege_employee_cubit.dart';

abstract class ManegeEmployeeState {}

class ManegeEmployeeInitial extends ManegeEmployeeState {}

class ManegeEmployeeDetailsLoading extends ManegeEmployeeState {}

class ManegeEmployeeDetailsLoaded extends ManegeEmployeeState {}

class DeleteLoaded extends ManegeEmployeeState {}

class DeleteLoadeing extends ManegeEmployeeState {}

class EditLoadeing extends ManegeEmployeeState {}

class EditLoaded extends ManegeEmployeeState {}
