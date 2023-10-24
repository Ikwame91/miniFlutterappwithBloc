import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:miniapp_with_bloc/data/grocery_data.dart';
import 'package:miniapp_with_bloc/features/home/models/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeCartButtonNavigateClickedEvent>(homeCartButtonNavigateClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(
      HomeLoadedSuccessfullyState(
          product: GroceryData.groceryProducts
              .map((e) => ProductDataModel(
                    id: e['id'],
                    name: e['name'],
                    description: e['description'],
                    price: e['price'],
                    imageUrl: e['imageUrl'],
                  ))
              .toList()),
    );
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('ProductList button Clicked');
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist button Clicked');
  }

  FutureOr<void> homeCartButtonNavigateClickedEvent(
      HomeCartButtonNavigateClickedEvent event, Emitter<HomeState> emit) {
    print('ProductList Navigate Clicked');
    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Wishlist Navigate  Clicked');
    emit(HomeNavigateToCartListPageActionState());
  }
}
