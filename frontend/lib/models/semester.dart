class Semester {
  const Semester({
    required this.id,
    required this.name,
    required this.year,
  });

  final String id;
  final String name;
  final String year;

  String get label => '$name $year';

  factory Semester.fromJson(Map<String, dynamic> json) => Semester(
        id: json['id'] as String,
        name: json['name'] as String,
        year: json['year'] as String,
      );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'year': year};
}
