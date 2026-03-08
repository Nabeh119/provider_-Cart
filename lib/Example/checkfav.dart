import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_pro/Model/fav.dart';

class Checkfav extends StatelessWidget {
  const Checkfav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("CheckOut Favorite"),
        ),
        body: Consumer<Fav>(builder: (context, fav, child) {
          return ListView.builder(
              itemCount: fav.checkfav.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${fav.checkfav[index].name}"),
                  trailing: IconButton(
                    onPressed: () {
                      if (index < fav.checkfav.length) {
                        fav.checkfav.removeAt(index);
                        fav.notifyListeners();
                      }
                    },
                    icon: Icon(
                      Icons.remove,
                    ),
                  ),
                );
              });
        }));
  }
}
