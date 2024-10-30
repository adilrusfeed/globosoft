import 'package:flutter/material.dart';
import 'package:globosoft/controller/controller.dart';
import 'package:globosoft/service/service.dart';
import 'package:globosoft/view/details.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductController>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('E-Commerce App'),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          ],
        ),
        body: productProvider.isloading
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
              padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        
                        mainAxisSpacing: 10,
                        ),
                    itemCount: productProvider.products.length,
                    itemBuilder: (context, index) {
                     final product = productProvider.products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product)));
                    },
                    child: Card(
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(child: Image.network(
                            ProductService().getImageUrl(product.thumb),
                            fit: BoxFit.fill,
                          )),
                         Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.name, maxLines: 1, overflow: TextOverflow.ellipsis),
                              SizedBox(height: 5),
                              Text(product.price, style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}