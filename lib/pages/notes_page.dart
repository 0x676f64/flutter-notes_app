import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cool_app/components/drawer.dart';
import 'package:cool_app/components/note_tile.dart';
import 'package:cool_app/theme/theme.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final textController = TextEditingController();
  List<String> notes = [];  // This is your currentNotes

  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: "Enter your note"),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              setState(() {
                notes.add(textController.text);
              });
              Navigator.of(context).pop();
              textController.clear();
            },
            color: Colors.grey,
            child: const Text('Add Note', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void updateNoteDialog(int index) {
    textController.text = notes[index];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: "Edit your note"),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              setState(() {
                notes[index] = textController.text;
              });
              Navigator.of(context).pop();
              textController.clear();
            },
            color: Colors.blue,
            child: const Text('Update Note', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void deleteNoteDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Are you sure you want to delete this note?"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.grey[500],
            child: const Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                notes.removeAt(index);
              });
              Navigator.of(context).pop();
            },
            color: Colors.red,
            child: const Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        shape: const CircleBorder(), // Ensures the button is circular
        child: const Icon(Icons.add),
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Notes',
              style: GoogleFonts.dmSerifText(
                fontSize: 48,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return NoteTile(
                  text: note,
                  onEditPressed: () => updateNoteDialog(index),
                  onDeletePressed: () => deleteNoteDialog(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
