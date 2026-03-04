import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Providerstudy extends StatefulWidget {
  const Providerstudy({super.key});

  @override
  State<Providerstudy> createState() => _ProviderstudyState();
}

class _ProviderstudyState extends State<Providerstudy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Providers'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) {
            return MyClass();
          }),
          ChangeNotifierProvider(create: (context) {
            return ProveOne();
          }),
        ],
        child: Column(
          children: [
            Consumer<MyClass>(
              builder: (context, myClass, child) {
                return Text(
                  myClass.showsomething,
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
            Consumer<ProveOne>(
              builder: (context, proveone, child) {
                return Text(
                  proveone.name,
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
            Consumer<MyClass>(
              builder: (context, myClass, child) {
                return MaterialButton(
                  child: const Text('do Something 1'),
                  onPressed: () {
                    myClass.doSomthingOne();
                  },
                );
              },
            ),
            Consumer<MyClass>(
              builder: (context, myClass, child) {
                return MaterialButton(
                  child: const Text('do Something 2'),
                  onPressed: () {
                    myClass.doSomthingTwo();
                  },
                );
              },
            ),
            Consumer<ProveOne>(
              builder: (context, proveone, child) {
                return MaterialButton(
                  child: const Text('Change Name ::'),
                  onPressed: () {
                    proveone.doChangeName();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyClass extends ChangeNotifier {
  var showsomething = "Show Somthing";

  doSomthingOne() {
    showsomething = "Show Something 1One1";
    notifyListeners();
  }

  doSomthingTwo() {
    showsomething = "Show Something 2Two2";
    notifyListeners();
  }
}

class ProveOne extends ChangeNotifier {
  String name = "Nabeh";

  doChangeName() {
    name = "Ali";
    notifyListeners();
  }
}
