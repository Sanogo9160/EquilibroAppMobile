import 'package:flutter/foundation.dart';

class Article {
  final int id;
  final String titre;
  final String contenu;
  final DateTime datePublication;

  Article({
    required this.id,
    required this.titre,
    required this.contenu,
    required this.datePublication,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      titre: json['titre'],
      contenu: json['contenu'],
      datePublication: DateTime.parse(json['datePublication']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'contenu': contenu,
      'datePublication': datePublication.toIso8601String(),
    };
  }
}
