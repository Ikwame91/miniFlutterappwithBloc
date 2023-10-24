import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniapp_with_bloc/features/cart/user_interface/cart_screen.dart';
import 'package:miniapp_with_bloc/features/home/bloc/home_bloc.dart';
import 'package:miniapp_with_bloc/features/wishlist/user_interface/wishlist_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartListPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartScreen()));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Text('Nkays Grocery App'),
              actions: [
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: Icon(Icons.favorite_outline)),
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateClickedEvent());
                    },
                    icon: Icon(Icons.shopping_bag_outlined)),
              ],
            ),
          ),
        );
      },
    );
  }
}
