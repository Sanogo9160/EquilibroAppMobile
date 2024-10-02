import 'recette.dart';

class OptionRepasLocal {
  final int id;
  final String region;
  final Recette recette;

  OptionRepasLocal({
    required this.id,
    required this.region,
    required this.recette,
  });

  factory OptionRepasLocal.fromJson(Map<String, dynamic> json) {
    return OptionRepasLocal(
      id: json['id'],
      region: json['region'],
      recette: Recette.fromJson(json['recette']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'region': region,
      'recette': recette.toJson(),
    };
  }

}
