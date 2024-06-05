import 'package:flutter/material.dart';
import 'package:simple_todo_list/constants/todo_colors.dart';
import 'package:simple_todo_list/models/Todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onPressedCheckBox;
  final Function(String) onPressedDeleteIcon;

  const TodoItem(
      {super.key,
      required this.todo,
      required this.onPressedCheckBox,
      required this.onPressedDeleteIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: TodoColors.white,
      ),
      child: Row(
        children: [
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: todo.isDone
                ? const Icon(Icons.check_box)
                : const Icon(Icons.check_box_outline_blank),
            iconSize: 28,
            style: const ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            highlightColor: Colors.transparent,
            constraints: const BoxConstraints(),
            color: TodoColors.point,
            onPressed: () {
              onPressedCheckBox(todo);
            },
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                todo.todoContent,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: TodoColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  decoration: todo.isDone ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: TodoColors.point,
            ),
            child: IconButton(
              padding: const EdgeInsets.all(10),
              style: const ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap),
              highlightColor: Colors.transparent,
              constraints: const BoxConstraints(),
              icon: const Icon(
                Icons.delete,
                size: 18,
                color: TodoColors.white,
              ),
              onPressed: () {
                onPressedDeleteIcon(todo.id);
              },
            ),
          )
        ],
      ),
    );
  }
}
