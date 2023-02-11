import 'package:flutter/material.dart';
import 'package:sqflite_crud_practice/Widgets/ItemWidget.dart';
import 'package:sqflite_crud_practice/services/CatalogModel.dart';

class PracticeUI extends StatefulWidget {
  PracticeUI({super.key});

  @override
  State<PracticeUI> createState() => _PracticeUIState();
}

class _PracticeUIState extends State<PracticeUI> {
  @override
  Widget build(BuildContext context) {
    final catalog = CatalogModel();
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    var size = MediaQuery.of(context).size;
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white.withOpacity(.1),
        //   elevation: 0,
        //   // foregroundColor: Colors.black,
        //   centerTitle: true,
        //   leading: IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.format_list_bulleted_sharp,
        //         color: Colors.black,
        //       )),
        //   title: Text(
        //     'List.Generate',
        //     style: TextStyle(
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
        //======================MEDIA QUERY PRACTICE=========================//
        // body: SafeArea(
        //   child: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Container(
        //           height: size.height * .07,
        //           width: size.width * .74,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: Colors.red,
        //           ),
        //         ),
        //         SizedBox(
        //           height: size.height * .01,
        //         ),
        //         Container(
        //           height: size.height * .07,
        //           width: size.width * .74,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: Colors.green,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        //================ListVIEW AD LIST.GENERATE PRACTICE====================//
        // body: Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: ListView.builder(
        //       itemCount: dummyList.length,
        //       itemBuilder: (context, index) {
        //         return ItemWidget(item: dummyList[index]);
        //       }),
        // ),

        body: Wrap(
      children: List.generate(catalog.items.length,
          (index) => ItemWidget(item: catalog.items[index])),
    ));
  }
}
