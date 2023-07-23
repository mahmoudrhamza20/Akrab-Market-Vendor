part of 'general_data_cubit.dart';

abstract class GeneralDataState {}

class GeneralDataInitial extends GeneralDataState {}

class GeneralDataLoaded extends GeneralDataState {
  final List<GeneralDataData> listOfGeneralData;

  GeneralDataLoaded(this.listOfGeneralData);
}
