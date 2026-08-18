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
    theme: ShadTheme.light(),
    darkTheme: ShadTheme.dark(),
    themeMode: mode,
    home: GalleryPage(
      onThemeChanged: () => setState(
        () => mode = mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
      ),
    ),
  );
}

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key, required this.onThemeChanged});
  final VoidCallback onThemeChanged;
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
                            onPressed: onThemeChanged,
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
                      const Text(
                        'Build beautiful apps\nwithout fighting the defaults.',
                        style: TextStyle(
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
                          if (box.maxWidth < 760)
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
