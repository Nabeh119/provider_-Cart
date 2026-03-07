import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_pro/Model/cart.dart';
import 'package:state_management_pro/Example/checkout.dart';
import 'package:state_management_pro/Model/item.dart';

class Home extends StatelessWidget {
  //int x = 0;

  @override
  Widget build(BuildContext context) {
    List<Item> items = [
      Item("S20 Ultra", 250),
      Item("p30 pro", 300),
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Checkout();
                  }));
                },
                icon: Icon(
                  Icons.add_shopping_cart,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Consumer<Cart>(builder: (context, cart, child) {
                  return Text("${cart.totalprice}");
                }),
              ),
            ],
          ),
        ],
        backgroundColor: Colors.blue,
        title: Text("Home Page"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(child: Consumer<Cart>(builder: (context, cart, child) {
            return ListTile(
              trailing: IconButton(
                icon: Icon(
                  Icons.add,
                ),
                onPressed: () {
                  cart.add(items[index]);
                  // setState(() {
                  //   x++;
                  // });
                },
              ),
              title: Text(
                "${items[index].name}",
              ),
            );
          }));
        },
      ),
    );
  }
}
