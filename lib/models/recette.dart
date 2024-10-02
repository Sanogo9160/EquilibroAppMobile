
import 'apports_nutritionnels.dart';

class Recette {
  final int id;
  final String nom;
  final String description;
  final List<String> ingredients;
  final ApportsNutritionnels apportsNutritionnels;
  final List<int>? image; // Utilisation d'une liste d'entiers pour représenter les pixels de l'image

  Recette({
    required this.id,
    required this.nom,
    required this.description,
    required this.ingredients,
    required this.apportsNutritionnels,
    this.image,
  });

  factory Recette.fromJson(Map<String, dynamic> json) {
    return Recette(
      id: json['id'],
      nom: json['nom'],
      description: json['description'],
      ingredients: List<String>.from(json['ingredients']),
      apportsNutritionnels: ApportsNutritionnels.fromJson(json['apportsNutritionnels']),
      image: json['image'] != null ? List<int>.from(json['image']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'description': description,
      'ingredients': ingredients,
      'apportsNutritionnels': apportsNutritionnels.toJson(),
      'image': image,
    };
  }
}
