import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/general_data_model.dart';
import '../../../../widgets/snack_bar.dart';
import '../../data/repositories/general_data_repo.dart';
part 'general_data_state.dart';

class GeneralDataCubit extends Cubit<GeneralDataState> {
  GeneralDataCubit() : super(GeneralDataInitial());

  final generalDataRepo = GeneralDataRepo();

  static GeneralDataCubit of(context) => BlocProvider.of(context);
  List<GeneralDataData> listOfGeneralData = [];

  Future generalData() async {
    final res = await generalDataRepo.generalData();
    res.fold(
      (err) {
        showSnackBar(err);
        emit(GeneralDataInitial());
      },
      (res) async {
        listOfGeneralData.clear();
        listOfGeneralData.addAll(res.data!);
        emit(GeneralDataLoaded(res.data!));
      },
    );
  }
}
