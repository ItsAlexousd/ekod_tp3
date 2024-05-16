import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  const Todo({
    required this.title,
    this.isCompleted = false,
    this.time,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'] as String,
      isCompleted: json['completed'] as bool,
      time:
          json['time'] != null ? DateTime.parse(json['time'] as String) : null,
    );
  }

  final String title;
  final bool isCompleted;
  final DateTime? time;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
      'time': time?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [title, isCompleted, time];
}
