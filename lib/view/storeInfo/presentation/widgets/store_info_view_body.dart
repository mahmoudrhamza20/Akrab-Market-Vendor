import 'dart:developer';
import 'dart:io';
import 'package:akrab_market_vendor/core/utils/app_colors.dart';
import 'package:akrab_market_vendor/view/storeInfo/presentation/bloc/cubit/get_store_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/validator/validator.dart';
import '../../../../widgets/custom_input_field.dart';
import '../../../getArea/presentation/screens/get_area_widget.dart';
import '../../../search/presentation/bloc/search_cubit.dart';

class StoreInfoBody extends StatefulWidget {
  const StoreInfoBody({super.key});

  @override
  State<StoreInfoBody> createState() => _StoreInfoBodyState();
}

class _StoreInfoBodyState extends State<StoreInfoBody> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(
        () => this.image = imageTemp,
      );
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchCubit = SearchCubit.of(context);
    final cubit = GetStoreDataCubit.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: BlocBuilder<GetStoreDataCubit, GetStoreDataState>(
          builder: (context, state) {
            return state is GetStoreDataLoadeing
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.0.w),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () => {
                                    pickImage(),
                                  },
                                  child: Container(
                                    height: 80.w,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      image: cubit.storeData!.photo == null
                                          ? const DecorationImage(
                                              image: AssetImage(
                                                AppAssets.homeAvatar,
                                              ),
                                            )
                                          : DecorationImage(
                                              image: NetworkImage(
                                                  cubit.storeData!.photo!),
                                              fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Text(
                                  'تغير صورة اللوجو',
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 17),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.0.w),
                            child: Column(
                              children: [
                                Center(
                                  child: InkWell(
                                    onTap: () => {
                                      pickImage(),
                                    },
                                    child: Container(
                                      height: 80.w,
                                      width: 160.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Colors.white,
                                        image:
                                            //  image == null
                                            //     ? const DecorationImage(
                                            //         image: AssetImage(
                                            //           AppAssets.imageSlider,
                                            //         ),
                                            //       )
                                            //     :
                                            DecorationImage(
                                                image: NetworkImage(
                                                    cubit.storeData!.cover),
                                                fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'تغير صورة الغلاف',
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 17),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      CustomTextField(
                        labelText: 'اسم المتجر',
                        inputType: TextInputType.name,
                        controller: cubit.nameController,
                        validator: (value) => Validator.name(value!),
                      ),
                      CustomTextField(
                        labelText: ' رقم الهاتف',
                        inputType: TextInputType.number,
                        controller: cubit.phoneController,
                        validator: (value) => Validator.name(value!),
                      ),
                      CustomTextField(
                        labelText: ' رقم واتس اب',
                        inputType: TextInputType.number,
                        controller: cubit.whatsUpController,
                        validator: (value) => Validator.name(value!),
                      ),
                      CustomTextField(
                        labelText: ' العنوان بالتفصيل',
                        inputType: TextInputType.name,
                        controller: cubit.locationDescriptionController,
                        validator: (value) => Validator.name(value!),
                      ),
                      CustomTextField(
                        labelText: 'نوع المتجر',
                        inputType: TextInputType.text,
                        controller: cubit.storeType,
                        validator: (value) => Validator.name(value!),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      GetAreaWidget(
                        selectedItemGovernorate: cubit.storeData!.gid,
                        selectedItemCity: cubit.storeData!.cid,
                        selectedItemArea: cubit.storeData!.aid,
                        governorateFun: (value) {
                          log(value.id.toString());
                          searchCubit.gid = value.id!;
                        },
                        citieFun: (value) {
                          log(value.id.toString());
                          searchCubit.cid = value.id!;
                        },
                        areaFun: (value) {
                          log(value.id.toString());
                          searchCubit.aid = value.id!;
                        },
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Container(
                        height: 80.h,
                        width: MediaQuery.of(context).size.width,
                        decoration:
                            const BoxDecoration(color: AppColors.primaryColor),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'تحديث المكان على الخريطة',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'تعديل البيانات',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
