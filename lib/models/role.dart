class Role {
  final int id;
  final String nom;

  Role({
    required this.id,
    required this.nom,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      nom: json['nom'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
    };
  }
}
