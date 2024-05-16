import 'package:ekod_tp3/features/todos/todos.dart';
import 'package:rxdart/subjects.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Définition de la classe TodosRepository, qui gère les opérations liées
// aux todos.
class TodosRepository {
  TodosRepository() : _client = Supabase.instance.client;

  // Client Supabase pour interagir avec la base de données.
  final SupabaseClient _client;

  // Contrôleur de flux pour diffuser la liste des todos.
  final _todosStreamController = BehaviorSubject<List<Todo>>();

  // Flux des todos pour que le Bloc puissent écouter les changements.
  Stream<List<Todo>> get todosStream => _todosStreamController.stream;

  // Charger les todos depuis la base de données et les diffuser via le flux.
  void loadTodos() {
    _client.from('todos').stream(primaryKey: ['id']).listen((data) {
      // Conversion des données récupérées en instances de Todo.
      final todos = data.map(Todo.fromJson).toList();
      // Ajout des tâches à faire au flux.
      _todosStreamController.sink.add(todos);
    });
  }

  // Récupérer les todos depuis la base de données de manière asynchrone.
  Future<List<Todo>> fetchTodos() async {
    try {
      // Sélection des tâches à faire depuis la table 'todos' dans la
      // base de données.
      final data = await _client.from('todos').select();
      // Conversion des données récupérées en instances de Todo.
      return data.map(Todo.fromJson).toList();
    } catch (error) {
      // TODO: Gérer l'erreur de manière plus appropriée.
      return [];
    }
  }

  // Ajouter un nouveau todo dans la base de données. (Non implémenté)
  Future<void> addTodo(Todo todo) async {
    throw UnimplementedError();
  }

  // Supprimer un todo de la base de données. (Non implémenté)
  Future<void> deleteTodo(Todo todo) async {
    throw UnimplementedError();
  }
}
