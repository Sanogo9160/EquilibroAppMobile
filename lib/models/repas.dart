import 'recette.dart';
import 'utilisateur.dart';

class Repas {
  final int id;
  final String typeRepas;
  final DateTime heure;
  final List<Recette> recettes;
  final Utilisateur utilisateur;

  Repas({
    required this.id,
    required this.typeRepas,
    required this.heure,
    required this.recettes,
    required this.utilisateur,
  });

  factory Repas.fromJson(Map<String, dynamic> json) {
    return Repas(
      id: json['id'],
      typeRepas: json['typeRepas'],
      heure: DateTime.parse(json['heure']),
      recettes: List<Recette>.from(json['recettes'].map((r) => Recette.fromJson(r))),
      utilisateur: Utilisateur.fromJson(json['utilisateur']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'typeRepas': typeRepas,
      'heure': heure.toIso8601String(),
      'recettes': recettes.map((r) => r.toJson()).toList(),
      'utilisateur': utilisateur.toJson(),
    };
  }
}
