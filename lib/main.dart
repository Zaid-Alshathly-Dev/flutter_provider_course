// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Provider Course',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const Providers(),
//     );
//   }
// }

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text('MyWidget placeholder')));
//   }
// }

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

// // lesson-6
// // (provider of(context))
// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Model(),
//       child: Scaffold(
//         appBar: AppBar(title: const Text('Provider')),
//         body: WidgetChild(),
//       ),
//     );
//   }
// }

// class WidgetChild extends StatelessWidget {
//   const WidgetChild({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     var model = Provider.of<Model>(context);

//     return Container(
//       child: Column(
//         children: [
//           Center(child: Text("${model.name}")),
//           const SizedBox(height: 10),
//           MaterialButton(
//             color: Colors.blue,
//             textColor: Colors.white,
//             onPressed: () {
//               model.ChangeName();
//               print(model.name);
//             },
//             child: const Text('Do something'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Model extends ChangeNotifier {
//   String name = "Welcome";

//   ChangeName() {
//     name = "Zaid";
//     notifyListeners();
//   }
// }

// // lesson-7
// // (context.watch() and context.read() )
// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Model(),
//       child: Scaffold(
//         appBar: AppBar(title: const Text('Provider')),
//         body: WidgetChild(),
//       ),
//     );
//   }
// }

// class WidgetChild extends StatelessWidget {
//   const WidgetChild({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // var model = Provider.of<Model>(context, listen: false);
//     // var model = Provider.of<Model>(context, listen: true);

//     return Container(
//       child: Column(
//         children: [
//           // Center(child: Text("${context.read<Model>().name}")),
//           Center(child: Text("${context.watch<Model>().name}")),
//           const SizedBox(height: 10),
//           MaterialButton(
//             color: Colors.blue,
//             textColor: Colors.white,
//             onPressed: () {
//               context.read<Model>().ChangeName();

//             },
//             // onPressed: () {
//             //   model.ChangeName();
//             //   print(model.name);
//             // },
//             child: const Text('Do something'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Model extends ChangeNotifier {
//   String name = "Welcome";

//   ChangeName() {
//     name = "Zaid";
//     notifyListeners();
//   }
// }

// // lesson-8
// // (Provider vs ChangeNotifierProvider)
// class Providers extends StatelessWidget {
//   const Providers({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Providers')), // AppBar
//       drawer: const Drawer(),
//       // body: ChangeNotifierProvider<MyModel>(
//       body: Provider<MyModel>(
//         create: (context) {
//           return MyModel();
//         },
//         child: Column(
//           children: <Widget>[
//             Container(
//               child: Consumer<MyModel>(
//                 builder: (context, myModel, child) {
//                   // print(myModel.showsomthing);
//                   return Text(myModel.showsomthing);
//                 },
//               ), // Consumer
//             ), // Container

//             Container(
//               child: Consumer<MyModel>(
//                 builder: (context, myModel, child) {
//                   print(myModel.doSomthingone());
//                   return ElevatedButton(
//                     onPressed: () {
//                       myModel.doSomthingone();
//                     },
//                     child: const Text('Do Something One'),
//                   );
//                 },
//               ),
//             ),

//             Container(
//               child: Consumer<MyModel>(
//                 builder: (context, myModel, child) {
//                   print(myModel.doSomthingtwo());
//                   return ElevatedButton(
//                     onPressed: () {
//                       myModel.doSomthingtwo();
//                     },
//                     child: const Text('Do Something Two'),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // class MyModel with ChangeNotifier {
// class MyModel {
//   var showsomthing = "show something";
//   doSomthingone() {
//     showsomthing = "provider yes one";
//     print(showsomthing);
//     // notifyListeners();
//   }

//   doSomthingtwo() {
//     showsomthing = "provider yes two";
//     print(showsomthing);
//     // notifyListeners();
//   }
// }

// lesson-9
// (MultiProvider)
// class Providers extends StatelessWidget {
//   const Providers({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Providers')), // AppBar
//       drawer: const Drawer(),
//       // body: ChangeNotifierProvider<MyModel>(
//       body: MultiProvider(
//         providers: [
//           ChangeNotifierProvider(
//             create: (context) {
//               return MyModel();
//             },
//           ),

//           Provider(
//             create: (context) {
//               return provOne();
//             },
//           ),
//         ],
//         child: Column(
//           children: <Widget>[
//             Container(
//               child: Consumer<MyModel>(
//                 builder: (context, myModel, child) {
//                   return Text(myModel.showsomthing);
//                 },
//               ), // Consumer
//             ),
//             // Container
//             Container(
//               child: Consumer<provOne>(
//                 builder: (context, prove, child) {
//                   return Text(prove.name);
//                 },
//               ), // Consumer
//             ),
//             // Container
//             // Container
//             Container(
//               child: Consumer<provOne>(
//                 builder: (context, prove, child) {
//                   return ElevatedButton(
//                     onPressed: () {
//                       prove.doSomthingprovone();
//                     },
//                     child: const Text('Do Something one'),
//                   );
//                 },
//               ),
//             ),
//             Container(
//               child: Consumer<MyModel>(
//                 builder: (context, myModel, child) {
//                   return ElevatedButton(
//                     onPressed: () {
//                       myModel.doSomthingtwo();
//                     },
//                     child: const Text('Do Something Two'),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // class MyModel with ChangeNotifier {
// class MyModel with ChangeNotifier {
//   var showsomthing = "show something";
//   doSomthingone() {
//     showsomthing = "provider yes one";
//     print(showsomthing);
//     notifyListeners();
//   }

//   doSomthingtwo() {
//     showsomthing = "provider yes two";
//     print(showsomthing);
//     notifyListeners();
//   }
// }

// class provOne {
//   var name = "Zaid";
//   doSomthingprovone() {
//     name = "Alshathly";
//     // notifyListeners();
//   }
// }

// // lesson-10
// // summary providers
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) {
//         return provAll();
//       },
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
//         home: const MyHomePage(title: 'Flutter Demo Home Page'),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: .center,
//           children: [
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class provAll with ChangeNotifier {
//   String name = "Zaid";
// }

// lesson-(11+12)
// (add to card provider part 1 + add to card provider part 2)

import 'package:flutter/material.dart';
import 'package:flutter_provider_course/Home.dart';
import 'package:provider/provider.dart';
import 'model/cart.dart';

void main() {
  runApp(firstApp());
}

class firstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: MaterialApp(
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        title: "Smart Home",
        home: Home(),
      ),
    );
  }
}
