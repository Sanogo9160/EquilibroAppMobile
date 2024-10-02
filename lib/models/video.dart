class Video {
  final int id;
  final String titre;
  final String url;
  final DateTime datePublication;

  Video({
    required this.id,
    required this.titre,
    required this.url,
    required this.datePublication,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      titre: json['titre'],
      url: json['url'],
      datePublication: DateTime.parse(json['datePublication']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'url': url,
      'datePublication': datePublication.toIso8601String(),
    };
  }
}
