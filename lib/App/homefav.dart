import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_pro/Example/checkfav.dart';
import 'package:state_management_pro/Model/fav.dart';
import 'package:state_management_pro/Model/favorite.dart';

class Homefav extends StatelessWidget {
  List<Favorite> favorite = [
    Favorite('Apple'),
    Favorite('Banana'),
    Favorite('Chocolate'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Home Favorite'),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Checkfav();
                  }));
                },
                icon: Icon(Icons.add_shopping_cart),
              ),
              Consumer<Fav>(builder: (context, fav, child) {
                return Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text("${fav.getcoutfav()}"));
              })
            ],
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: favorite.length,
          itemBuilder: (context, index) {
            return Consumer<Fav>(builder: (context, fav, child) {
              return ListTile(
                title: Text("${favorite[index].name}"),
                trailing: IconButton(
                  onPressed: () {
                    fav.add(favorite[index]);
                  },
                  icon: Icon(Icons.favorite),
                ),
              );
            });
          }),
    );
  }
}
