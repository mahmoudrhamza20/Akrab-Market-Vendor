part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetProfileDetailsLoading extends ProfileState {}

class GetProfileDetailsLoaded extends ProfileState {}

class EditProfileDetailsLoading extends ProfileState {}

