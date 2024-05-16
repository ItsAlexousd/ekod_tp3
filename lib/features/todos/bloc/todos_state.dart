part of 'todos_bloc.dart';

class TodosState extends Equatable {
  const TodosState({
    this.todos = const [],
    this.isLoading = false,
  });

  final List<Todo> todos;
  final bool isLoading;

  @override
  List<Object> get props => [todos, isLoading];
}
