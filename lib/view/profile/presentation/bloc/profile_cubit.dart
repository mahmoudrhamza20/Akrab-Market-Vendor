import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/models/user_model.dart';
import '../../data/repositories/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit of(context) => BlocProvider.of(context);
  final profileRepo = ProfileRepo();
  UserData? userData;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  XFile? photo;
  int provianceID = 0, cityID = 0, areaID = 0;

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

//   Future editProfileDetails() async {
//     emit(EditProfileDetailsLoading());
//     final res = await profileRepo.editProfileDetails(
//       nameController.text,
//       emailController.text,
//       phoneController.text,
//       passwordController.text,
//       passwordConfirmationController.text,
//       provianceID,
//       cityID,
//       areaID,
//     );

//     res.fold(
//       (err) {
//         showSnackBar(err);
//         emit(ProfileInitial());
//       },
//       (res) async {
//         MagicRouter.navigateAndPopAll(const HomeView());
//         emit(ProfileInitial());
//       },
//     );
//   }

//   Future editImageProfile() async {
//     emit(EditProfileDetailsLoading());
//     final res = await profileRepo.editImageProfile(photo!);

//     res.fold(
//       (err) {
//         showSnackBar(err);
//         emit(ProfileInitial());
//       },
//       (res) async {
//         showSnackBar('تم تحديث الصوره الشخصيه');
//         emit(ProfileInitial());
//       },
//     );
//   }
}
