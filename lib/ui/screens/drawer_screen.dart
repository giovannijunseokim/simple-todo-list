import 'package:flutter/material.dart';
import 'package:simple_todo_list/ui/components/drawer_menu_item.dart';
import 'package:simple_todo_list/ui/constants/todo_colors.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: SafeArea(
        child: ListView(
          children: const [
            DrawerMenuItem(
              icon: Icons.checklist_rounded,
              title: '모든 할 일',
            ),
            DrawerMenuItem(
              icon: Icons.wb_sunny_outlined,
              title: '오늘 할 일',
            ),
            DrawerMenuItem(
              icon: Icons.history_rounded,
              title: '지난 할 일',
            ),
            DrawerMenuItem(
              icon: Icons.cached_rounded,
              title: '진행 중인 할 일',
            ),
            DrawerMenuItem(
              icon: Icons.check_box_outlined,
              title: '완료된 할 일',
            ),
            Divider(
              indent: 18,
              endIndent: 18,
              thickness: 0.2,
              color: TodoColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
