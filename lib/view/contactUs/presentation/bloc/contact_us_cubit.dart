import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/router/router.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../data/repositories/contact_us_repo.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());

  final contactUsRepo = ContactUsRepo();

  static ContactUsCubit of(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final whatsappController = TextEditingController();
  final msgController = TextEditingController();
  final emailController = TextEditingController();

  Future contactUs() async {
    if (!formKey.currentState!.validate()) {}
    formKey.currentState!.save();
    emit(ContactUsLoading());
    final res = await contactUsRepo.contactUs(
      email: emailController.text,
      name: nameController.text,
      phone: phoneController.text,
      msg: msgController.text,
    );
    res.fold(
      (err) {
        showSnackBar(err);
        emit(ContactUsInitial());
      },
      (res) async {
        emit(ContactUsInitial());
        showSnackBar(res);
        MagicRouter.navigateAndPopAll(const HomeView());
      },
    );
  }
}
