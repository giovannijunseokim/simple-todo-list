import 'package:flutter/material.dart';
import 'package:simple_todo_list/components/todo_add_box.dart';
import 'package:simple_todo_list/components/todo_item.dart';
import 'package:simple_todo_list/components/todo_search_box.dart';
import 'package:simple_todo_list/constants/todo_colors.dart';
import 'package:simple_todo_list/models/Todo.dart';

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
              child: ListView.separated(
                itemCount: todoList.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      child: const Text(
                        '모든할일',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }
                  return TodoItem(
                    todo: todoList[index - 1],
                  );
                },
                separatorBuilder: (context, index) {
                  if (index == 0) return const SizedBox.shrink();
                  return const SizedBox(height: 5);
                },
              ),
            ),
            const TodoAddBox()
          ],
        ),
      ),
    );
  }
}
