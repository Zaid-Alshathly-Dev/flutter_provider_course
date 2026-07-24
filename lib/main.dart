import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Course',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

// // lesson-2
// // (ChangeNotifierProvider And Consumer)
// class _MyWidgetState extends State<MyWidget> {
//   // String name = "welcome";

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Model(),
//       child: Scaffold(
//         appBar: AppBar(title: const Text('Provider')),
//         body: Consumer<Model>(
//           builder: (context, model, child) {
//             return Column(
//               children: [
//                 Center(child: Text("${model.name}")),
//                 const SizedBox(height: 10),
//                 MaterialButton(
//                   color: Colors.blue,
//                   textColor: Colors.white,
//                   onPressed: () {
//                     model.ChangeName();
//                     print(model.name);
//                   },
//                   child: const Text('Do something'),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   // Scaffold(
//   //   appBar: AppBar(title: const Text('Provider')),
//   //   body: Column(
//   //     children: [
//   //       Center(child: Text("$name")),
//   //       const SizedBox(height: 10),
//   //       MaterialButton(
//   //         color: Colors.blue,
//   //         textColor: Colors.white,
//   //         onPressed: () {
//   //           setState(() {
//   //             name = "zaid";
//   //           });
//   //         },
//   //         child: const Text('Do something'),
//   //       ),
//   //     ],
//   //   ),
//   // );
// }

// class Model extends ChangeNotifier {
//   String name = "zaid";

//   ChangeName() {
//     name = "welcome";
//     notifyListeners();
//   }
// }

// lesson-3
// (Consumer Example)
class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProvOne(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Provider')),
        body: ListView(
          children: <Widget>[
            Consumer<ProvOne>(
              builder: (context, provone, child) {
                print("consumer text1");
                return Text(provone.showsomething1);
              },
            ), // Consumer

            Consumer<ProvOne>(
              builder: (context, provone, child) {
                print("consumer text2");
                return Text(provone.showsomething2);
              },
            ), // Consumer

            Consumer<ProvOne>(
              builder: (context, provone, child) {
                print("consumer button");
                return ElevatedButton(
                  onPressed: () {
                    provone.dosomething();
                  },
                  child: Text("Do Something : " + provone.showsomething1),
                ); // ElevatedButton
              },
            ), // Consumer
          ], // <Widget>[]
        ),
      ),
    );
  }
}

class ProvOne extends ChangeNotifier {
  String showsomething1 = "Hello 1";
  String showsomething2 = "Hello 2";

  void dosomething() {
    showsomething1 = "Changed 1";
    showsomething2 = "Changed 2";
    notifyListeners();
  }
}
