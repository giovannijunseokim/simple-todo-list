import 'package:flutter/material.dart';
import 'package:simple_todo_list/domain/models/todo.dart';
import 'package:simple_todo_list/ui/components/todo_add_box.dart';
import 'package:simple_todo_list/ui/components/todo_item.dart';
import 'package:simple_todo_list/ui/components/todo_modify_dialog.dart';
import 'package:simple_todo_list/ui/components/todo_search_box.dart';
import 'package:simple_todo_list/ui/constants/todo_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Todo> todoList = Todo.createDummyList();
  final todoAddBoxController = TextEditingController();
  final todoSearchBoxController = TextEditingController();
  List<Todo> searchedTodoItems = [];

  @override
  void initState() {
    super.initState();
    searchedTodoItems = todoList;
  }

  void checkTodoItem(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void addTodoItem(String todoContent) {
    if (todoContent.trim().isNotEmpty) {
      setState(() {
        todoList.insert(
          0,
          Todo(
            id: DateTime.now().toString(),
            todoContent: todoContent,
          ),
        );
        todoAddBoxController.clear();
      });
    }
  }

  void deleteTodoItem(String id) {
    setState(() {
      todoList.removeWhere((todoItem) => todoItem.id == id);
    });
  }

  void filterateTodoItem(String keyword) {
    List<Todo> results = [];
    if (keyword.isEmpty) {
      results = todoList;
    } else {
      for (var todoItem in todoList) {
        if (todoItem.todoContent
            .toLowerCase()
            .contains(keyword.toLowerCase())) {
          results.add(todoItem);
        }
      }
      results = todoList
          .where((todoItem) => todoItem.todoContent
              .toLowerCase()
              .contains(keyword.toLowerCase()))
          .toList();
    }

    setState(() {
      searchedTodoItems = results;
    });
  }

  void showModifyDialog(Todo todo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TodoModifyDialog(
          todo: todo,
          onSubmitted: modifyTodoItem,
        );
      },
    );
  }

  void modifyTodoItem(String modifiedTodoContent, Todo todo) {
    setState(() {
      todo.todoContent = modifiedTodoContent;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
            TodoSearchBox(
              controller: todoSearchBoxController,
              onChanged: filterateTodoItem,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: searchedTodoItems.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      child: const Text(
                        '모든 할 일',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }
                  return TodoItem(
                    todo: searchedTodoItems[index - 1],
                    onPressedCheckBox: checkTodoItem,
                    onPressedDeleteIcon: deleteTodoItem,
                    onTapTodoItem: showModifyDialog,
                  );
                },
                separatorBuilder: (context, index) {
                  if (index == 0) return const SizedBox.shrink();
                  return const SizedBox(height: 5);
                },
              ),
            ),
            TodoAddBox(
              controller: todoAddBoxController,
              onSubmitted: addTodoItem,
            )
          ],
        ),
      ),
    );
  }
}
