import 'package:flutter/material.dart';
import 'package:gsr/models/category.dart';
import 'package:gsr/providers/data_provider.dart';
import 'package:gsr/widgets/edit_category.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text(category.name),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) => EditCategory(
                    category: category,
                  ),
                );
                await Provider.of<DataProvider>(context, listen: false)
                    .getCategories();
              },
              icon: Icon(
                Icons.edit,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
