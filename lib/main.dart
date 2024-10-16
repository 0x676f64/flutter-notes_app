import 'package:cool_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/notes_page.dart';

void main() {
  runApp(
    const MyApp(), // Only call MyApp here.
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false, // This disables the debug banner
            home: const NotesPage(),
            theme: themeProvider.themeData, // Access the theme from provider
          );
        },
      ),
    );
  }
}
