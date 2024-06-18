import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_todo_list/domain/models/todo.dart';
import 'package:simple_todo_list/ui/components/drawer_menu_button.dart';
import 'package:simple_todo_list/ui/components/todo_add_box.dart';
import 'package:simple_todo_list/ui/components/todo_item.dart';
import 'package:simple_todo_list/ui/components/todo_modify_dialog.dart';
import 'package:simple_todo_list/ui/components/todo_search_box.dart';
import 'package:simple_todo_list/ui/constants/todo_colors.dart';
import 'package:simple_todo_list/ui/screens/drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var todoBox = Hive.box<Todo>('todoList');
  Iterable<Todo> searchedTodoItems = [];
  final todoAddBoxController = TextEditingController();
  final todoSearchBoxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchedTodoItems = todoBox.values;
  }

  void checkTodoItem(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
      todoBox.put(todo.id, todo);
    });
  }

  void addTodoItem(String todoContent) {
    if (todoContent.trim().isNotEmpty) {
      String createdAt = DateTime.now().toString();
      setState(() {
        todoBox.put(
          createdAt,
          Todo(
            id: createdAt,
            todoContent: todoContent,
          ),
        );
        todoAddBoxController.clear();
      });
    }
  }

  void deleteTodoItem(String id) {
    setState(() {
      todoBox.delete(id);
    });
  }

  void filterateTodoItem(String keyword) {
    Iterable<Todo> results = [];
    if (keyword.isEmpty) {
      results = todoBox.values;
    } else {
      results = todoBox.values.where((item) =>
          item.todoContent.toLowerCase().contains(keyword.toLowerCase()));
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
          onSubmitted: putTodoItem,
        );
      },
    );
  }

  void putTodoItem(String modifiedTodoContent, Todo todo) {
    setState(() {
      todo.todoContent = modifiedTodoContent;
      todoBox.put(todo.id, todo);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TodoColors.background,
      drawer: const DrawerScreen(),
      appBar: AppBar(
        backgroundColor: TodoColors.background,
        leading: const DrawerMenuButton(),
        title: const Text(
          "Todo App",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
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
      body: SafeArea(
        child: Container(
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
                      todo: searchedTodoItems
                          .elementAt(searchedTodoItems.length - index),
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
      ),
    );
  }
}
