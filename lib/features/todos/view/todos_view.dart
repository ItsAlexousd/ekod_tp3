import 'package:ekod_tp3/features/todos/todos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
final todos = [
  TodoCard(
    title: 'Plan user research sessions',
    isCompleted: false,
    time: DateTime(2024, 5, 16, 15),
  ),
  const TodoCard(
    title: 'Plan the weekend in Berlin',
    isCompleted: false,
  ),
  TodoCard(
    title: 'Pack backpack',
    isCompleted: false,
    time: DateTime(2024, 5, 16, 16, 30),
  ),
  TodoCard(
    title: 'Stretch for 5 minutes',
    isCompleted: true,
    time: DateTime(2024, 5, 16, 19),
  ),
];
*/

class TodosView extends StatelessWidget {
  const TodosView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosBloc(
        todosRepository: context.read<TodosRepository>(),
      )..add(TodosFetchRequested()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Today',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<TodosBloc, TodosState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.todos.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (_, index) {
                  final todo = state.todos[index];
                  return TodoCard(
                    title: todo.title,
                    isCompleted: todo.isCompleted,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
