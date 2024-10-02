import 'package:equilibroapp/models/utilisateur.dart';

class Coaching {
  final int id;
  final String type;
  final String contenu;
  final List<Utilisateur> utilisateurs; // Liste des utilisateurs associés

  Coaching({
    required this.id,
    required this.type,
    required this.contenu,
    required this.utilisateurs,
  });

  factory Coaching.fromJson(Map<String, dynamic> json) {
    return Coaching(
      id: json['id'],
      type: json['type'],
      contenu: json['contenu'],
      utilisateurs: (json['utilisateurs'] as List<dynamic>?)
          ?.map((item) => Utilisateur.fromJson(item))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'contenu': contenu,
      'utilisateurs': utilisateurs.map((utilisateur) => utilisateur.toJson()).toList(),
    };
  }
}
