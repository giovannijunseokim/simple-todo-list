import 'package:flutter/material.dart';
import 'package:simple_todo_list/constants/todo_colors.dart';

class TodoSearchBox extends StatelessWidget {
  const TodoSearchBox({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: TodoColors.black,
            size: 28,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextField(
                onChanged: onChanged,
                controller: controller,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "할 일 검색",
                    hintStyle: TextStyle(
                      color: TodoColors.grey,
                      fontSize: 16,
                      height: 2,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
