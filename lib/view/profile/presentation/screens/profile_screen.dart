import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/profile_cubit.dart';
import '../widgets/profile_appbar.dart';
import '../widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //  create: (context) => ProfileCubit()..getProfileDetails(),
      create: (context) => ProfileCubit(),
      child: Scaffold(
        appBar: const ProfileAppBar(),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return ProfileViewBody();
          },
        ),
      ),
    );
  }
}
