import 'package:flutter/material.dart';

class DescriptionNote extends StatefulWidget {
  var title;
  var description;
  DescriptionNote({super.key, required this.title, required this.description});

  @override
  State<DescriptionNote> createState() => _DescriptionNoteState();
}

class _DescriptionNoteState extends State<DescriptionNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.07,
        title: const Text('Note Description'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: ListTile(
                          title: Text(widget.title),
                          subtitle: Text(widget.description),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
