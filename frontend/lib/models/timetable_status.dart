class TimetableStatus {
  const TimetableStatus({
    required this.hasGeneratedTimetable,
    required this.hardConflicts,
    required this.softPenalty,
    this.lastGenerated,
  });

  final bool hasGeneratedTimetable;
  final int hardConflicts;
  final int softPenalty;
  final DateTime? lastGenerated;

  bool get isValid => hasGeneratedTimetable && hardConflicts == 0;

  static const TimetableStatus empty =
      TimetableStatus(hasGeneratedTimetable: false, hardConflicts: 0, softPenalty: 0);

  factory TimetableStatus.fromJson(Map<String, dynamic> json) => TimetableStatus(
        hasGeneratedTimetable: json['has_generated_timetable'] as bool? ?? false,
        hardConflicts: (json['hard_conflicts'] as num?)?.toInt() ?? 0,
        softPenalty: (json['soft_penalty'] as num?)?.toInt() ?? 0,
        lastGenerated: json['last_generated'] == null
            ? null
            : DateTime.tryParse(json['last_generated'] as String),
      );

  Map<String, dynamic> toJson() => {
        'has_generated_timetable': hasGeneratedTimetable,
        'hard_conflicts': hardConflicts,
        'soft_penalty': softPenalty,
        'last_generated': lastGenerated?.toIso8601String(),
      };
}
