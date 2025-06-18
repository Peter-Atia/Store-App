import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_page.dart';
import 'package:store_app/services/get_all_products.dart';
import 'package:store_app/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        ],
        title: const Text("New Trend", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: GetAllProducts().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> products = snapshot.data!;
            return GridView.builder(
              clipBehavior: Clip.none,
              padding: EdgeInsetsGeometry.symmetric(
                vertical: 25,
                horizontal: 10,
              ),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      UpdateProductPage.id,
                      arguments: products[index],
                    );
                  },
                  child: ProductCard(product: products[index]),
                );
              },
            );
          } else {
            print(snapshot.error);
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
