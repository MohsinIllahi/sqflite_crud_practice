import 'package:flutter/material.dart';
import 'package:sqflite_crud_practice/screens/descriptionnote.dart';
import 'package:sqflite_crud_practice/services/NotesDBHelper.dart';

class NotesHomeUI extends StatefulWidget {
  const NotesHomeUI({super.key});

  @override
  State<NotesHomeUI> createState() => _NotesHomeUIState();
}

class _NotesHomeUIState extends State<NotesHomeUI> {
  //====================Insert DATABASE===============================//
  insertdatabase(title, description) {
    NoteDBHelper.instance.insert({
      NoteDBHelper.coltittle: title,
      NoteDBHelper.coldescription: description,
      NoteDBHelper.coldate: DateTime.now().toString(),
    });
  }

  //
  updatedatabase(snap, index, title, description) {
    NoteDBHelper.instance.update({
      NoteDBHelper.colid: snap.data![index][NoteDBHelper.colid],
      NoteDBHelper.coltittle: title,
      NoteDBHelper.coldescription: description,
      NoteDBHelper.coldate: DateTime.now().toString(),
    });
  }

//
  deletedatabase(snap, index) {
    NoteDBHelper.instance.delete(snap.data![index][NoteDBHelper.colid]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.07,
        title: const Text('Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: FutureBuilder(
            future: NoteDBHelper.instance.queryAll(),
            builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snap) {
              if (snap.hasData) {
                return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        deletedatabase(snap, index);
                      },
                      background: Container(
                        color: Colors.red.withOpacity(0.35),
                        child: const Icon(
                          Icons.delete,
                        ),
                      ),
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DescriptionNote(
                                          title: snap.data![index]
                                              [NoteDBHelper.coltittle],
                                          description: snap.data![index]
                                              [NoteDBHelper.coldescription],
                                        )));
                          },
                          leading: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    var tittle = '';
                                    var description = '';
                                    return AlertDialog(
                                      title: const Text('Edit Note'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            onChanged: (value) {
                                              tittle = value;
                                            },
                                            decoration: InputDecoration(
                                                hintText: snap.data![index]
                                                    [NoteDBHelper.coltittle]),
                                          ),
                                          TextField(
                                              onChanged: (value) {
                                                description = value;
                                              },
                                              decoration: InputDecoration(
                                                  hintText: snap.data![index][
                                                      NoteDBHelper
                                                          .coldescription])),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel')),
                                        TextButton(
                                            onPressed: () {
                                              updatedatabase(snap, index,
                                                  tittle, description);
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Save'))
                                      ],
                                    );
                                  },
                                );
                                //
                              },
                              icon: Icon(Icons.edit)),
                          title:
                              Text(snap.data![index][NoteDBHelper.coltittle]),
                          subtitle: Text(
                              snap.data![index][NoteDBHelper.coldescription]),
                          trailing: Text(snap.data![index][NoteDBHelper.coldate]
                              .toString()
                              .substring(0, 10)),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                    // child: CircularProgressIndicator(),
                    );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                var title = '';
                var description = '';
                return AlertDialog(
                  title: const Text('Add Note'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        onChanged: (value) {
                          title = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Tittle',
                        ),
                      ),
                      TextField(
                        onChanged: (value) {
                          description = value;
                          print(description);
                        },
                        decoration: InputDecoration(
                          hintText: 'Description',
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        insertdatabase(title, description);
                        Navigator.pop(context);
                      },
                      child: const Text('Save'),
                    ),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
