part of 'orders_cubit.dart';

abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersLoaded extends OrdersState {}

class AcceptOrderLoaded extends OrdersState {}

class AcceptOrderLoadeing extends OrdersState {}

class RefuseOrderLoaded extends OrdersState {}

class RefuseOrderLoadeing extends OrdersState {}
