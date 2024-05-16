part of 'todos_bloc.dart';

// Définition d'une classe abstraite pour les événements liés aux todos.
sealed class TodosEvent extends Equatable {
  const TodosEvent();

  // Méthode pour définir les propriétés utilisées pour la comparaison
  // d'égalité.
  @override
  List<Object> get props => [];
}

// Définition de l'événement pour demander la récupération des todos.
class TodosFetchRequested extends TodosEvent {}
