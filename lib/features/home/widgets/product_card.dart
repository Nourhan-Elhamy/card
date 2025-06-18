import 'package:card/features/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/details.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});
final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsPage(product: productModel),
          ),
        );      },
      child: Card(

        elevation: 4,
        child: Column(
          children: [
            Expanded(child: Image.asset(productModel.Image,fit: BoxFit.fill,)),
            SizedBox(height: 6,),
            Text(productModel.name),
            SizedBox(height: 6,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                spacing: 10,
                children: [
                  Text(productModel.price.toString()),

                  Row(children: [
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                  ],)

                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}
