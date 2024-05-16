import 'package:ekod_tp3/features/todos/todos.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    required this.title,
    required this.isCompleted,
    this.time,
    super.key,
  });

  final String title;
  final bool isCompleted;
  final DateTime? time;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      // Déclenche une action lorsqu'une case à cocher est modifiée.
      onChanged: (value) {},
      // Définit la valeur actuelle de la case à cocher, en fonction de l'état
      // de complétion de la tâche.
      value: isCompleted,
      // Place la case à cocher avant le titre.
      controlAffinity: ListTileControlAffinity.leading,
      // Donne à la case à cocher une forme circulaire.
      checkboxShape: const CircleBorder(),
      // Définit la couleur de la coche à blanc.
      checkColor: Colors.white,
      // Détermine la couleur de fond de la case à cocher en fonction de son
      // état (sélectionné ou non).
      fillColor: MaterialStateProperty.resolveWith(
        (states) => states.contains(MaterialState.selected)
            ? Colors.grey
            : Colors.transparent,
      ),
      // Définit le style de la bordure de la case à cocher avec une couleur
      // grise et une épaisseur de 2px.
      side: const BorderSide(
        width: 2,
        color: Colors.grey,
      ),
      // Le titre affiché à côté de la case à cocher.
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      // Un sous-titre qui affiche l'heure de la tâche si elle est définie.
      subtitle: time != null ? TimeText(time: time!) : null,
      // Définit la couleur de fond.
      tileColor: Colors.white,
      // Ajoute des marges verticales de 8px et horizontales de 16px.
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      // Donne une forme arrondie avec un rayon de 50px.
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    );
  }
}
