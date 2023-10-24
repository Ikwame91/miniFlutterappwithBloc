part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessfullyState extends HomeState {
  final List<ProductDataModel> product;

  HomeLoadedSuccessfullyState({required this.product});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishListPageActionState extends HomeActionState {}

class HomeNavigateToCartListPageActionState extends HomeActionState {}
