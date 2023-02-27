import 'package:flutter/material.dart';
import 'package:gsr/models/product.dart';
import 'package:gsr/providers/data_provider.dart';
import 'package:gsr/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> prducts = [];
  @override
  void initState() {
    super.initState();
    Provider.of<DataProvider>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    prducts = Provider.of<DataProvider>(context).products;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: prducts.length,
            itemBuilder: (context, index) {
              return ProductItem(
                product: prducts[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
