import 'package:akrab_market_vendor/core/cacheHelper/cache_helper.dart';
import 'package:akrab_market_vendor/view/home/presentation/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/router/router.dart';
import '../../../../widgets/snack_bar.dart';
import '../../data/repositories/login_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final loginRepo = LoginRepo();

  static LoginCubit of(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //String? deviceToken;
  // getTokenDevice() async{
  //   FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  //   String? token = await firebaseMessaging.getToken();
  //   deviceToken = token;
  //   print("token is $deviceToken");
  // }

  Future login() async {
    if (!formKey.currentState!.validate()) {}
    formKey.currentState!.save();
    emit(LoginLoading());
    // await getTokenDevice();
    final res = await loginRepo.login(
        email: emailController.text, password: passwordController.text);
    res.fold(
      (err) {
        showSnackBar(err);
        emit(LoginInitial());
      },
      (res) async {
        await CacheHelper.saveData(key: 'res', value: res);
        await CacheHelper.saveData(
            key: 'password', value: passwordController.text);
        showSnackBar(res.status!);
        MagicRouter.navigateAndPopAll(const HomeView());
        emit(LoginLoaded());
      },
    );
  }
}
