import 'package:flutter/material.dart';
import 'package:simple_todo_list/components/todo_add_box.dart';
import 'package:simple_todo_list/components/todo_search_box.dart';
import 'package:simple_todo_list/constants/todo_colors.dart';
import 'package:simple_todo_list/models/Todo.dart';

import '../components/todo_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Todo> todoList = Todo.createDummyList();

    return Scaffold(
      backgroundColor: TodoColors.background,
      appBar: AppBar(
        backgroundColor: TodoColors.background,
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
        child: Column(
          children: [
            const TodoSearchBox(),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 20,
                        ),
                        child: const Text(
                          "모든 할 일",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (var todoItem in todoList)
                        TodoItem(
                          todo: todoItem,
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const TodoAddBox()
          ],
        ),
      ),
    );
  }
}
