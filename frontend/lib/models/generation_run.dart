class GenerationRun {
  const GenerationRun({
    required this.id,
    required this.populationSize,
    required this.generations,
    required this.bestFitness,
    required this.averageFitness,
    required this.hardConflicts,
    required this.softPenalty,
    required this.executedAt,
    required this.durationMs,
  });

  final int id;
  final int populationSize;
  final int generations;
  final double bestFitness;
  final double averageFitness;
  final int hardConflicts;
  final int softPenalty;
  final DateTime executedAt;
  final int durationMs;

  bool get isValid => hardConflicts == 0;

  Duration get duration => Duration(milliseconds: durationMs);

  String get durationLabel {
    final seconds = durationMs / 1000;
    if (seconds < 60) return '${seconds.toStringAsFixed(1)} sec';
    final minutes = duration.inMinutes;
    final rest = duration.inSeconds % 60;
    return '$minutes min $rest sec';
  }

  factory GenerationRun.fromJson(Map<String, dynamic> json) => GenerationRun(
        id: (json['id'] as num).toInt(),
        populationSize: (json['population_size'] as num?)?.toInt() ?? 0,
        generations: (json['generations'] as num?)?.toInt() ?? 0,
        bestFitness: (json['best_fitness'] as num?)?.toDouble() ?? 0,
        averageFitness: (json['average_fitness'] as num?)?.toDouble() ?? 0,
        hardConflicts: (json['hard_conflicts'] as num?)?.toInt() ?? 0,
        softPenalty: (json['soft_penalty'] as num?)?.toInt() ?? 0,
        executedAt: DateTime.parse(json['executed_at'] as String),
        durationMs: (json['duration_ms'] as num?)?.toInt() ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'population_size': populationSize,
        'generations': generations,
        'best_fitness': bestFitness,
        'average_fitness': averageFitness,
        'hard_conflicts': hardConflicts,
        'soft_penalty': softPenalty,
        'executed_at': executedAt.toIso8601String(),
        'duration_ms': durationMs,
      };
}
