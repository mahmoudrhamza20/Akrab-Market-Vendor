import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/categories_model.dart';
import '../../../../core/models/list_of_markets.dart';
import '../../../../core/models/market_products_model.dart';
import '../../../../core/models/product_details_model.dart';
import '../../../../core/models/store_categories_model.dart';
import '../../../../widgets/snack_bar.dart';
import '../../data/repositories/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit of(context) => BlocProvider.of(context);
  final searchRepo = SearchRepo();

  int selectedCateIndex = 0;
  int selectedSubCateIndex = 0;

  double mapLate = 00;
  double mapLong = 00;
  int gid = 0, cid = 0, aid = 0;
  int? cateId;
  int? subCateId;
  int? storeId;
  List<StoreCategoriesData>? listOfStoreCategories;
  List<ListOfMarketsData> listOfMarkets = [];
  List<Categories>? mainCategories;
  MarketProductsModel? marketProductsModel;

// getMarketsData-------------------------------------------------------------
  Future getMarketsData() async {
    emit(GetMarketsLoading());
    final res = await searchRepo.getLocationForSearch(
        mapLate, mapLong, gid, cid, aid, cateId == null ? 0 : cateId!);

    res.fold(
      (err) {
        showSnackBar(err);
        emit(SearchInitial());
      },
      (res) async {
        listOfMarkets.addAll(res.data!);

        emit(SearchInitial());
      },
    );
  }

// getAllMarkets-------------------------------------------------------------

  Future getAllMarkets() async {
    listOfMarkets.clear();
    await getMarketsData();
    emit(GetAllMarketsLoaded(listOfMarkets));
  }

// getMarketsByCategoryId-------------------------------------------------------------

  Future getMarketsByCategoryId() async {
    listOfMarkets.clear();
    await getMarketsData();
    emit(GetMarketsByCategoryIdLoaded(listOfMarkets));
  }

// getStoreCategories-------------------------------------------------------------

  Future getStoreCategories() async {
    emit(GetStoreCategoriesLoading());
    final res = await searchRepo.getStoreCategories();
    res.fold(
      (err) {
        showSnackBar(err);
        emit(SearchInitial());
      },
      (res) async {
        emit(SearchInitial2());
        listOfStoreCategories = res.data;
        emit(SearchInitial());
      },
    );
  }

// getMarketProductsOffer-------------------------------------------------------------

  Future getMarketProductsOffer() async {
    emit(GetStoreMainCategoriesLoading());
    log("$storeId");
    final res = await searchRepo.getMarketProducts(0, 0, storeId!, true);

    res.fold(
      (err) {
        showSnackBar(err);
        emit(SearchInitial());
      },
      (res) async {
        emit(GetMarketProductsOfferLoaded(res.marketProducts!));
      },
    );
  }

// getStoreMainCategories-------------------------------------------------------------

  Future getStoreMainCategories() async {
    emit(GetStoreMainCategoriesLoading());
    final res = await searchRepo.getStoreMainCategories(storeId!);

    res.fold(
      (err) {
        showSnackBar(err);
        emit(SearchInitial());
      },
      (res) async {
        mainCategories = res.data!;
        emit(GetStoreMainCategoriesLoaded(res.data!));
      },
    );
  }

  // getMarketProducts-------------------------------------------------------------

  Future getMarketProducts() async {
    emit(GetStoreMainCategoriesLoading());
    final res = await searchRepo.getMarketProducts(
        cateId!, subCateId!, storeId!, false);

    res.fold(
      (err) {
        showSnackBar(err);
        emit(SearchInitial());
      },
      (res) async {
        marketProductsModel = res;
        emit(GetMarketProductsLoaded(res));
      },
    );
  }

  // searchCategoriesAppBar-------------------------------------------------------------

  // Future searchCategoriesAppBar(Categories categories) async {
  //   cateId = categories.id;
  //   MagicRouter.navigateTo(const ProductsOfMarketsScreen());
  // }
}
