import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:toddo_provider/model/services/notes_provider.dart';

import '../model/core/notes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[600],
      appBar: AppBar(
        title: Image.network(
            "https://media.istockphoto.com/photos/notebook-with-to-do-text-on-it-over-wood-office-desk-table-with-top-picture-id1152204631?k=20&m=1152204631&s=612x612&w=0&h=Chdx40VClX1pPpRnawlX9OWMzjNTTOohWR7uq7MzglE="),
        toolbarHeight: 200,
        titleSpacing: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogBox(context);
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.black87,
        ),
      ),
      body: Consumer<NotesProvider>(
        builder: (context, NotesProvider data, child) {
          return data.getNotes.isNotEmpty
              ? ListView.builder(
                  itemCount: data.getNotes.length,
                  itemBuilder: (context, index) {
                    return CardList(data.getNotes[index], index);
                  })
              : const Center(
                  child: Text("Add Notes Now"),
                );
        },
      ),
    );
  }
}

void showDialogBox(BuildContext context) {
  TextEditingController _titlecontrol = TextEditingController();
  TextEditingController _descontrol = TextEditingController();
  AlertDialog notedDialog = AlertDialog(
    title: const Text("Add A Note"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _titlecontrol,
          decoration: const InputDecoration(hintText: "Enter Title"),
        ),
        TextField(
          controller: _descontrol,
          decoration: const InputDecoration(hintText: "Enter Description"),
        ),
      ],
    ),
    actions: [
      TextButton(
          onPressed: () {
            Provider.of<NotesProvider>(context, listen: false)
                .addNotes(_titlecontrol.text, _descontrol.text);
            Navigator.of(context).pop();
          },
          child: const Text("Add Note"))
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return notedDialog;
      });
}

class CardList extends StatelessWidget {
  final Notes notes;
  int index;
  CardList(this.notes, this.index);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListTile(
          leading: const Icon(Icons.note),
          title: Text(notes.title),
          subtitle: Text(notes.description),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          caption: 'Delete',
          icon: Icons.delete,
          onTap: () {
            Provider.of<NotesProvider>(context, listen: false)
                .removeNotes(index);
          },
        )
      ],
    );
  }
}
