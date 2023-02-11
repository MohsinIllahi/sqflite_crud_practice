import 'package:flutter/material.dart';

class CatalogModel {
  List<Item> items = [
    Item(
        id: 1,
        name: 'iPhone 12 pro',
        price: 999,
        color: "#33505a",
        image:
            "https://images.pexels.com/photos/12741170/pexels-photo-12741170.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        desc: 'Iphone 13 pro'),
    Item(
        id: 1,
        name: 'iPhone 13 pro',
        price: 999,
        color: "#33505a",
        image:
            "https://images.pexels.com/photos/12741170/pexels-photo-12741170.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        desc: 'Iphone 13 pro'),
    Item(
        id: 1,
        name: 'iPhone 14 pro',
        price: 999,
        color: "#33505a",
        image:
            "https://images.pexels.com/photos/12741170/pexels-photo-12741170.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        desc: 'Iphone 13 pro')
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  Item(
      {required this.id,
      required this.color,
      required this.desc,
      required this.image,
      required this.name,
      required this.price});
}
