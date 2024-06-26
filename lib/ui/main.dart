import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_todo_list/domain/models/todo.dart';
import 'package:simple_todo_list/ui/constants/todo_colors.dart';
import 'package:simple_todo_list/ui/constants/todo_fonts.dart';
import 'package:simple_todo_list/ui/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('todoList');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

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
