part of 'get_area_cubit.dart';

abstract class GetAreaState {}

class GetAreaInitial extends GetAreaState {}

class GetAreaLoading extends GetAreaState {}

class GetAreaLoaded extends GetAreaState {
  final GetAreaModel model;

  GetAreaLoaded(this.model);
}
