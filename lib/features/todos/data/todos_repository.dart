import 'package:ekod_tp3/features/todos/todos.dart';
import 'package:rxdart/subjects.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TodosRepository {
  TodosRepository()
      : _client = Supabase.instance.client,
        _todosStreamController = BehaviorSubject();

  final SupabaseClient _client;
  final BehaviorSubject<List<Todo>> _todosStreamController;

  Stream<List<Todo>> get todosStream => _todosStreamController.stream;

  void loadTodos() {
    _client
        .from('todos')
        .stream(primaryKey: ['id']).listen((List<Map<String, dynamic>> data) {
      final todos = data.map(Todo.fromJson).toList();
      _todosStreamController.sink.add(todos);
    });
  }

  Future<List<Todo>> fetchTodos() async {
    try {
      final data = await _client.from('todos').select();
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
