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
    // Charge les tâches à faire depuis le repository.
    todosRepository.loadTodos();
    // Écoute les changements dans le flux de todos et déclenche un événement
    // `TodosChanged` quand les données sont mises à jour.
    _todosStream = todosRepository.todosStream.listen((todos) {
      add(TodosChanged(todos));
    });

    // Écoute les événements de type `TodosChanged`.
    on<TodosChanged>((event, emit) async {
      // Émet un nouvel état avec la liste mise à jour des tâches.
      emit(TodosState(todos: event.todos));
    });
  }

  final TodosRepository todosRepository;

  // Abonnement au flux des todos pour écouter les mises à jour.
  StreamSubscription<List<Todo>>? _todosStream;

  @override
  Future<void> close() {
    // Annule l'abonnement au flux lorsqu'on ferme le Bloc.
    _todosStream?.cancel();
    return super.close();
  }
}
