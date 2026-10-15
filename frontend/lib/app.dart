import 'package:flutter/material.dart';

import 'core/app_state.dart';
import 'core/theme/app_theme.dart';
import 'features/shell/app_shell.dart';

class SmartSchedApp extends StatefulWidget {
  const SmartSchedApp({super.key});

  @override
  State<SmartSchedApp> createState() => _SmartSchedAppState();
}

class _SmartSchedAppState extends State<SmartSchedApp> {
  final AppState _state = AppState();

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartSched',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: AppShell(state: _state),
    );
  }
}
