import 'package:flutter/material.dart';
import 'package:sqflite_crud_practice/services/CatalogModel.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[50],
      borderOnForeground: true,
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$ ${item.price.toString()}"),
      ),
    );
  }
}
