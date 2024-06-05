import 'package:flutter/material.dart';
import 'package:simple_todo_list/constants/todo_colors.dart';

class TodoAddBox extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;

  const TodoAddBox({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.add_rounded,
            color: TodoColors.black,
            size: 28,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextField(
                controller: controller,
                onSubmitted: onSubmitted,
                onTapOutside: (event) {
                  controller.clear();
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '할 일 추가',
                  hintStyle: TextStyle(
                    color: TodoColors.grey,
                    fontSize: 16,
                    height: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
