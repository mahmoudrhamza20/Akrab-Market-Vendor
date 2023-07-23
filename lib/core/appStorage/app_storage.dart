// ignore_for_file: body_might_complete_normally_nullable

import 'dart:developer';

import 'package:akrab_market_vendor/view/login/presentation/screens/login_screen.dart';
import 'package:get_storage/get_storage.dart';
import '../models/user_model.dart';
import '../router/router.dart';

abstract class AppStorage {
  static final GetStorage _box = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  static UserModel? get getUserInfo {
    if (_box.hasData('user')) return UserModel.fromJson(_box.read('user'));
  }

  static String? get getPassword {
    if (_box.hasData('password')) return _box.read('password');
  }

  //static bool get isLogged => getUserInfo != null;
  static bool get isLogged => true;

  static Future<void> cacheUserInfo(UserModel userModel) =>
      _box.write('user', userModel.toJson());

  static Future<void> cachePasswordUserInfo(String passwoed) =>
      _box.write('password', passwoed);

  static int get getUserId => getUserInfo!.data!.id!;

  static String get getPasswordUserInfo => getPassword!;

  static UserData get getUserData => getUserInfo!.data!;

  static Future<void> signOut() async {
    await _box.erase();

    log('logout');
    MagicRouter.navigateAndPopAll(const LoginView());
  }
}
