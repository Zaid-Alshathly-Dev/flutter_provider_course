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

// // lesson-3
// // (Consumer Example)
// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ProvOne(),
//       child: Scaffold(
//         appBar: AppBar(title: const Text('Provider')),
//         body: ListView(
//           children: <Widget>[
//             Consumer<ProvOne>(
//               builder: (context, provone, child) {
//                 print("consumer text1");
//                 return Text(provone.showsomething1);
//               },
//             ), // Consumer

//             Consumer<ProvOne>(
//               builder: (context, provone, child) {
//                 print("consumer text2");
//                 return Text(provone.showsomething2);
//               },
//             ), // Consumer

//             Consumer<ProvOne>(
//               builder: (context, provone, child) {
//                 print("consumer button");
//                 return ElevatedButton(
//                   onPressed: () {
//                     provone.dosomething();
//                   },
//                   child: Text("Do Something : " + provone.showsomething1),
//                 ); // ElevatedButton
//               },
//             ), // Consumer
//           ], // <Widget>[]
//         ),
//       ),
//     );
//   }
// }

// class ProvOne extends ChangeNotifier {
//   var showsomething1 = "Hello 1";
//   var showsomething2 = "Hello 2";

//   void dosomething() {
//     showsomething1 = "Changed 1";
//     showsomething2 = "Changed 2";
//     notifyListeners();
//   }
// }

// // lesson-4
// // (selector)
// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ProvOne(),
//       child: Scaffold(
//         appBar: AppBar(title: const Text('Provider')),
//         body: ListView(
//           children: <Widget>[
//             // Selector<ProvOne, String>(
//             Selector<ProvOne, int>(
//               selector:(context,provs1) => provs1.showone,
//               builder: (context, provone, child) {
//                 print("selector text1");
//                 // return Text(provone);
//                 return Text("${provone}");
//               },
//             ), // Consumer

//             Selector<ProvOne,String>(
//               selector:(context,provs1) => provs1.showtwo,
//               builder: (context, provone, child) {
//                 print("selector text2");
//                 return Text(provone);
//               },
//             ), // Consumer

//             Consumer<ProvOne>(
//               builder: (context, provone, child) {
//                 // print("consumer button 1");
//                 return ElevatedButton(
//                   onPressed: () {
//                     provone.dosomething();
//                   },
//                   child: Text("Do Something 1 "),
//                 ); // ElevatedButton
//               },
//             ), // Consumer
//             Consumer<ProvOne>(
//               builder: (context, provone, child) {
//                 // print("consumer button 2");
//                 return ElevatedButton(
//                   onPressed: () {
//                     provone.dosomething2();
//                   },
//                   child: Text("Do Something 2 "),
//                 ); // ElevatedButton
//               },
//             ),
//           ], // <Widget>[]
//         ),
//       ),
//     );
//   }
// }

// class ProvOne extends ChangeNotifier {
//   // var showsomething1 = "Hello 1";
//   var showsomething1 = 1;
//   var showsomething2 = "Hello 2";

//   get showone => showsomething1;
//   get showtwo => showsomething2;

//    dosomething() {
//     showsomething1++;
//     notifyListeners();
//   }
//    dosomething2() {
//     showsomething2 = "yes prdovider 2";
//     notifyListeners();
//   }
// }

// lesson-5
// (scope provider)
// "مفهوم نطاق البروفايدر (Provider Scope) يتعلق بالحدود والمساحة التي تكون فيها البيانات المعرفة عبر إدارة الحالات (State Management) بـ Provider متاح ومقروء داخل شجرة الـ Widgets في التطبيقات (خاصة في تطبيق مثل Flutter)."

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Model(),
//       child: Scaffold(
//         appBar: AppBar(title: const Text('Provider')),
//         body: Column(
//           children: [
//             Center(child: Text("Welcome")),
//             const SizedBox(height: 10),
//             MaterialButton(
//               color: Colors.blue,
//               textColor: Colors.white,
//               onPressed: () {},
//               child: const Text('Do something'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Model extends ChangeNotifier {
//   String name = "Welcome";

//   ChangeName() {
//     name = "Zaid";
//   }
// }

// lesson-6
// (provider of(context))
class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Provider')),
        body: WidgetChild(),
      ),
    );
  }
}

class WidgetChild extends StatelessWidget {
  const WidgetChild({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Model>(context);

    return Container(
      child: Column(
        children: [
          Center(child: Text("${model.name}")),
          const SizedBox(height: 10),
          MaterialButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              model.ChangeName();
              print(model.name);
            },
            child: const Text('Do something'),
          ),
        ],
      ),
    );
  }
}

class Model extends ChangeNotifier {
  String name = "Welcome";

  ChangeName() {
    name = "Zaid";
    notifyListeners();  
  }
}
