import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // Text controller to access what the user typed
  final textController = TextEditingController();

  // List to store notes
  List<String> notes = [];

  // Create a note
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: "Enter your note"),
        ),
        actions: [
          // Create button
          MaterialButton(
            onPressed: () {
              setState(() {
                // Add the entered note to the list
                notes.add(textController.text);
              });

              // Close the dialog and clear the text
              Navigator.of(context).pop();
              textController.clear();
            },
            color: Colors.grey,
            child: const Text(
              'Add Note',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // Update the note
  void updateNoteDialog(int index) {
    // Pre-fill the text controller with the current note
    textController.text = notes[index];
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: "Edit your note"),
        ),
        actions: [
          // Update button
          MaterialButton(
            onPressed: () {
              setState(() {
                // Update the note
                notes[index] = textController.text;
              });

              // Close the dialog and clear the text
              Navigator.of(context).pop();
              textController.clear();
            },
            color: Colors.blue,
            child: const Text(
              'Update Note',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // Delete the note
  void deleteNoteDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Are you sure you want to delete this note?"),
        actions: [
          // Cancel button
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.grey[500],
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
          ),
          // Confirm delete button
          MaterialButton(
            onPressed: () {
              setState(() {
                // Remove the note from the list
                notes.removeAt(index);
              });

              // Close the dialog
              Navigator.of(context).pop();
            },
            color: Colors.red,
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.white),
            ),
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
        backgroundColor: Colors.transparent,// this centers the title in the appbar
      ),
      backgroundColor: Theme.of(context).colorScheme.surface, 
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        mini: false, // You can set this to true for a smaller round button
        shape: const CircleBorder(),
        child: const Icon(Icons.add), // Ensures the button remains circular
        backgroundColor: Colors.grey[400], 
        foregroundColor: Colors.black,
      ),
      // Displaying the list of notes
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          // HEADING 
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Notes',
              style: GoogleFonts.dmSerifText(fontSize: 48,
              color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ), 

          // LIST OF NOTES 
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Edit button
                      IconButton(
                        onPressed: () => updateNoteDialog(index),
                        icon: Icon(
                          Icons.edit,
                          color: Colors.grey[600], // Set edit icon to grey[600]
                        ),
                      ),
                      // Delete button
                      IconButton(
                        onPressed: () => deleteNoteDialog(index),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[600], // Set delete icon to grey[600]
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
