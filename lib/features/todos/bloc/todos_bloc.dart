import 'dart:async';

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
  }) : super(const TodosState(isLoading: true)) {
    // Écoute les événements de type `TodosLoadRequested`.
    on<TodosLoadRequested>((event, emit) async {
      todosRepository.loadTodos();
      _todosStream = todosRepository.todosStream.listen((todos) {
        add(TodosChanged(todos));
      });
    });
    // Écoute les événements de type `TodosChanged`.
    on<TodosChanged>((event, emit) async {
      emit(TodosState(todos: event.todos));
    });
  }

  final TodosRepository todosRepository;

  StreamSubscription<List<Todo>>? _todosStream;

  @override
  Future<void> close() {
    _todosStream?.cancel();
    return super.close();
  }
}
