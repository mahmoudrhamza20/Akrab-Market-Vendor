part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchInitial2 extends SearchState {}

class GetLocationForSearchLoading extends SearchState {}

class GetMarketsLoading extends SearchState {}

class GetStoreCategoriesLoading extends SearchState {}

class GetStoreMainCategoriesLoading extends SearchState {}

class GetStoreMainCategoriesLoaded extends SearchState {
  final List<Categories> listOfStoreMainCategories;

  GetStoreMainCategoriesLoaded(this.listOfStoreMainCategories);
}

class GetMarketProductsOfferLoaded extends SearchState {
  final List<ProductDetailsModel> listOfMarketProducts;

  GetMarketProductsOfferLoaded(this.listOfMarketProducts);
}

class GetMarketProductsLoaded extends SearchState {
  final MarketProductsModel marketProductsModel;

  GetMarketProductsLoaded(this.marketProductsModel);
}

class GetMarketsByCategoryIdLoaded extends SearchState {
  final List<ListOfMarketsData> listOfMarkets;

  GetMarketsByCategoryIdLoaded(this.listOfMarkets);
}

class GetAllMarketsLoaded extends SearchState {
  final List<ListOfMarketsData> listOfMarkets;

  GetAllMarketsLoaded(this.listOfMarkets);
}
