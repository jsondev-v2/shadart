import 'package:flutter/material.dart';
import 'package:shadart/shadart.dart';

void main() => runApp(const ShadartGallery());

class ShadartGallery extends StatefulWidget {
  const ShadartGallery({super.key});
  @override
  State<ShadartGallery> createState() => _ShadartGalleryState();
}

class _ShadartGalleryState extends State<ShadartGallery> {
  ThemeMode mode = ThemeMode.system;
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Shadart',
    theme: ShadTheme.light(colorScheme: AppColorScheme.neutral),
    darkTheme: ShadTheme.dark(colorScheme: AppColorScheme.neutral),
    themeMode: mode,
    home: GalleryPage(
      onThemeChanged: () => setState(
        () => mode = mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
      ),
    ),
  );
}

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key, required this.onThemeChanged});
  final VoidCallback onThemeChanged;

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  bool checked = true;
  bool switched = true;
  int radioValue = 1;
  double sliderValue = .65;
  String? dropdownValue = 'Flutter';
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    final c = context.shadColors;
    return Scaffold(
      body: SafeArea(
        child: SelectionArea(
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1120),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 28,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: c.primary,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Text(
                              'S',
                              style: TextStyle(
                                color: c.primaryForeground,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'shadart',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          ShadButton(
                            variant: ShadButtonVariant.ghost,
                            size: ShadButtonSize.icon,
                            onPressed: widget.onThemeChanged,
                            child: const Icon(Icons.contrast, size: 18),
                          ),
                          const SizedBox(width: 8),
                          ShadButton(
                            variant: ShadButtonVariant.outline,
                            onPressed: () {},
                            leading: const Icon(Icons.code, size: 16),
                            child: const Text('GitHub'),
                          ),
                        ],
                      ),
                      const ShadSeparator(
                        margin: EdgeInsets.symmetric(vertical: 28),
                      ),
                      const ShadBadge(
                        variant: ShadBadgeVariant.secondary,
                        child: Text('Flutter UI components'),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Build beautiful apps\nwithout fighting the defaults.',
                        style: const TextStyle(
                          fontSize: 44,
                          height: 1.08,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'A small collection of accessible, customizable widgets inspired by shadcn/ui — designed for Flutter.',
                        style: TextStyle(
                          color: c.mutedForeground,
                          fontSize: 17,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 36),
                      LayoutBuilder(
                        builder: (context, box) {
                          final cards = [_buttons(), _form(), _feedback()];
                          if (box.maxWidth < 760) {
                            return Column(
                              children: cards
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 20,
                                      ),
                                      child: e,
                                    ),
                                  )
                                  .toList(),
                            );
                          }
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: cards[0]),
                              const SizedBox(width: 20),
                              Expanded(child: cards[1]),
                              const SizedBox(width: 20),
                              Expanded(child: cards[2]),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 48),
                      _componentsSection(),
                      const SizedBox(height: 36),
                      _blocksSection(),
                      const SizedBox(height: 36),
                      const ShadSeparator(),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Copy the widgets. Own the experience.',
                            style: TextStyle(
                              color: c.mutedForeground,
                              fontSize: 13,
                            ),
                          ),
                          const Spacer(),
                          const ShadBadge(
                            variant: ShadBadgeVariant.outline,
                            child: Text('v0.1.0'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _componentsSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Components',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
      ),
      const SizedBox(height: 8),
      Text(
        'Every building block, rendered in one place.',
        style: TextStyle(
          color: context.shadColors.mutedForeground,
          fontSize: 15,
        ),
      ),
      const SizedBox(height: 24),
      LayoutBuilder(
        builder: (context, box) {
          final sections = [
            _contentComponents(),
            _formComponents(),
            _actionComponents(),
            _navigationComponents(),
            _feedbackComponents(),
          ];
          if (box.maxWidth < 760) {
            return Column(
              children: sections
                  .map(
                    (section) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: section,
                    ),
                  )
                  .toList(),
            );
          }
          return Wrap(
            spacing: 20,
            runSpacing: 20,
            children: sections
                .map(
                  (section) =>
                      SizedBox(width: (box.maxWidth - 20) / 2, child: section),
                )
                .toList(),
          );
        },
      ),
    ],
  );

  Widget _blocksSection() => Column(
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
              onSubmitted: () => _showBlockMessage('Sign-in submitted'),
              onForgotPassword: () =>
                  _showBlockMessage('Forgot password selected'),
              onCreateAccount: () =>
                  _showBlockMessage('Create account selected'),
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
              onSkip: () => _showBlockMessage('Onboarding skipped'),
              onComplete: () => _showBlockMessage('Onboarding completed'),
            ),
            ShadForgotPasswordEmailForm(
              onSubmitted: () => _showBlockMessage('Reset email submitted'),
            ),
            ShadForgotPasswordOtpForm(
              onSubmitted: () => _showBlockMessage('Verification submitted'),
              onResend: () => _showBlockMessage('Verification code resent'),
            ),
            ShadForgotPasswordChangePasswordForm(
              onSubmitted: () => _showBlockMessage('Password update submitted'),
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

  void _showBlockMessage(String message) {
    ShadSnackbar.show(context, message);
  }

  Widget _contentComponents() => ShadCard(
    title: const Text('Content'),
    description: const Text('Text, icons, imagery, cards, lists, and grids.'),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShadText('Display text with a semantic component.'),
        const SizedBox(height: 12),
        const Row(
          children: [
            ShadIcon(Icons.auto_awesome, size: 20),
            SizedBox(width: 12),
            ShadIcon(Icons.favorite_outline, size: 20),
            SizedBox(width: 12),
            ShadTooltip(
              message: 'More information',
              child: ShadIcon(Icons.info_outline, size: 20),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: ShadImage(
            url:
                'https://images.unsplash.com/photo-1519608487953-e999c86e7455?w=900',
            height: 120,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 12),
        const ShadListItem(
          leading: CircleAvatar(child: Text('S')),
          title: Text('List item'),
          subtitle: Text('A compact row with supporting text.'),
          trailing: ShadIcon(Icons.chevron_right),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 116,
          child: ShadGrid(
            itemCount: 4,
            itemBuilder: (context, index) => ShadCard(
              padding: const EdgeInsets.all(12),
              child: Center(child: Text('Tile ${index + 1}')),
            ),
          ),
        ),
      ],
    ),
  );

  Widget _formComponents() => ShadCard(
    title: const Text('Forms'),
    description: const Text('Inputs and controls for collecting values.'),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShadTextField(label: 'Text field', hintText: 'Enter a value'),
        const SizedBox(height: 12),
        const ShadPasswordField(
          label: 'Password',
          hintText: 'Enter a password',
        ),
        const SizedBox(height: 12),
        const ShadTextArea(label: 'Text area', hintText: 'Write a note'),
        const SizedBox(height: 12),
        ShadDropdown<String>(
          value: dropdownValue,
          items: const [
            DropdownMenuItem(value: 'Flutter', child: Text('Flutter')),
            DropdownMenuItem(value: 'Dart', child: Text('Dart')),
            DropdownMenuItem(value: 'Web', child: Text('Web')),
          ],
          onChanged: (value) => setState(() => dropdownValue = value),
          hint: const Text('Choose a framework'),
        ),
        ShadCheckbox(
          value: checked,
          onChanged: (value) => setState(() => checked = value ?? false),
          label: const Text('Remember this choice'),
        ),
        ShadRadio<int>(
          value: 1,
          groupValue: radioValue,
          onChanged: (value) => setState(() => radioValue = value ?? 1),
          label: const Text('Standard option'),
        ),
        ShadSwitch(
          value: switched,
          onChanged: (value) => setState(() => switched = value),
          label: const Text('Enable notifications'),
        ),
        ShadSlider(
          value: sliderValue,
          divisions: 10,
          label: '${(sliderValue * 100).round()}%',
          onChanged: (value) => setState(() => sliderValue = value),
        ),
      ],
    ),
  );

  Widget _actionComponents() => ShadCard(
    title: const Text('Actions'),
    description: const Text('Buttons, chips, progress, and loading states.'),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ShadTextButton(onPressed: () {}, child: const Text('Text button')),
            ShadOutlineButton(onPressed: () {}, child: const Text('Outline')),
            ShadIconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
              tooltip: 'More actions',
            ),
            ShadFloatingButton(
              onPressed: () {},
              tooltip: 'Add item',
              child: const Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ShadChip(label: Text('Design')),
            ShadChip(label: Text('Flutter'), onDeleted: null),
            ShadChip(
              label: Text('Selected'),
              selected: true,
              onSelected: _noop,
            ),
          ],
        ),
        const SizedBox(height: 16),
        const ShadProgress(value: .7),
        const SizedBox(height: 16),
        const Row(
          children: [
            ShadLoading(),
            SizedBox(width: 12),
            Text('Loading your workspace...'),
          ],
        ),
      ],
    ),
  );

  Widget _navigationComponents() => ShadCard(
    title: const Text('Navigation'),
    description: const Text('Headers, tabs, lists, and bottom navigation.'),
    padding: EdgeInsets.zero,
    child: Column(
      children: [
        const ShadAppBar(
          title: Text('Workspace'),
          leading: ShadIcon(Icons.menu),
          actions: [
            ShadIconButton(onPressed: _noop, icon: ShadIcon(Icons.search)),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    ShadTabs(
                      tabs: [
                        Tab(text: 'Overview'),
                        Tab(text: 'Activity'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ShadListItem(
                title: Text('Recent activity'),
                trailing: ShadIcon(Icons.chevron_right),
              ),
            ],
          ),
        ),
        ShadBottomNavigation(
          selectedIndex: 0,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
          onDestinationSelected: _noop,
        ),
      ],
    ),
  );

  Widget _feedbackComponents() => ShadCard(
    title: const Text('Feedback & overlays'),
    description: const Text(
      'Pickers, dividers, dialogs, and temporary messages.',
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ShadDatePicker(
              value: selectedDate,
              onChanged: (value) => setState(() => selectedDate = value),
            ),
            ShadTimePicker(
              value: selectedTime,
              onChanged: (value) => setState(() => selectedTime = value),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const ShadDivider(),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ShadButton(
              onPressed: () => ShadDialog.show(
                context: context,
                title: const Text('Confirm action'),
                content: const Text('This dialog is provided by ShadDialog.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'),
                  ),
                ],
              ),
              child: const Text('Open dialog'),
            ),
            ShadButton(
              variant: ShadButtonVariant.outline,
              onPressed: () => ShadSnackbar.show(context, 'Changes saved'),
              child: const Text('Show snackbar'),
            ),
          ],
        ),
      ],
    ),
  );

  static void _noop([dynamic _]) {}

  Widget _buttons() => ShadCard(
    title: const Text('Buttons'),
    description: const Text('Actions for every level of emphasis.'),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ShadButton(onPressed: () {}, child: const Text('Primary action')),
        const SizedBox(height: 10),
        ShadButton(
          variant: ShadButtonVariant.secondary,
          onPressed: () {},
          child: const Text('Secondary'),
        ),
        const SizedBox(height: 10),
        ShadButton(
          variant: ShadButtonVariant.outline,
          onPressed: () {},
          child: const Text('Outline'),
        ),
        const SizedBox(height: 10),
        ShadButton(
          variant: ShadButtonVariant.destructive,
          onPressed: () {},
          child: const Text('Delete project'),
        ),
      ],
    ),
  );

  Widget _form() => ShadCard(
    title: const Text('Create project'),
    description: const Text('Deploy a new project in one click.'),
    child: Column(
      children: [
        const ShadInput(label: 'Project name', hintText: 'my-awesome-app'),
        const SizedBox(height: 16),
        const ShadInput(
          label: 'Framework',
          hintText: 'Flutter',
          suffix: Icon(Icons.unfold_more, size: 17),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ShadButton(
              variant: ShadButtonVariant.ghost,
              onPressed: () {},
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 8),
            ShadButton(onPressed: () {}, child: const Text('Deploy')),
          ],
        ),
      ],
    ),
  );

  Widget _feedback() => ShadCard(
    title: const Text('Feedback'),
    description: const Text('Communicate status with clarity.'),
    child: Column(
      children: [
        const ShadAlert(
          icon: Icon(Icons.check_circle_outline),
          title: Text('Project deployed'),
          description: Text('Your project is now live and ready to visit.'),
        ),
        const SizedBox(height: 14),
        const ShadAlert(
          variant: ShadAlertVariant.destructive,
          icon: Icon(Icons.error_outline),
          title: Text('Something went wrong'),
          description: Text('Check the fields and try again.'),
        ),
        const SizedBox(height: 20),
        const Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ShadBadge(child: Text('New')),
            ShadBadge(variant: ShadBadgeVariant.secondary, child: Text('Beta')),
            ShadBadge(variant: ShadBadgeVariant.outline, child: Text('Draft')),
          ],
        ),
      ],
    ),
  );
}
