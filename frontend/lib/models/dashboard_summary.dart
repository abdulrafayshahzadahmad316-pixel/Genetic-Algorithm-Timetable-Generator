class DashboardSummary {
  const DashboardSummary({
    required this.courses,
    required this.teachers,
    required this.rooms,
    required this.sections,
    required this.timeSlots,
  });

  final int courses;
  final int teachers;
  final int rooms;
  final int sections;
  final int timeSlots;

  static const DashboardSummary empty = DashboardSummary(
    courses: 0,
    teachers: 0,
    rooms: 0,
    sections: 0,
    timeSlots: 0,
  );

  factory DashboardSummary.fromJson(Map<String, dynamic> json) =>
      DashboardSummary(
        courses: (json['courses'] as num?)?.toInt() ?? 0,
        teachers: (json['teachers'] as num?)?.toInt() ?? 0,
        rooms: (json['rooms'] as num?)?.toInt() ?? 0,
        sections: (json['sections'] as num?)?.toInt() ?? 0,
        timeSlots: (json['time_slots'] as num?)?.toInt() ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'courses': courses,
        'teachers': teachers,
        'rooms': rooms,
        'sections': sections,
        'time_slots': timeSlots,
      };
}
