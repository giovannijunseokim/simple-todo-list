import 'package:flutter/material.dart';
import 'package:simple_todo_list/constants/todo_colors.dart';
import 'package:simple_todo_list/models/Todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
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
              print("");
            },
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                todo.todoContent,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: TodoColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
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
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
