import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/get_area_model.dart';
import '../bloc/get_area_cubit.dart';

class GetAreaWidget extends StatelessWidget {
  const GetAreaWidget(
      {Key? key,
      required this.governorateFun,
      required this.citieFun,
      required this.areaFun,
      required this.selectedItemGovernorate,
      required this.selectedItemCity,
      required this.selectedItemArea,
      this.isProfile = false})
      : super(key: key);

  final Function(Governorate) governorateFun;
  final Function(Cities) citieFun;
  final Function(Areas) areaFun;
  final int selectedItemGovernorate, selectedItemCity, selectedItemArea;
  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAreaCubit()..getArea(),
      child: BlocBuilder<GetAreaCubit, GetAreaState>(
        builder: (context, state) {
          final cubit = GetAreaCubit.of(context);
          if (state is GetAreaLoaded) {
            selectedItemGovernorate == 0
                ? null
                : cubit.listOfCities.addAll(state.model.governorate
                    .firstWhere(
                        (element) => element.id == selectedItemGovernorate)
                    .cities!);

            selectedItemCity == 0
                ? null
                : cubit.listOfAreas.addAll(cubit.listOfCities
                    .firstWhere((element) => element.id == selectedItemCity)
                    .areas);
            return Column(
              children: [
                //     ? SizedBox(
                //         height: MediaQuery.of(context).size.height * 0.07,
                //         child: DropdownSearch<Governorate>(
                //           selectedItem: selectedItemGovernorate == 0
                //               ? null
                //               : state.model.governorate.firstWhere((element) =>
                //                   element.id == selectedItemGovernorate),
                //           dropdownSearchDecoration: const InputDecoration(
                //             hintText: 'نوع المتجر',
                //             filled: true,
                //             fillColor: Color(0xFFD6D6D6),
                //             contentPadding: EdgeInsets.fromLTRB(12, 12, 10, 0),
                //             enabledBorder: OutlineInputBorder(
                //               borderSide: BorderSide(
                //                   width: 1,
                //                   style: BorderStyle.solid,
                //                   color: Colors.grey),
                //               borderRadius:
                //                   BorderRadius.all(Radius.circular(8.0)),
                //             ),
                //             focusedBorder: OutlineInputBorder(
                //               borderSide: BorderSide(
                //                   width: 1,
                //                   style: BorderStyle.solid,
                //                   color: Colors.grey),
                //               borderRadius:
                //                   BorderRadius.all(Radius.circular(8.0)),
                //             ),
                //             hintStyle: TextStyle(color: Colors.black),
                //             labelStyle: TextStyle(color: Colors.black),
                //           ),
                //           items: state.model.governorate,
                //           itemAsString: (Governorate? data) => data!.name!,
                //           mode: Mode.MENU,
                //           onChanged: (Governorate? data) {
                //             governorateFun(data!);
                //             cubit.listOfCities.clear();
                //             cubit.listOfAreas.clear();
                //             cubit.listOfCities.addAll(data.cities!);
                //           },
                //         ),
                //       )
                //     : Container(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: DropdownSearch<Governorate>(
                    //  hint: 'اختار المحافظه',
                    selectedItem: selectedItemGovernorate == 0
                        ? null
                        : state.model.governorate.firstWhere(
                            (element) => element.id == selectedItemGovernorate),
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: 'اختار المحافظه',
                      filled: true,
                      fillColor: Color(0xFFD6D6D6),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 10, 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    items: state.model.governorate,
                    itemAsString: (Governorate? data) => data!.name!,
                    mode: Mode.MENU,
                    onChanged: (Governorate? data) {
                      governorateFun(data!);
                      cubit.listOfCities.clear();
                      cubit.listOfAreas.clear();
                      cubit.listOfCities.addAll(data.cities!);
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: DropdownSearch<Cities>(
                    // hint: 'اختار المدينه',
                    selectedItem: selectedItemCity == 0
                        ? null
                        : cubit.listOfCities.firstWhere(
                            (element) => element.id == selectedItemCity),
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: 'اختار المدينه',
                      filled: true,
                      fillColor: Color(0xFFD6D6D6),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 10, 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    items: cubit.listOfCities,
                    itemAsString: (Cities? data) => data!.name!,
                    mode: Mode.MENU,
                    onChanged: (Cities? data) {
                      citieFun(data!);
                      cubit.listOfAreas.clear();
                      cubit.listOfAreas.addAll(data.areas);
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: DropdownSearch<Areas>(
                    //  hint: 'اختار المنطقه',
                    selectedItem: selectedItemArea == 0
                        ? null
                        : cubit.listOfAreas.firstWhere(
                            (element) => element.id == selectedItemArea),
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: 'اختار المنطقه',
                      filled: true,
                      fillColor: Color(0xFFD6D6D6),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 10, 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    items: cubit.listOfAreas,
                    itemAsString: (Areas? data) => data!.name!,
                    mode: Mode.MENU,
                    onChanged: (Areas? data) {
                      areaFun(data!);
                    },
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
