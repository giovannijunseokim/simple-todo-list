import 'package:flutter/material.dart';
import 'package:simple_todo_list/constants/todo_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TodoColors.background,
      appBar: AppBar(
        title: const Text(
          "Todo App",
        ),
      ),
      body: const Text(
        "Todo List Application",
      ),
    );
  }
}
