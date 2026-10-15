import 'package:flutter/material.dart';

import '../../core/app_state.dart';
import '../../core/services/services.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/format.dart';
import '../../models/dashboard_summary.dart';
import '../../models/generation_run.dart';
import '../../models/timetable_status.dart';
import '../../widgets/empty_state.dart';
import '../../widgets/error_state.dart';
import '../../widgets/loading_state.dart';
import '../../widgets/page_header.dart';
import '../../widgets/section_card.dart';
import '../../widgets/status_badge.dart';
import '../../widgets/summary_card.dart';
import '../../widgets/semester_selector.dart';
import '../shell/destinations.dart';
import 'dashboard_controller.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.state});

  final AppState state;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final DashboardController _controller;
  String? _loadedFor;

  @override
  void initState() {
    super.initState();
    _controller = DashboardController(Services.dashboard);
    _sync();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sync() {
    final semester = widget.state.selectedSemester;
    if (semester == null) return;
    if (_loadedFor == semester.id && !_controller.hasError) return;
    _loadedFor = semester.id;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _controller.load(semester.id);
    });
  }

  void _openGenerate() {
    final index = kDestinations.indexWhere((d) => d.label == 'Generate');
    if (index >= 0) widget.state.selectDestination(index);
    widget.state.requestGeneration();
  }

  @override
  Widget build(BuildContext context) {
    _sync();
    final semester = widget.state.selectedSemester;

    return ListenableBuilder(
      listenable: Listenable.merge([_controller, widget.state]),
      builder: (context, _) {
        final showLoading = _controller.loading && _controller.recentRuns.isEmpty;

        return ListView(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 36),
          children: [
            PageHeader(
              overline: greetingFor(DateTime.now()),
              title: 'Timetable Management',
              subtitle: semester?.label ?? 'No semester selected',
              actions: [
                SemesterSelector(
                  semesters: widget.state.semesters,
                  selected: semester,
                  onChanged: (value) {
                    if (value != null) widget.state.selectSemester(value);
                  },
                ),
                ElevatedButton.icon(
                  onPressed: _openGenerate,
                  icon: const Icon(Icons.play_arrow_rounded, size: 18),
                  label: const Text('Generate Timetable'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (_controller.hasError)
              Card(
                child: ErrorState(
                  message: _controller.errorMessage ?? 'Dashboard data is unavailable.',
                  onRetry: () => _controller.refresh(semester?.id ?? ''),
                ),
              )
            else if (showLoading)
              const Card(child: LoadingState(label: 'Loading dashboard data'))
            else ...[
              _SummaryGrid(summary: _controller.summary),
              const SizedBox(height: 20),
              _responsivePanels(semester?.label ?? ''),
            ],
          ],
        );
      },
    );
  }

  Widget _responsivePanels(String semesterLabel) {
    final statusPanel = _StatusPanel(
      status: _controller.status,
      semesterLabel: semesterLabel,
      onGenerate: _openGenerate,
    );
    final runsPanel = _RecentRunsPanel(runs: _controller.recentRuns);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 900) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: statusPanel),
              const SizedBox(width: 16),
              Expanded(flex: 2, child: runsPanel),
            ],
          );
        }
        return Column(
          children: [
            statusPanel,
            const SizedBox(height: 16),
            runsPanel,
          ],
        );
      },
    );
  }
}

class _SummaryGrid extends StatelessWidget {
  const _SummaryGrid({required this.summary});

  final DashboardSummary summary;

  @override
  Widget build(BuildContext context) {
    final items = [
      SummaryCard(
        label: 'Courses',
        value: '${summary.courses}',
        icon: Icons.menu_book_outlined,
        caption: 'Active',
      ),
      SummaryCard(
        label: 'Teachers',
        value: '${summary.teachers}',
        icon: Icons.school_outlined,
        caption: 'Faculty',
      ),
      SummaryCard(
        label: 'Rooms',
        value: '${summary.rooms}',
        icon: Icons.meeting_room_outlined,
        caption: 'Capacity',
      ),
      SummaryCard(
        label: 'Time Slots',
        value: '${summary.timeSlots}',
        icon: Icons.schedule_outlined,
        caption: 'Per week',
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final columns = width >= 960 ? 4 : 2;
        final itemWidth = (width - (columns - 1) * 16) / columns;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: items
              .map((item) => SizedBox(width: itemWidth, child: item))
              .toList(growable: false),
        );
      },
    );
  }
}

