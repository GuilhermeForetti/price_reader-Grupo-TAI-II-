import 'package:flutter/material.dart';
import 'package:price_reader/data/abstracts/products_data_source.dart';
import 'package:price_reader/data/data_sources/products_fake_data_source.dart';
import 'package:price_reader/interface/screens/home_screen/home_screen.dart';
import 'package:price_reader/interface/screens/home_screen/home_screen_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<ProductsDataSource>(
            create: (context) => ProductsFakeDataSource(),
          ),
          ChangeNotifierProvider<HomeScreenController>(
            create: (context) => HomeScreenController(),
          )
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const HomeScreen(),
          );
        });
  }
}
