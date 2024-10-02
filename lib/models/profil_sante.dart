import 'indicateur_physique.dart';

class ProfilDeSante {
  final int id;
  final String objectifsSante;
  final List<String> allergies;
  final List<String> conditionsMedicales;
  final List<String> preferencesAlimentaires;
  final List<IndicateurPhysique> indicateursPhysiques;

  ProfilDeSante({
    required this.id,
    required this.objectifsSante,
    required this.allergies,
    required this.conditionsMedicales,
    required this.preferencesAlimentaires,
    required this.indicateursPhysiques,
  });

  factory ProfilDeSante.fromJson(Map<String, dynamic> json) {
    return ProfilDeSante(
      id: json['id'],
      objectifsSante: json['objectifsSante'],
      allergies: List<String>.from(json['allergies']),
      conditionsMedicales: List<String>.from(json['conditionsMedicales']),
      preferencesAlimentaires: List<String>.from(json['preferencesAlimentaires']),
      indicateursPhysiques: (json['indicateursPhysiques'] as List)
          .map((indicateur) => IndicateurPhysique.fromJson(indicateur))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'objectifsSante': objectifsSante,
      'allergies': allergies,
      'conditionsMedicales': conditionsMedicales,
      'preferencesAlimentaires': preferencesAlimentaires,
      'indicateursPhysiques': indicateursPhysiques.map((e) => e.toJson()).toList(),
    };
  }
}
