// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:miniapp_with_bloc/features/home/models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  const ProductTileWidget({
    Key? key,
    required this.productDataModel,
  }) : super(key: key);
  final ProductDataModel productDataModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          Text(productDataModel.name),
          Text(productDataModel.description)
        ],
      ),
    );
  }
}
