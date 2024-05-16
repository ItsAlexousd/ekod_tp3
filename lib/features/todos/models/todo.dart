import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  const Todo({
    required this.title,
    this.isCompleted = false,
    this.time,
  });

  // Méthode factory pour créer une instance de Todo à partir d'une
  // structure JSON.
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      // Extraction du titre à partir de la clé 'title' du JSON.
      title: json['title'] as String,
      // Extraction de l'état de complétion à partir de la clé 'completed'
      // du JSON.
      isCompleted: json['completed'] as bool,
      // Conversion de la chaîne de caractères en DateTime si la clé 'time'
      // est présente, sinon null.
      time:
          json['time'] != null ? DateTime.parse(json['time'] as String) : null,
    );
  }

  // Titre de la tâche.
  final String title;
  // Indicateur de complétion de la tâche.
  final bool isCompleted;
  // Date associée à la tâche.
  final DateTime? time;

  // Méthode pour convertir une instance de Todo en une structure JSON.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
      // Ajout de la date au format ISO 8601 au JSON, ou null si l'heure
      // est absente.
      'time': time?.toIso8601String(),
    };
  }

  // Méthode pour définir les propriétés utilisées pour la comparaison
  // d'égalité.
  @override
  List<Object?> get props => [title, isCompleted, time];
}
