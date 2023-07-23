part of 'new_offer_cubit.dart';

@immutable
abstract class NewOfferState {}

class NewOfferInitial extends NewOfferState {}

class NewOfferLoading extends NewOfferState {}

class NewOfferLoaded extends NewOfferState {}

class EditNewOfferLoading extends NewOfferState {}
