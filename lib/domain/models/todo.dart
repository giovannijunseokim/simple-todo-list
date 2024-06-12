import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo {
  @HiveField(0)
  String id;
  @HiveField(1)
  String todoContent;
  @HiveField(2)
  bool isDone;

  Todo({
    required this.id,
    required this.todoContent,
    this.isDone = false,
  });

  static List<Todo> createDummyList() {
    return [
      Todo(id: '01', todoContent: 'Dart 공부하기', isDone: true),
      Todo(id: '02', todoContent: 'Flutter Framework 이해하기', isDone: true),
      Todo(id: '03', todoContent: 'StatefulWidget 공부하기'),
      Todo(id: '04', todoContent: '거래처 연락하기'),
      Todo(id: '05', todoContent: '메일 확인하기'),
      Todo(id: '06', todoContent: '마트 장보기'),
      Todo(id: '07', todoContent: '은행 업무보기'),
      Todo(id: '08', todoContent: '운동하기'),
      Todo(id: '09', todoContent: '숙소 예약하기'),
      Todo(id: '10', todoContent: '식당 예약하기'),
    ];
  }
}
