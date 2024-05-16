import 'package:bloc/bloc.dart';
import 'package:ekod_tp3/features/todos/todos.dart';
import 'package:equatable/equatable.dart';

// Indique que ces fichiers font partie du fichier 'todos_bloc.dart'.
part 'todos_event.dart';
part 'todos_state.dart';

// Définition de la classe TodosBloc, qui gère la logique des événements et des
// états pour les todos.
class TodosBloc extends Bloc<TodosEvent, TodosState> {
  // Constructeur du Bloc, nécessitant un repository pour les todos.
  TodosBloc({
    required this.todosRepository,
  }) : super(const TodosState()) {
    // Écoute les événements de type `TodosFetchRequested`.
    on<TodosFetchRequested>((event, emit) async {
      // Émet un état de chargement.
      emit(const TodosState(isLoading: true));
      // Récupère les tâches à faire à partir du repository.
      final todos = await todosRepository.fetchTodos();
      // Émet un nouvel état avec les tâches récupérées.
      emit(TodosState(todos: todos));
    });
  }

  final TodosRepository todosRepository;
}
