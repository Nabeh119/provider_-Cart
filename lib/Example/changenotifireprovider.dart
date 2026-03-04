import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Provider1 extends StatefulWidget {
  @override
  State<Provider1> createState() => _Provider1State();
}

class _Provider1State extends State<Provider1> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Providers"),
        ),
        body: Consumer<Model>(
          builder: (context, model, child) {
            return WidgetChild();
          },
        ),
      ),
    );
  }
}

class WidgetChild extends StatelessWidget {
  const WidgetChild({super.key});

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Model>(context);
    return Column(
      children: [
        Center(
          child: Text("${model.name}"),
        ),
        MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            //  model.name = "AliALiAli";
            model.changeName();
          },
          child: Text("Do SomeThing"),
        ),
      ],
    );
  }
}

class Model extends ChangeNotifier {
  String name = "Welcome";
  void changeName() {
    name = "Nabeh";
    notifyListeners();
  }
}
