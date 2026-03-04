import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Providerofcontext extends StatefulWidget {
  const Providerofcontext({super.key});

  @override
  State<Providerofcontext> createState() => _ProviderofcontextState();
}

class _ProviderofcontextState extends State<Providerofcontext> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyClass(),
      child: Scaffold(
        appBar: AppBar(),
        body: WidgetChild(),
      ),
    );
  }
}

class WidgetChild extends StatelessWidget {
  const WidgetChild({super.key});

  @override
  Widget build(BuildContext context) {
    //var model = Provider.of<MyClass>(context);
    var model = Provider.of<MyClass>(context);
    return Column(
      children: [
        Center(
          child: Text("${model.showsomething}"),
        ),
        MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            //  model.name = "AliALiAli";
            model.doSomthingTwo2();
          },
          child: Text("Do SomeThing"),
        ),
      ],
    );
  }
}

class MyClass extends ChangeNotifier {
  var showsomething = "Show Somthing";

  doSomthingOne1() {
    showsomething = "Show Something 1One1";
    notifyListeners();
  }

  doSomthingTwo2() {
    showsomething = "Show Something 2Two2";
    notifyListeners();
  }
}
