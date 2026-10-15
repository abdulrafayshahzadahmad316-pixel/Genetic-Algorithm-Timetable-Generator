import '../../models/dashboard_summary.dart';
import '../../models/generation_run.dart';
import '../../models/semester.dart';
import '../../models/timetable_status.dart';
import 'api_client.dart';
import 'mock_data.dart';

class DashboardRepository {
  DashboardRepository(this._api);

  final ApiClient _api;
  bool useMockFallback = true;

  Future<List<Semester>> fetchSemesters() async {
    final data = await _request('/api/semesters');
    if (data is! List) return MockData.semesters;
    return data
        .whereType<Map<String, dynamic>>()
        .map(Semester.fromJson)
        .toList(growable: false);
  }

  Future<DashboardSummary> fetchSummary(String semesterId) async {
    final data = await _request('/api/dashboard/summary?semester=$semesterId');
    if (data is! Map<String, dynamic>) return MockData.summary;
    return DashboardSummary.fromJson(data);
  }

  Future<TimetableStatus> fetchStatus(String semesterId) async {
    final data = await _request('/api/dashboard/status?semester=$semesterId');
    if (data is! Map<String, dynamic>) return MockData.status;
    return TimetableStatus.fromJson(data);
  }

  Future<List<GenerationRun>> fetchRecentRuns(String semesterId) async {
    final data = await _request('/api/dashboard/recent-runs?semester=$semesterId');
    if (data is! List) return MockData.recentRuns();
    return data
        .whereType<Map<String, dynamic>>()
        .map(GenerationRun.fromJson)
        .toList(growable: false);
  }

  Future<dynamic> _request(String path) async {
    try {
      return await _api.get(path);
    } on ApiException catch (error) {
      if (useMockFallback && error is ApiConnectionException) {
        return _mockFor(path);
      }
      rethrow;
    }
  }

  dynamic _mockFor(String path) {
    if (path.contains('/summary')) return MockData.summary.toJson();
    if (path.contains('/status')) return MockData.status.toJson();
    if (path.contains('/recent-runs')) {
      return MockData.recentRuns().map((run) => run.toJson()).toList();
    }
    return MockData.semesters.map((semester) => semester.toJson()).toList();
  }
}
