import 'package:akrab_market_vendor/view/storeInfo/presentation/bloc/cubit/get_store_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/home_appbar.dart';
import '../widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetStoreDataCubit, GetStoreDataState>(
      builder: (context, state) {
        final cubit = GetStoreDataCubit.of(context);
        return Scaffold(
          drawer: state is GetStoreDataLoadeing
              ? const CircularProgressIndicator()
              : CustomDrawer(
                  image: cubit.storeData!.photo.toString(),
                  ownerId: cubit.storeData!.ownerId.toString(),
                  storename: cubit.storeData!.name.toString(),
                ),
          appBar: const HomeAppBar(),
          body: const HomeViewBody(),
        );
      },
    );
  }
}
