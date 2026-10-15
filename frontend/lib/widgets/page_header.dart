import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.overline,
    this.actions = const [],
  });

  final String title;
  final String? subtitle;
  final String? overline;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 720;
        final heading = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (overline != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  overline!,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                ),
              ),
          ],
        );

        if (actions.isEmpty) return heading;

        return Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 12,
          runSpacing: 12,
          alignment: wide ? WrapAlignment.spaceBetween : WrapAlignment.start,
          children: [
            heading,
            Wrap(spacing: 10, runSpacing: 10, children: actions),
          ],
        );
      },
    );
  }
}
