import 'package:akrab_market_vendor/view/storeInfo/presentation/bloc/cubit/get_store_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/store_info_view_body.dart';

class StoreInfoView extends StatelessWidget {
  const StoreInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetStoreDataCubit()..getStoreData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('بيانات المتجر'),
        ),
        body: const SafeArea(child: StoreInfoBody()),
      ),
    );
  }
}
