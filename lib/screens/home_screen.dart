import 'package:flutter/material.dart';
import 'package:simple_todo_list/constants/todo_colors.dart';
import 'package:simple_todo_list/screens/todo_add_box.dart';
import 'package:simple_todo_list/screens/todo_search_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TodoColors.background,
      appBar: AppBar(
        title: const Text(
          "Todo App",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: const Icon(
          Icons.menu,
          size: 30,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.account_circle,
              size: 36,
              color: TodoColors.point,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: const Column(
          children: [
            TodoSearchBox(),
            Expanded(
              child: Column(),
            ),
            TodoAddBox()
          ],
        ),
      ),
    );
  }
}
