import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_pro/App/hometest2.dart';
import 'package:state_management_pro/Model/cart.dart';
import 'package:state_management_pro/Model/cart2.dart';
import 'package:state_management_pro/app/home.dart';

void main() {
  runApp(const Provider());
}

class Provider extends StatelessWidget {
  const Provider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart2();
      },
      child: MaterialApp(
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        title: "Smart Home",
        home: Hometest2(),
      ),
    );
  }
}
