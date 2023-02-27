import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gsr/models/category.dart';
import 'package:gsr/models/product.dart';
import 'package:http/http.dart' as http;

class DataProvider with ChangeNotifier {
  String token = "";
  List<Product> products = [];
  List<Category> categories = [];

  String serverUrl = "https://erp.aftercode.tn/";

  Future<bool> login(String email, String password) async {
    bool resultat = false;
    final url = serverUrl + 'api/v1/token/login/';

    final response = await http
        .post(Uri.parse(url), body: {"username": email, "password": password});

    try {
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        token = extractedData["auth_token"];
        resultat = true;
        print(token);
      }
    } catch (e) {
      print(e.toString());
    }
    return resultat;
  }

  Future<void> getProducts() async {
    final url = serverUrl + 'api/v1/products/';

    final response = await http
        .get(Uri.parse(url), headers: {"Authorization": "Token $token"});

    try {
      final stageData = json.decode(response.body) as List<dynamic>;

      if (stageData.isNotEmpty) {
        products = [];
        stageData.forEach((element) {
          final product = Product.fromJson(element);
          products.add(product);
        });
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> getCategories() async {
    final url = serverUrl + 'api/v1/categories/';

    final response = await http
        .get(Uri.parse(url), headers: {"Authorization": "Token $token"});

    try {
      final stageData = json.decode(response.body) as List<dynamic>;

      if (stageData.isNotEmpty) {
        categories = [];
        stageData.forEach((element) {
          final category = Category.fromJson(element);
          categories.add(category);
        });
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  // Future<User> addUser(String cin, String password) async {
  //   late User student;
  //   final url = serverUrl + '/api/users';

  //   final response = await http.post(Uri.parse(url),
  //       body: {"cin": cin, "password": password, "role": "student"});

  //   try {
  //     final extractedData = json.decode(response.body) as Map<String, dynamic>;

  //     if (extractedData.isNotEmpty) {
  //       student = User.fromJson(extractedData);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return student;
  // }

  // Future<void> addStudent(
  //     String nom,
  //     String prenom,
  //     String address,
  //     String niveau,
  //     String location,
  //     String telephone,
  //     String dateNaissance,
  //     String userId) async {
  //   final url = serverUrl + '/api/students';

  //   final response = await http.post(Uri.parse(url), body: {
  //     "nom": nom,
  //     "prenom": prenom,
  //     "address": address,
  //     "niveau": niveau,
  //     "location": location,
  //     "telephone": telephone,
  //     "dateNaissance": dateNaissance,
  //     "userId": userId,
  //   });

  //   try {
  //     final extractedData = json.decode(response.body) as List<dynamic>;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<void> addStage(String type, String sujet, String encadrant,
  //     String dateDep, String dateFin, bool payer, String userId) async {
  //   final url = serverUrl + '/api/stages';

  //   final response = await http.post(Uri.parse(url), body: {
  //     "type": type,
  //     "sujet": sujet,
  //     "encadrant": encadrant,
  //     "dateDep": dateDep,
  //     "dateFin": dateFin,
  //     "payer": payer.toString(),
  //     "userId": userId,
  //   });

  //   try {
  //     final extractedData = json.decode(response.body) as List<dynamic>;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<bool> checkStageStatus(String userId) async {
  //   bool status = false;
  //   final url = '$serverUrl/api/stages';

  //   final response = await http.get(
  //     Uri.parse(url),
  //   );

  //   try {
  //     final stageData = json.decode(response.body) as List<dynamic>;

  //     if (stageData.isNotEmpty) {
  //       stages = [];
  //       stageData.forEach((element) {
  //         final stage = Stage.fromJson(element);
  //         stages.add(stage);
  //       });
  //       status = stages.firstWhere((stage) => stage.userId == userId).status;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return status;
  // }

  // Future<void> getStudents() async {
  //   final url = '$serverUrl/api/students';

  //   final response = await http.get(
  //     Uri.parse(url),
  //   );

  //   try {
  //     final studentData = json.decode(response.body) as List<dynamic>;

  //     if (studentData.isNotEmpty) {
  //       students = [];
  //       studentData.forEach((element) {
  //         final student = Student.fromJson(element);
  //         students.add(student);
  //       });
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<void> getUsers() async {
  //   final url = '$serverUrl/api/users';

  //   final response = await http.get(
  //     Uri.parse(url),
  //   );

  //   try {
  //     final userData = json.decode(response.body) as List<dynamic>;

  //     if (userData.isNotEmpty) {
  //       users = [];
  //       userData.forEach((element) {
  //         final user = User.fromJson(element);
  //         users.add(user);
  //       });
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<void> validateStage(String stageId) async {
  //   final url = serverUrl + '/api/stages/$stageId';

  //   final response =
  //       await http.put(Uri.parse(url), body: {"status": true.toString()});

  //   try {
  //     final extractedData = json.decode(response.body) as Map<String, dynamic>;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   await getStages();
  // }
}
