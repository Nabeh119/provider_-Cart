import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectorScreen extends StatefulWidget {
  const SelectorScreen({super.key});

  @override
  _SelectorScreenState createState() => _SelectorScreenState();
}

class _SelectorScreenState extends State<SelectorScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProveOne(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Selector"),
        ),
        body: ListView(
          children: [
            Selector<ProveOne, int>(
              selector: (context, proves1) => proves1.showone,
              builder: (context, ProveOne, child) {
                print("Selector Text1");
                return Text("${ProveOne}");
              },
            ),
            Selector<ProveOne, String>(
              selector: (context, proves2) => proves2.showtwo,
              builder: (context, ProveOne, child) {
                print("Selector Text2");
                return Text(ProveOne);
              },
            ),
            Consumer<ProveOne>(
              builder: (context, ProveOne, child) {
                return MaterialButton(
                  color: Colors.grey,
                  child: Text("Do SomeThing 1"),
                  onPressed: () {
                    ProveOne.doSomething1();
                  },
                );
              },
            ),
            Consumer<ProveOne>(
              builder: (context, ProveOne, child) {
                return MaterialButton(
                  color: Colors.grey,
                  child: Text("Do SomeThing 2"),
                  onPressed: () {
                    ProveOne.doSomething2();
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

class ProveOne with ChangeNotifier {
  var showSomething1 = 1;
  var showSomething2 = "Show Something";

  get showone => showSomething1;

  get showtwo => showSomething2;

  doSomething1() {
    showSomething1++;
    notifyListeners();
  }

  doSomething2() {
    showSomething2 = "Yes, Provider 2";
    notifyListeners();
  }
}
