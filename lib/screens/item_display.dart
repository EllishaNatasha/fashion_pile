import 'package:flutter/material.dart';
import 'package:fashion_pile/widgets/left_drawer.dart';
import 'package:fashion_pile/widgets/item_list.dart';

class ItemListPage extends StatelessWidget {
  ItemListPage({super.key});

  final List<Item> dummy = [
    Item(
      'Sunglasses',
      10,
      'This is the description for item 1.',
    ),
    Item(
      'Belt',
      20,
      'This is the description for item 2',
    ),
    Item(
      'Necklace',
      30,
      'This is the description for item 3.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fashion Pile',
          style: TextStyle(
            color:  Color.fromARGB(255, 70, 6, 59),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                'Items',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                shrinkWrap: true,
                children: dummy.map((Item item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ItemCard(item),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}