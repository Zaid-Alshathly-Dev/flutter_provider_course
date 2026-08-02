// lesson-(12)
// (add to card provider part 2)

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'model/item.dart';
import 'model/cart.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout"), backgroundColor: Colors.blue),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.basketitem.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text("${cart.basketitem[index].name}"),
                  trailing: IconButton(
                    onPressed: () {
                      cart.remove(cart.basketitem[index]);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
