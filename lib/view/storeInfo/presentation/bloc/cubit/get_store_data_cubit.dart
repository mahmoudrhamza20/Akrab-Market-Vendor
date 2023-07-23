import 'dart:developer';

import 'package:akrab_market_vendor/view/storeInfo/data/models/store_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../widgets/snack_bar.dart';
import '../../../data/repositories/get_store_data_repo.dart';

part 'get_store_data_state.dart';

class GetStoreDataCubit extends Cubit<GetStoreDataState> {
  GetStoreDataCubit() : super(GetStoreDataInitial());

  static GetStoreDataCubit of(context) => BlocProvider.of(context);

  final nameController = TextEditingController();
  final whatsUpController = TextEditingController();
  final phoneController = TextEditingController();
  final locationDescriptionController = TextEditingController();
  final storeType = TextEditingController();
  XFile? photo;

  final getStoreDataRepo = GetStoreDataRepo();
  StoreData? storeData;

  Future getStoreData() async {
    emit(GetStoreDataLoadeing());
    final res = await getStoreDataRepo.getStoreData();
    res.fold(
      (err) {
        showSnackBar(err);
        log(err);
        emit(GetStoreDataInitial());
      },
      (res) async {
        storeData = res.data;
        nameController.text = res.data.name;
        phoneController.text = res.data.phone ?? 'لا يوجد';
        whatsUpController.text = res.data.whatsapp ?? 'لا يوجد';
        locationDescriptionController.text =
            res.data.locationDescription ?? 'لا يوجد';
        storeType.text = res.data.des ?? 'لا يوجد';
        emit(GetStoreDataLoaded());
      },
    );
  }
}
