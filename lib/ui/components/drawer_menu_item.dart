import 'package:flutter/material.dart';
import 'package:simple_todo_list/ui/constants/todo_colors.dart';
import 'package:simple_todo_list/ui/screens/past_screen.dart';
import 'package:simple_todo_list/ui/screens/today_screen.dart';

class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const DrawerMenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (Scaffold.of(context).isDrawerOpen) {
          Scaffold.of(context).closeDrawer();
        }
        switch (title) {
          case '오늘 할 일':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const TodayScreen();
                },
              ),
            );
          case '지난 할 일':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const PastScreen();
                },
              ),
            );
          default:
            return;
        }
      },
      leading: Icon(
        icon,
        color: TodoColors.point,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: TodoColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Text(
        '10',
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
