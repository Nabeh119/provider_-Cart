import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_pro/Model/cart.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Check Out",
        ),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.basketItem.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text("${cart.basketItem[index].name}"),
                  trailing: IconButton(
                    onPressed: () {
                      if (index < cart.basketItem.length) {
                        cart.basketItem.removeAt(index);
                        cart.notifyListeners();
                      }
                      //cart.notifyListeners();
                    },
                    icon: Icon(
                      Icons.remove,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
