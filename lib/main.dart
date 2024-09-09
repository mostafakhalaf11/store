import 'package:flutter/material.dart';
import 'package:store/screens/update_product_page.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const Store());
}

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdateProductPage.id: (context) =>  const UpdateProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
