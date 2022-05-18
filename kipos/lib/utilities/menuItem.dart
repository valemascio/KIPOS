import 'package:flutter/material.dart';

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  List<MenuItem> firstItems = [logout, unauthorize];
  List<MenuItem> secondItems = [delete];

  static const logout = MenuItem(text: 'Log out', icon: Icons.logout_outlined);
  static const unauthorize =
      MenuItem(text: 'Unauthorize FitBit', icon: Icons.block_outlined);
  static const delete =
      MenuItem(text: 'Delete Data', icon: Icons.delete_forever_rounded);

  Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 22),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.logout:
        print('Logout');
        break;
      case MenuItems.unauthorize:
        print('unauthorize');
        break;
      case MenuItems.delete:
        print('delete');
        break;
    }
  }
}
