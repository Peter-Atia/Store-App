import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key,required this.product});
  ProductModel product ;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none ,
      children: [
        SizedBox(
          width: 200,
          height: 130,
          child: Card(
            elevation: 15,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(product.title.substring(0,12)),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.price.toString()}",
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 100,
          top: -20,
          child: Image.network(
            product.image,
            height: 80,
            width: 80,
          ),
        )
      ],
    );
  }
}
