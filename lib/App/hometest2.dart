import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_pro/Example/checkout2.dart';
import 'package:state_management_pro/Model/cart2.dart';
import 'package:state_management_pro/Model/item2.dart';

class Hometest2 extends StatelessWidget {
  final List<Item2> item2 = [
    Item2('KIA', 6000),
    Item2('Oudi', 9000),
    Item2('BMW', 8000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Checkout2();
                    }),
                  );
                },
                icon: Icon(Icons.shopping_bag),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Consumer<Cart2>(builder: (context, cart, child) {
                    return Text("${cart.getCount2()}");
                  })),
            ],
          ),
        ],
        backgroundColor: Colors.blue,
        title: Text("Hometest2"),
      ),
      body: ListView.builder(
          itemCount: item2.length,
          itemBuilder: (context, index) {
            return Consumer<Cart2>(builder: (context, cart, child) {
              return ListTile(
                trailing: IconButton(
                  onPressed: () {
                    cart.add2(item2[index]);
                  },
                  icon: Icon(
                    Icons.add,
                  ),
                ),
                title: Text("${item2[index].name}"),
              );
            });
          }),
    );
  }
}
