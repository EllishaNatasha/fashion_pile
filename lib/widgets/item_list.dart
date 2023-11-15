import 'package:flutter/material.dart';
import 'package:fashion_pile/widgets/left_drawer.dart';

class Item {
  final String name;
  final int amount;
  final String description;

  Item(this.name, this.amount, this.description);
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.pink,
      
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),

                const Padding(padding: EdgeInsets.all(5)),
                Text(
                  'Amount: ${item.amount.toString()}',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),

                const Padding(padding: EdgeInsets.all(1)),
                Text(
                  item.description,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
       )
    );
  }
}