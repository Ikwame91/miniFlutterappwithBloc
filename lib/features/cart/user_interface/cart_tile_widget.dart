// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:miniapp_with_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:miniapp_with_bloc/features/home/models/home_product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  final CartBloc cartBloc;
  const CartTileWidget({
    Key? key,
    required this.cartBloc,
    required this.productDataModel,
  }) : super(key: key);
  final ProductDataModel productDataModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            productDataModel.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            productDataModel.description,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$" + productDataModel.price.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // homeBloc.add(HomeProductWishlistButtonClickedEvent(
                        //     clickedProduct: productDataModel));
                      },
                      icon: Icon(Icons.favorite_outline)),
                  IconButton(
                      onPressed: () {
                        cartBloc.add(CartRemoveFromCartEvent(
                            productDataModel: productDataModel));
                      },
                      icon: Icon(Icons.shopping_bag)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
