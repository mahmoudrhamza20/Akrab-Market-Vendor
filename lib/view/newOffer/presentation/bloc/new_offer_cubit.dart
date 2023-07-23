import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/models/user_model.dart';
import '../../data/repositories/new_offer_repo.dart';

part 'new_offer_state.dart';

class NewOfferCubit extends Cubit<NewOfferState> {
  NewOfferCubit() : super(NewOfferInitial());

  static NewOfferCubit of(context) => BlocProvider.of(context);
  final profileRepo = NewOfferRepo();
  UserData? userData;

  final offerNameController = TextEditingController();
  final expDateController = TextEditingController();
  final offerDescController = TextEditingController();
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
