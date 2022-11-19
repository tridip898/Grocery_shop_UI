import 'package:flutter/material.dart';
import 'package:grochery_shop_ui/cart_model.dart';
import 'package:provider/provider.dart';

import 'intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        theme: ThemeData(
            primarySwatch: Colors.cyan
        ),
      ),
    );
  }
}
