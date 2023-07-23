import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/snack_bar.dart';
import '../../data/models/order_details_model.dart';
import '../../data/repositories/orders_repo.dart';
part 'Orders_state.dart';

class OrderDataCubit extends Cubit<OrdersState> {
  OrderDataCubit() : super(OrdersInitial());

  static OrderDataCubit of(context) => BlocProvider.of(context);
  final ordersDataRepo = OrdersDataRepo();
  OrderData? orderData;
  late List<OrderItem?> orderItem;

  Future getOrderData() async {
    emit(OrdersLoading());
    final res = await ordersDataRepo.getOrderData();
    res.fold(
      (err) {
        showSnackBar(err);
        log(err);
        emit(OrdersInitial());
      },
      (res) async {
        orderData = res.data;
        orderItem = res.items;
        emit(OrdersLoaded());
      },
    );
  }

//Accept Order
  Future acceptOrder() async {
    emit(AcceptOrderLoadeing());
    final res = await ordersDataRepo.acceptOrder();
    res.fold(
      (err) {
        showSnackBar(err);
        log(err);
        emit(OrdersInitial());
      },
      (res) async {
        log(res.status);
        showSnackBar(res.data);
        emit(AcceptOrderLoaded());
      },
    );
  }

  //Refuse Order
  Future refuseOrder({required String comment}) async {
    emit(RefuseOrderLoadeing());
    final res = await ordersDataRepo.refuseOrder(comment: comment);
    res.fold(
      (err) {
        showSnackBar(err);
        log(err);
        emit(OrdersInitial());
      },
      (res) async {
        showSnackBar(res.data);
        emit(RefuseOrderLoaded());
      },
    );
  }
}
