import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeText extends StatelessWidget {
  const TimeText({
    required this.time,
    super.key,
  });

  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Row(
      // Les widgets enfants de la ligne, disposés horizontalement.
      children: [
        // Un widget Icône pour afficher une icône d'horloge.
        Icon(
          // Définition de l'icône à afficher.
          Icons.access_time,
          // Taille de l'icône.
          size: 16,
          // Couleur de l'icône, ici un gris foncé.
          color: Colors.grey[700],
        ),
        // Un espace vide de 4px de largeur entre l'icône et le texte.
        const SizedBox(width: 4),
        // Permet à l'enfant de prendre tout l'espace disponible restant
        // horizontalement.
        Expanded(
          // Un widget de texte pour afficher l'heure formatée.
          child: Text(
            // Formatage de l'heure en utilisant le format 'HH:mm'.
            DateFormat('HH:mm').format(time),
            // Style du texte.
            style: TextStyle(color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }
}
