import 'package:ekod_tp3/features/todos/todos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosView extends StatelessWidget {
  const TodosView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Création du Bloc pour les todos.
      create: (context) => TodosBloc(
        todosRepository: context.read<TodosRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Today',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // Zone sûre pour éviter les zones non sécurisées comme les encoches et
        // les bords d'écran.
        body: SafeArea(
          // BlocBuilder pour reconstruire l'interface utilisateur en
          // fonction de l'état du Bloc.
          child: BlocBuilder<TodosBloc, TodosState>(
            builder: (context, state) {
              // Affiche un indicateur de progression circulaire si l'état
              // est en cours de chargement.
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
              return ListView.separated(
                // Marges intérieures de la liste.
                padding: const EdgeInsets.all(16),
                // Nombre d'éléments dans la liste.
                itemCount: state.todos.length,
                // Séparateur entre les éléments de la liste, avec une
                // hauteur de 16px.
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                // Constructeur d'éléments de la liste.
                itemBuilder: (_, index) {
                  // Récupère chaque todo par son index.
                  final todo = state.todos[index];
                  // Retourne une carte de todo.
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
