import 'package:equilibroapp/models/activite.dart';
import 'package:equilibroapp/models/repas.dart';
class Historique {
  final int id;
  final DateTime date;
  final List<Activite> activites;
  final List<Repas> repasConsommes;

  Historique({
    required this.id,
    required this.date,
    required this.activites,
    required this.repasConsommes,
  });

  factory Historique.fromJson(Map<String, dynamic> json) {
    return Historique(
      id: json['id'],
      date: DateTime.parse(json['date']),
      activites: (json['activites'] as List<dynamic>)
          .map((item) => Activite.fromJson(item))
          .toList(),
      repasConsommes: (json['repasConsommes'] as List<dynamic>)
          .map((item) => Repas.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'activites': activites.map((activite) => activite.toJson()).toList(),
      'repasConsommes': repasConsommes.map((repas) => repas.toJson()).toList(),
    };
  }
}
