import 'package:flutter/material.dart';
import 'package:gsr/models/category.dart';
import 'package:gsr/models/product.dart';
import 'package:gsr/providers/data_provider.dart';
import 'package:gsr/widgets/add_category.dart';
import 'package:gsr/widgets/category_item.dart';
import 'package:gsr/widgets/product_item.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> categories = [];
  @override
  void initState() {
    super.initState();
    Provider.of<DataProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    categories = Provider.of<DataProvider>(context).categories;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () async {
              await showDialog(
                context: this.context,
                builder: (BuildContext context) => AddCategory(),
              );
              await Provider.of<DataProvider>(context, listen: false)
                  .getCategories();
            },
            iconSize: 30,
            icon: Icon(
              Icons.add_circle,
              color: Colors.orange,
            )),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoryItem(
                category: categories[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
