import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
        // header
        const DrawerHeader(
          child: Icon(Icons.note),
        ),
          // note title
          DrawerTile(
            title: 'Notes',
            leading: const Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),
          // setting title
          DrawerTile(
            title: "Settings",
            leading: const Icon(Icons.settings),
            onTap: () {},
          ),
        ],
      ),

    );
  }
}
