import 'package:ekod_tp3/features/todos/todos.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TodosRepository {
  Future<void> addTodo(Todo todo) async {
    // Add new todo to the network
  }

  Future<List<Todo>> fetchTodos() async {
    try {
      final data = await Supabase.instance.client.from('todos').select();
      return data.map(Todo.fromJson).toList();
    } catch (error) {
      print('Error fetching todos: $error');
      return [];
    }
  }

  Future<void> deleteTodo(Todo todo) async {
    // Delete todo from the network
  }
}
