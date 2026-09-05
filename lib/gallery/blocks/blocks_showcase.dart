import 'package:flutter/material.dart';
import 'package:shadart/shadart.dart';

class BlocksShowcase extends StatelessWidget {
  const BlocksShowcase({super.key});
  static void _noop([dynamic _]) {}
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Blocks',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
      ),
      const SizedBox(height: 8),
      Text(
        'Complete flows built from the same theme-aware components.',
        style: TextStyle(
          color: context.shadColors.mutedForeground,
          fontSize: 15,
        ),
      ),
      const SizedBox(height: 24),
      LayoutBuilder(
        builder: (context, box) {
          final blocks = [
            ShadDashboardForm(
              metrics: const [
                ShadDashboardMetric(
                  label: 'Total revenue',
                  value: '\$24,780',
                  change: '+12.5% from last month',
                  icon: Icons.trending_up,
                ),
                ShadDashboardMetric(
                  label: 'Active projects',
                  value: '18',
                  change: '3 updated today',
                  icon: Icons.folder_open_outlined,
                  progress: .72,
                ),
                ShadDashboardMetric(
                  label: 'Team members',
                  value: '24',
                  change: '4 invitations pending',
                  icon: Icons.group_outlined,
                ),
                ShadDashboardMetric(
                  label: 'Tasks completed',
                  value: '86%',
                  change: 'Ahead of your weekly goal',
                  icon: Icons.check_circle_outline,
                  progress: .86,
                ),
              ],
              activities: [
                ShadDashboardActivity(
                  title: 'New project created',
                  description: 'Design system documentation was started.',
                  icon: Icons.add_circle_outline,
                  status: 'New',
                  statusVariant: ShadBadgeVariant.primary,
                  onTap: _noop,
                ),
                ShadDashboardActivity(
                  title: 'Deployment completed',
                  description: 'The production build finished successfully.',
                  icon: Icons.rocket_launch_outlined,
                  status: 'Live',
                  statusVariant: ShadBadgeVariant.secondary,
                  onTap: _noop,
                ),
              ],
              actions: [
                ShadButton(
                  variant: ShadButtonVariant.outline,
                  onPressed: _noop,
                  child: Text('View report'),
                ),
              ],
            ),
            ShadLoginForm(
              onSubmitted: () =>
                  ShadSnackbar.show(context, 'Sign-in submitted'),
              onForgotPassword: () =>
                  ShadSnackbar.show(context, 'Forgot password selected'),
              onCreateAccount: () =>
                  ShadSnackbar.show(context, 'Create account selected'),
            ),
            ShadOnboarding(
              steps: const [
                ShadOnboardingStep(
                  title: 'Welcome to shadart',
                  description: 'Compose polished Flutter interfaces quickly.',
                  icon: Icon(Icons.auto_awesome, size: 32),
                ),
                ShadOnboardingStep(
                  title: 'Use the building blocks',
                  description: 'Keep colors, spacing, and states consistent.',
                  icon: Icon(Icons.widgets_outlined, size: 32),
                ),
                ShadOnboardingStep(
                  title: 'Make it yours',
                  description: 'Customize the theme to fit your product.',
                  icon: Icon(Icons.palette_outlined, size: 32),
                ),
              ],
              onSkip: () => ShadSnackbar.show(context, 'Onboarding skipped'),
              onComplete: () =>
                  ShadSnackbar.show(context, 'Onboarding completed'),
            ),
            ShadForgotPasswordEmailForm(
              onSubmitted: () =>
                  ShadSnackbar.show(context, 'Reset email submitted'),
            ),
            ShadForgotPasswordOtpForm(
              onSubmitted: () =>
                  ShadSnackbar.show(context, 'Verification submitted'),
              onResend: () =>
                  ShadSnackbar.show(context, 'Verification code resent'),
            ),
            ShadForgotPasswordChangePasswordForm(
              onSubmitted: () =>
                  ShadSnackbar.show(context, 'Password update submitted'),
            ),
          ];
          if (box.maxWidth < 760) {
            return Column(
              children: blocks
                  .map(
                    (block) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: block,
                    ),
                  )
                  .toList(),
            );
          }
          return Wrap(
            spacing: 20,
            runSpacing: 20,
            children: blocks
                .map(
                  (block) =>
                      SizedBox(width: (box.maxWidth - 20) / 2, child: block),
                )
                .toList(),
          );
        },
      ),
    ],
  );
}
