import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_todo_list/constants/todo_fonts.dart';
import 'package:simple_todo_list/screens/home_screen.dart';

import 'constants/todo_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    removeSystemNavigationBarColor();

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: TodoFontFamily.pretendard),
        home: const HomeScreen(),
      ),
    );
  }

  void removeSystemNavigationBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: TodoColors.background,
      ),
    );
  }
}
