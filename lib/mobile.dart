// // lesson-10
// // summary providers

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'main.dart' show provAll;

// class Mobile extends StatefulWidget {
//   const Mobile({super.key});

//   @override
//   State<Mobile> createState() => _MobileState();
// }

// class _MobileState extends State<Mobile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Consumer<provAll>(
//           builder: (context, prov, child) {
//             return Text("mobile");
//           },
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: .center,
//           children: [
//             const Text('You have pushed the button this many times:'),
//             Text(""),
//           ],
//         ),
//       ),
//     );
//   }
// }
