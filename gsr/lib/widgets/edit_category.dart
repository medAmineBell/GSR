import 'package:flutter/material.dart';
import 'package:gsr/models/category.dart';
import 'package:gsr/providers/data_provider.dart';
import 'package:provider/provider.dart';

class EditCategory extends StatefulWidget {
  final Category category;

  const EditCategory({super.key, required this.category});
  @override
  _EditCategoryState createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  TextEditingController namecontroller = TextEditingController();
  bool _validname = false;
  @override
  void initState() {
    super.initState();
    namecontroller.text = widget.category.name;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titleTextStyle: TextStyle(
          color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      title: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          child: Icon(
            Icons.close,
            size: 27,
            color: Colors.red,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      content: Container(
        //width: double.infinity,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Edit category",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                controller: namecontroller,
                decoration: InputDecoration(
                  labelText: 'Name',
                  errorText: _validname ? 'Name is empty!' : null,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    namecontroller.text.isEmpty
                        ? _validname = true
                        : _validname = false;
                  });
                  if (namecontroller.text.isNotEmpty) {
                    await Provider.of<DataProvider>(context, listen: false)
                        .editCategory(namecontroller.text, widget.category.id);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Save"),
                )),
          ],
        ),
      ),
    );
  }
}
