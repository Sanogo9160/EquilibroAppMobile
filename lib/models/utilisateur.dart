import 'package:equilibroapp/models/coaching.dart';
import 'package:equilibroapp/models/profil_sante.dart';
import 'package:equilibroapp/models/role.dart';

class Utilisateur {
  final int id;
  final String nom;
  final String email;
  final String _motDePasse; // Rendre le mot de passe privé
  final String telephone;
  final double poids; // kg
  final double taille; // cm
  final int age; // années
  final String sexe; // "Homme" ou "Femme"
  final String niveauActivite; // "Sédentaire", "Légèrement actif"
  final Role role; // Rôle associé
  final ProfilDeSante? profilDeSante; // Profil de santé associé (peut être null)
  final List<Coaching> coachings; // Liste de coachings associés

  Utilisateur({
    required this.id,
    required this.nom,
    required this.email,
    required String motDePasse, // Construit le mot de passe à partir du constructeur
    required this.telephone,
    required this.poids,
    required this.taille,
    required this.age,
    required this.sexe,
    required this.niveauActivite,
    required this.role, // Ajout du rôle
    this.profilDeSante, // Peut être null
    required this.coachings, // Liste des coachings
  }) : _motDePasse = motDePasse; // Initialise le mot de passe

  String get motDePasse => _motDePasse; // Getter pour le mot de passe

  factory Utilisateur.fromJson(Map<String, dynamic> json) {
    return Utilisateur(
      id: json['id'],
      nom: json['nom'],
      email: json['email'],
      motDePasse: json['motDePasse'], // Ajout du mot de passe à partir du JSON
      telephone: json['telephone'] ?? '', // Valeur par défaut si absente
      poids: json['poids']?.toDouble() ?? 0.0, // Valeur par défaut si absente
      taille: json['taille']?.toDouble() ?? 0.0, // Valeur par défaut si absente
      age: json['age'] ?? 0, // Valeur par défaut si absente
      sexe: json['sexe'] ?? '', // Valeur par défaut si absente
      niveauActivite: json['niveauActivite'] ?? '', // Valeur par défaut si absente
      role: Role.fromJson(json['role']), // Conversion du rôle
      profilDeSante: json['profilDeSante'] != null
          ? ProfilDeSante.fromJson(json['profilDeSante']) // Conversion du profil de santé
          : null,
      coachings: (json['coachings'] as List<dynamic>?)?.map((item) => Coaching.fromJson(item)).toList() ?? [], // Liste de coachings
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'email': email,
      'motDePasse': _motDePasse, // Ne pas exposer le mot de passe par défaut
      'telephone': telephone,
      'poids': poids,
      'taille': taille,
      'age': age,
      'sexe': sexe,
      'niveauActivite': niveauActivite,
      'role': role.toJson(), // Conversion du rôle
      'profilDeSante': profilDeSante?.toJson(), // Conversion du profil de santé
      'coachings': coachings.map((coaching) => coaching.toJson()).toList(), // Liste de coachings
    };
  }
}
