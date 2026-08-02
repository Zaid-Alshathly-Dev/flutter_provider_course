// lesson-(11+12)
// (add to card provider part 1 + add to card provider part 2)

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/item.dart';
import 'model/cart.dart';
import 'checkout.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items = [
    Item(name: "Item 1", price: 10.0),
    Item(name: "Item 2", price: 20.0),
    Item(name: "Item 3", price: 30.0),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Checkout()));
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Consumer<Cart>(
                  builder: (conext, card, child) {
                    // return Text("${card.itemCount}");
                    return Text("${card.totalPrice}");
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          return Consumer<Cart>(
            builder: (context, cart, child) {
              return ListTile(
                title: Text(items[i].name),
                trailing: IconButton(
                  onPressed: () {
                    cart.add(items[i]);
                  },
                  icon: Icon(Icons.add),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
