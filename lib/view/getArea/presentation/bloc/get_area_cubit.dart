import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/snack_bar.dart';
import '../../data/models/get_area_model.dart';
import '../../data/repositories/get_area_repo.dart';
part 'get_area_state.dart';

class GetAreaCubit extends Cubit<GetAreaState> {
  GetAreaCubit() : super(GetAreaInitial());

  final getAreaRepo = GetAreaRepo();

  static GetAreaCubit of(context) => BlocProvider.of(context);

  List<Cities> listOfCities = [];

  List<Areas> listOfAreas = [];
  // List<Areas> storeType = [];

  Future getArea() async {
    emit(GetAreaLoading());
    final res = await getAreaRepo.getArea();
    res.fold(
      (err) {
        showSnackBar(err);
        log(err.toString());
        emit(GetAreaInitial());
      },
      (res) async {
        emit(GetAreaLoaded(res));
      },
    );
  }
}
