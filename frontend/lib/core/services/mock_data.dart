import '../../models/dashboard_summary.dart';
import '../../models/generation_run.dart';
import '../../models/semester.dart';
import '../../models/timetable_status.dart';

abstract final class MockData {
  static const List<Semester> semesters = [
    Semester(id: 'fall-2026', name: 'Fall Semester', year: '2026'),
    Semester(id: 'spring-2026', name: 'Spring Semester', year: '2026'),
    Semester(id: 'fall-2025', name: 'Fall Semester', year: '2025'),
  ];

  static const DashboardSummary summary = DashboardSummary(
    courses: 24,
    teachers: 18,
    rooms: 8,
    sections: 5,
    timeSlots: 25,
  );

  static TimetableStatus get status => TimetableStatus(
        hasGeneratedTimetable: true,
        hardConflicts: 0,
        softPenalty: 14,
        lastGenerated: DateTime.now().subtract(const Duration(minutes: 42)),
      );

  static List<GenerationRun> recentRuns() {
    final now = DateTime.now();
    return List<GenerationRun>.generate(5, (index) {
      const best = [18.0, 21.0, 26.0, 24.0, 31.0];
      const average = [34.0, 38.0, 45.0, 41.0, 52.0];
      const hard = [0, 0, 2, 0, 5];
      const soft = [14, 17, 22, 19, 28];
      return GenerationRun(
        id: 12 - index,
        populationSize: 100,
        generations: 500,
        bestFitness: best[index],
        averageFitness: average[index],
        hardConflicts: hard[index],
        softPenalty: soft[index],
        executedAt: now.subtract(Duration(hours: index * 7 + 1)),
        durationMs: 3800 + index * 420,
      );
    });
  }
}
