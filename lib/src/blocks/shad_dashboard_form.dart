import 'package:flutter/material.dart';

import '../components/shad_badge.dart';
import '../components/shad_button.dart';
import '../components/shad_card.dart';
import '../components/shad_icon.dart';
import '../components/shad_list_item.dart';
import '../components/shad_progress.dart';
import '../components/shad_text.dart';
import '../theme/shad_theme.dart';

class ShadDashboardMetric {
  const ShadDashboardMetric({
    required this.label,
    required this.value,
    this.change,
    this.icon,
    this.progress,
    this.onTap,
  });

  final String label;
  final String value;
  final String? change;
  final IconData? icon;
  final double? progress;
  final VoidCallback? onTap;
}

class ShadDashboardActivity {
  const ShadDashboardActivity({
    required this.title,
    required this.description,
    this.icon,
    this.status,
    this.statusVariant = ShadBadgeVariant.secondary,
    this.onTap,
  });

  final String title;
  final String description;
  final IconData? icon;
  final String? status;
  final ShadBadgeVariant statusVariant;
  final VoidCallback? onTap;
}

class ShadDashboardForm extends StatelessWidget {
  const ShadDashboardForm({
    super.key,
    required this.metrics,
    this.activities = const [],
    this.title = 'Dashboard',
    this.description = 'Keep track of what is happening in your workspace.',
    this.actions = const [],
    this.activityTitle = 'Recent activity',
    this.activityDescription = 'The latest updates from your workspace.',
    this.emptyActivityLabel = 'No recent activity.',
  });

  final List<ShadDashboardMetric> metrics;
  final List<ShadDashboardActivity> activities;
  final String title;
  final String description;
  final List<Widget> actions;
  final String activityTitle;
  final String activityDescription;
  final String emptyActivityLabel;

  @override
  Widget build(BuildContext context) {
    final style = context.shadStyle;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _header(context),
        SizedBox(height: style.spacing * 2),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth < 620 ? 1 : 2;
            final gap = style.spacing;
            final width = columns == 1
                ? constraints.maxWidth
                : (constraints.maxWidth - gap) / columns;
            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: metrics
                  .map(
                    (metric) => SizedBox(
                      width: width,
                      child: _metricCard(context, metric),
                    ),
                  )
                  .toList(),
            );
          },
        ),
        SizedBox(height: style.spacing * 2),
        _activityCard(context),
      ],
    );
  }

  Widget _header(BuildContext context) {
    final colors = context.shadColors;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShadText(
                title,
                style: TextStyle(
                  color: colors.foreground,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              ShadText(
                description,
                style: TextStyle(color: colors.mutedForeground, fontSize: 15),
              ),
            ],
          ),
        ),
        if (actions.isNotEmpty) ...[
          const SizedBox(width: 16),
          Wrap(spacing: 8, runSpacing: 8, children: actions),
        ],
      ],
    );
  }

  Widget _metricCard(BuildContext context, ShadDashboardMetric metric) {
    return ShadCard(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: metric.onTap,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: ShadText(metric.label)),
                if (metric.icon != null) ShadIcon(metric.icon!, size: 18),
              ],
            ),
            const SizedBox(height: 10),
            ShadText(
              metric.value,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
            ),
            if (metric.change != null) ...[
              const SizedBox(height: 6),
              ShadText(
                metric.change!,
                style: TextStyle(
                  color: context.shadColors.mutedForeground,
                  fontSize: 13,
                ),
              ),
            ],
            if (metric.progress != null) ...[
              const SizedBox(height: 14),
              ShadProgress(value: metric.progress!.clamp(0, 1)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _activityCard(BuildContext context) {
    final style = context.shadStyle;
    return ShadCard(
      title: ShadText(activityTitle),
      description: ShadText(activityDescription),
      padding: EdgeInsets.zero,
      child: activities.isEmpty
          ? Padding(
              padding: EdgeInsets.all(style.spacing),
              child: ShadText(emptyActivityLabel),
            )
          : Column(
              children: [
                for (var index = 0; index < activities.length; index++) ...[
                  _activityItem(activities[index]),
                  if (index < activities.length - 1)
                    Divider(height: 1, color: context.shadColors.border),
                ],
              ],
            ),
    );
  }

  Widget _activityItem(ShadDashboardActivity activity) {
    return ShadListItem(
      leading: activity.icon == null
          ? null
          : ShadIcon(activity.icon!, size: 20),
      title: ShadText(activity.title),
      subtitle: ShadText(activity.description),
      trailing: activity.status == null
          ? null
          : ShadBadge(
              variant: activity.statusVariant,
              child: Text(activity.status!),
            ),
      onTap: activity.onTap,
    );
  }
}

typedef ShadDashboard = ShadDashboardForm;
