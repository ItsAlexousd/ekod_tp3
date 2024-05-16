import 'package:bloc/bloc.dart';
import 'package:ekod_tp3/features/todos/todos.dart';
import 'package:equatable/equatable.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc({
    required this.todosRepository,
  }) : super(const TodosState()) {
    on<TodosFetchRequested>((event, emit) async {
      // Fetch todos from the repository
      emit(const TodosState(isLoading: true));
      final todos = await todosRepository.fetchTodos();
      emit(TodosState(todos: todos));
    });
  }

  final TodosRepository todosRepository;
}
