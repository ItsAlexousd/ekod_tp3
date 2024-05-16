part of 'todos_bloc.dart';

// Définition d'une classe abstraite pour les événements liés aux todos.
sealed class TodosEvent extends Equatable {
  const TodosEvent();

  // Propriétés utilisées pour la comparaison d'égalité.
  @override
  List<Object> get props => [];
}

// Définition de l'événement `TodosChanged`, déclenché lorsque la liste
// des todos change.
class TodosChanged extends TodosEvent {
  const TodosChanged(this.todos);

  // Liste des todos.
  final List<Todo> todos;

  // Redéfinition de la méthode `props` pour inclure la liste des todos,
  // permettant une comparaison d'égalité basée sur le contenu des todos.
  @override
  List<Object> get props => [todos];
}
