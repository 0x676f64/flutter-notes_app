import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final Widget leading;
  final void Function()? onTap;

  const DrawerTile({
    super.key,
    required this.title,
    required this.leading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Better padding for spacing
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface, // Better contrast
            fontSize: 16, // Optional: Adjust the font size for better visibility
          ),
        ),
        leading: IconTheme(
          data: IconThemeData(
            color: Theme.of(context).colorScheme.onSurface, // Ensure icon uses the right color
          ),
          child: leading, // Display the passed leading widget (icon)
        ),
        onTap: onTap,
      ),
    );
  }
}