class _StatusPanel extends StatelessWidget {
  const _StatusPanel({
    required this.status,
    required this.semesterLabel,
    required this.onGenerate,
  });

  final TimetableStatus status;
  final String semesterLabel;
  final VoidCallback onGenerate;

  @override
  Widget build(BuildContext context) {
    if (!status.hasGeneratedTimetable) {
      return SectionCard(
        title: 'Timetable Status',
        subtitle: semesterLabel,
        child: EmptyState(
          icon: Icons.calendar_view_week_outlined,
          title: 'No timetable generated yet',
          message:
              'Generate a timetable to see hard conflict and soft penalty results for this semester.',
          actionLabel: 'Generate Timetable',
          onAction: onGenerate,
        ),
      );
    }

    final valid = status.isValid;

    return SectionCard(
      title: 'Timetable Status',
      subtitle: semesterLabel,
      trailing: StatusBadge(
        label: valid ? 'No hard conflicts' : 'Needs attention',
        tone: valid ? StatusTone.success : StatusTone.error,
        icon: valid ? Icons.check_circle_outline : Icons.error_outline,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _Metric(
                  label: 'Hard conflicts',
                  value: '${status.hardConflicts}',
                  color: valid ? AppColors.success : AppColors.error,
                ),
              ),
              Container(width: 1, height: 54, color: AppColors.border),
              Expanded(
                child: _Metric(
                  label: 'Soft penalty',
                  value: '${status.softPenalty}',
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(Icons.history, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  status.lastGenerated == null
                      ? 'No generation recorded'
                      : 'Last generated: ${formatDateTimeLabel(status.lastGenerated!)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: color),
        ),
        const SizedBox(height: 2),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class _RecentRunsPanel extends StatelessWidget {
  const _RecentRunsPanel({required this.runs});

  final List<GenerationRun> runs;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SectionCard(
      title: 'Recent Generations',
      subtitle: 'Latest Genetic Algorithm runs',
      trailing: StatusBadge(label: '${runs.length} runs', tone: StatusTone.neutral),
      child: runs.isEmpty
          ? EmptyState(
              icon: Icons.science_outlined,
              title: 'No generation runs yet',
              message: 'Completed runs will be listed here with fitness and conflict results.',
            )
          : Column(
              children: [
                for (var index = 0; index < runs.length; index++) ...[
                  if (index > 0) ...[
                    const SizedBox(height: 12),
                    const Divider(),
                    const SizedBox(height: 12),
                  ],
                  _RunRow(run: runs[index]),
                ],
              ],
            ),
    );
  }
}

class _RunRow extends StatelessWidget {
  const _RunRow({required this.run});

  final GenerationRun run;

  String _fitness(double value) =>
      value == value.roundToDouble() ? '${value.toInt()}' : value.toStringAsFixed(1);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 38,
          height: 38,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.surfaceMuted,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '${run.id}',
            style: theme.textTheme.labelLarge?.copyWith(color: AppColors.primary),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 4,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text('Run #${run.id}', style: theme.textTheme.titleSmall),
                  StatusBadge(
                    label: run.isValid ? 'Valid' : '${run.hardConflicts} conflicts',
                    tone:
                        run.isValid ? StatusTone.success : StatusTone.error,
                    icon: run.isValid
                        ? Icons.check_circle_outline
                        : Icons.error_outline,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Best ${_fitness(run.bestFitness)} · Average ${_fitness(run.averageFitness)} · '
                '${run.generations} generations · ${run.populationSize} population',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              formatDateTimeLabel(run.executedAt),
              style: theme.textTheme.labelSmall,
            ),
            const SizedBox(height: 4),
            Text(run.durationLabel, style: theme.textTheme.labelSmall),
          ],
        ),
      ],
    );
  }
}
