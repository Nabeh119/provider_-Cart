import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_pro/Model/cart2.dart';

class Checkout2 extends StatelessWidget {
  const Checkout2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
        title: Text('Check Out'),
      ),
      body: Consumer<Cart2>(builder: (context, cart, child) {
        return ListView.builder(
            itemCount: cart.basketItem2.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${cart.basketItem2[index].name}"),
                trailing: IconButton(
                  onPressed: () {
                    if (index < cart.basketItem2.length) {
                      cart.basketItem2.removeAt(index);
                      cart.notifyListeners();
                    }
                  },
                  icon: Icon(Icons.remove),
                ),
              );
            });
      }),
    );
  }
}
