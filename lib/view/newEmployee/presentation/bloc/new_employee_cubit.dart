import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/router/router.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../data/models/add_employee_model.dart';
import '../../data/repositories/new_employee_repo.dart';

part 'new_employee_state.dart';

class NewEmployeeCubit extends Cubit<NewEmployeeState> {
  NewEmployeeCubit() : super(NewEmployeeInitial());

  static NewEmployeeCubit of(context) => BlocProvider.of(context);
  final newEmployeeRepo = NewEmployeeRepo();
  AddEmployeeModelData? addEmployeeModelData;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  XFile? photo;
  int provianceID = 0, cityID = 0, areaID = 0, storeId = 50;

  Future addNewEmployee() async {
    emit(NewEmployeeLoading());
    final res = await newEmployeeRepo.addNewEmployee(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      storeId: storeId,
      provianceID: provianceID,
      cityID: cityID,
      areaID: areaID,
      photo: '',
    );

    res.fold(
      (err) {
        showSnackBar(err);
        emit(NewEmployeeInitial());
      },
      (res) async {
        showSnackBar('تمت الإضافة بنجاح');
        MagicRouter.navigateAndPopAll(const HomeView());
        emit(NewEmployeeLoaded());
      },
    );
  }

//   Future getProfileDetails() async {
//     emit(GetProfileDetailsLoading());
//     final res = await profileRepo.getProfileDetails();

//     res.fold(
//       (err) {
//         showSnackBar(err);
//         emit(ProfileInitial());
//       },
//       (res) async {
//         userData = res.data;
//         nameController.text = res.data!.name!;
//         emailController.text = res.data!.email!;
//         phoneController.text = res.data!.phone!;
//         // passwordController.text = AppStorage.getPassword!;
//         // passwordConfirmationController.text = AppStorage.getPassword!;
//         emit(GetProfileDetailsLoaded());
//       },
//     );
//   }

  // Future editImageProfile() async {
  //   emit(EditProfileDetailsLoading());
  //   final res = await profileRepo.editImageProfile(photo!);

  //   res.fold(
  //     (err) {
  //       showSnackBar(err);
  //       emit(ProfileInitial());
  //     },
  //     (res) async {
  //       showSnackBar('تم تحديث الصوره الشخصيه');
  //       emit(ProfileInitial());
  //     },
  //   );
  // }
}
