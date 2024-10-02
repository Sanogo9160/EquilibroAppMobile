import 'package:equilibroapp/models/coaching.dart';
import 'package:equilibroapp/models/profil_sante.dart';
import 'package:equilibroapp/models/role.dart';
import 'package:equilibroapp/models/utilisateur.dart';

class Administrateur extends Utilisateur {
  Administrateur({
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
      coachings: coachings);
}
