part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessfullyState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishListPageActionState extends HomeActionState {}

class HomeNavigateToCartListPageActionState extends HomeActionState {}
