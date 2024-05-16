import 'package:ekod_tp3/features/todos/todos.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TodosRepository {
  Future<List<Todo>> fetchTodos() async {
    try {
      final data = await Supabase.instance.client.from('todos').select();
      return data.map(Todo.fromJson).toList();
    } catch (error) {
      // TODO: Handle error in a better way
      print('Error fetching todos: $error');
      return [];
    }
  }

  Future<void> addTodo(Todo todo) async {
    throw UnimplementedError();
  }

  Future<void> deleteTodo(Todo todo) async {
    throw UnimplementedError();
  }
}
