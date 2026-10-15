import 'package:flutter/foundation.dart';

import '../../core/services/dashboard_repository.dart';
import '../../models/dashboard_summary.dart';
import '../../models/generation_run.dart';
import '../../models/timetable_status.dart';

class DashboardController extends ChangeNotifier {
  DashboardController(this._repository);

  final DashboardRepository _repository;

  bool loading = true;
  String? errorMessage;
  DashboardSummary summary = DashboardSummary.empty;
  TimetableStatus status = TimetableStatus.empty;
  List<GenerationRun> recentRuns = const [];

  String? _loadedFor;

  bool get hasError => errorMessage != null && !loading;

  Future<void> load(String semesterId, {bool force = false}) async {
    if (!force && _loadedFor == semesterId && !hasError) return;
    _loadedFor = semesterId;
    loading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final summaryFuture = _repository.fetchSummary(semesterId);
      final statusFuture = _repository.fetchStatus(semesterId);
      final runsFuture = _repository.fetchRecentRuns(semesterId);

      final summaryResult = await summaryFuture;
      final statusResult = await statusFuture;
      final runsResult = await runsFuture;

      summary = summaryResult;
      status = statusResult;
      recentRuns = runsResult;
      loading = false;
    } catch (error) {
      errorMessage = error.toString();
      loading = false;
    }
    notifyListeners();
  }

  Future<void> refresh(String semesterId) => load(semesterId, force: true);
}
