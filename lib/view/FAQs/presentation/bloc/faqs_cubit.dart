import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/snack_bar.dart';
import '../../data/models/faqs_model.dart';
import '../../data/repositories/faqs_repo.dart';

part 'faqs_state.dart';

class FaqsCubit extends Cubit<FaqsState> {
  FaqsCubit() : super(FaqsInitial());

  final faqsRepo = FAQsRepo();

  static FaqsCubit of(context) => BlocProvider.of(context);

  List<FAQsData> listOfFAQsData = [];

  Future getFAQs() async {
    emit(FaqsLoading());
    final res = await faqsRepo.getFAQs();
    res.fold(
      (err) {
        showSnackBar(err);
        emit(FaqsInitial());
      },
      (res) async {
        listOfFAQsData = res.data!;
        emit(FaqsInitial());
      },
    );
  }
}
