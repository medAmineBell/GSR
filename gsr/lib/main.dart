import 'package:flutter/material.dart';
import 'package:gsr/providers/data_provider.dart';
import 'package:gsr/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CNI App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
