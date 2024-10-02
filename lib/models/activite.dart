
class Activite {
  final int id;
  final String type;
  final String description;
  final DateTime date;

  Activite({
    required this.id,
    required this.type,
    required this.description,
    required this.date,
  });

  factory Activite.fromJson(Map<String, dynamic> json) {
    return Activite(
      id: json['id'],
      type: json['type'],
      description: json['description'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'description': description,
      'date': date.toIso8601String(),
    };
  }
}
