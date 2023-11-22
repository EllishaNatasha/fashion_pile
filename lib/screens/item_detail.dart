import 'package:flutter/material.dart';
import 'package:fashion_pile/models/item.dart';
import 'package:fashion_pile/widgets/left_drawer.dart';

class ItemDetail extends StatelessWidget {
  final Item item;

  const ItemDetail(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name),
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Name: ${item.fields.name}"),
            Text("Amount: ${item.fields.amount}"),
            Text("Description: ${item.fields.description}"),
            
          ],
        ),
      ),
    );
  }
}