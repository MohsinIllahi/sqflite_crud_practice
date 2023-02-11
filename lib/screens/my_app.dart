// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late File _image;

//   @override
//   void initState() {
//     super.initState();
//     _checkPermissions();
//   }

//   Future<void> _checkPermissions() async {
//     await PermissionHandler().requestPermissions([PermissionGroup.camera, PermissionGroup.storage]);
//   }

//   Future<void> _getImage() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.camera);
//     setState(() {
//       _image = image as File;
//     });
//   }

//   Future<void> _getImageFromGallery() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _image = image as File;
//     });
//   }

//   void _showDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title:  Text("Select Source"),
//           actions: <Widget>[
//             MaterialButton(
//               child:  Text("Camera"),
//               onPressed: _getImage,
//             ),
//             MaterialButton(
//               child:  Text("Gallery"),
//               onPressed: _getImageFromGallery,
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Access Camera and Gallery'),
//       ),
//       body: Center(
//         child: _image == null
//             ? Text('No image selected.')
//             : Image.file(_image),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showDialog,
//         child: Icon(Icons.add_a_photo),
//       ),
//     );
//   }
// }
