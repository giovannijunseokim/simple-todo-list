import 'package:flutter/material.dart';
import 'package:simple_todo_list/constants/todo_colors.dart';

class TodoAddBox extends StatelessWidget {
  const TodoAddBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.add_rounded,
            color: TodoColors.black,
            size: 28,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: TextField(
                decoration: InputDecoration(
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
