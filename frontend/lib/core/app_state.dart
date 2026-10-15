import 'package:flutter/foundation.dart';

import '../models/semester.dart';
import 'services/services.dart';

class AppState extends ChangeNotifier {
  AppState() {
    loadSemesters();
  }

  List<Semester> _semesters = const [];
  Semester? _selectedSemester;
  int _destinationIndex = 0;
  int _generationRequestId = 0;

  List<Semester> get semesters => _semesters;

  Semester? get selectedSemester =>
      _selectedSemester ?? (_semesters.isEmpty ? null : _semesters.first);

  int get destinationIndex => _destinationIndex;

  int get generationRequestId => _generationRequestId;

  Future<void> loadSemesters() async {
    try {
      final semesters = await Services.dashboard.fetchSemesters();
      _semesters = semesters;
      if (_selectedSemester == null && semesters.isNotEmpty) {
        _selectedSemester = semesters.first;
      }
      notifyListeners();
    } catch (_) {
      _semesters = const [];
      notifyListeners();
    }
  }

  void selectSemester(Semester semester) {
    if (semester.id == _selectedSemester?.id) return;
    _selectedSemester = semester;
    notifyListeners();
  }

  void selectDestination(int index) {
    if (index == _destinationIndex) return;
    _destinationIndex = index;
    notifyListeners();
  }

  void requestGeneration() {
    _generationRequestId++;
    notifyListeners();
  }
}
