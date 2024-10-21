import 'package:flutter/material.dart';
import 'package:cool_app/components/drawer_title.dart';
import 'package:cool_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // header
          const DrawerHeader(
            child: Icon(Icons.edit),
          ),

          const SizedBox(height: 35),

          // notes tile
          DrawerTile(
            title: "Notes",
            leading: Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),
          // settings tile
          DrawerTile(
            title: "Settings",
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),
              ),
              );
            },
          ),
        ],
      ),
    );
  }
}