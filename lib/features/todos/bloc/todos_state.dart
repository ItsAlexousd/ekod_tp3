part of 'todos_bloc.dart';

// Définition de la classe représentant l'état des todos.
class TodosState extends Equatable {
  // Constructeur de l'état, avec des valeurs par défaut pour les todos et
  // l'indicateur de chargement.
  const TodosState({
    this.todos = const [],
    this.isLoading = false,
  });

  // Liste des todos.
  final List<Todo> todos;
  // Indicateur de chargement.
  final bool isLoading;

  // Méthode pour définir les propriétés utilisées pour la comparaison
  // d'égalité.
  @override
  List<Object> get props => [todos, isLoading];
}
