import 'package:equilibroapp/models/coaching.dart';
import 'package:equilibroapp/models/profil_sante.dart';
import 'package:equilibroapp/models/role.dart';
import 'package:equilibroapp/models/utilisateur.dart';

class Dieteticien extends Utilisateur {
  final String specialite;

  Dieteticien({
    required int id,
    required String nom,
    required String email,
    required String motDePasse,
    required String telephone,
    required double poids,
    required double taille,
    required int age,
    required String sexe,
    required String niveauActivite,
    required Role role,
    ProfilDeSante? profilDeSante,
    required List<Coaching> coachings,
    required this.specialite, // Spécialité pour le diététicien
  }) : super(
    id: id,
    nom: nom,
    email: email,
    motDePasse: motDePasse,
    telephone: telephone,
    poids: poids,
    taille: taille,
    age: age,
    sexe: sexe,
    niveauActivite: niveauActivite,
    role: role,
    profilDeSante: profilDeSante,
    coachings: coachings,
  );

  factory Dieteticien.fromJson(Map<String, dynamic> json) {
    return Dieteticien(
      id: json['id'],
      nom: json['nom'],
      email: json['email'],
      motDePasse: json['motDePasse'], // Ajout du mot de passe à partir du JSON
      telephone: json['telephone'] ?? '',
      poids: json['poids']?.toDouble() ?? 0.0,
      taille: json['taille']?.toDouble() ?? 0.0,
      age: json['age'] ?? 0,
      sexe: json['sexe'] ?? '',
      niveauActivite: json['niveauActivite'] ?? '',
      role: Role.fromJson(json['role']),
      profilDeSante: json['profilDeSante'] != null
          ? ProfilDeSante.fromJson(json['profilDeSante'])
          : null,
      coachings: (json['coachings'] as List<dynamic>?)
          ?.map((item) => Coaching.fromJson(item))
          .toList() ??
          [],
      specialite: json['specialite'] ?? '', // Valeur par défaut si absente
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['specialite'] = specialite; // Ajout de la spécialité au JSON
    return json;
  }
}
