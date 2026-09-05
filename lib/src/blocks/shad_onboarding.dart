import 'package:flutter/material.dart';

import '../components/shad_button.dart';
import '../components/shad_card.dart';
import '../components/shad_text.dart';
import '../theme/shad_theme.dart';

class ShadOnboardingStep {
  const ShadOnboardingStep({
    required this.title,
    required this.description,
    this.icon,
  });

  final String title;
  final String description;
  final Widget? icon;
}

class ShadOnboarding extends StatefulWidget {
  const ShadOnboarding({
    super.key,
    required this.steps,
    this.onComplete,
    this.onSkip,
    this.nextLabel = 'Next',
    this.backLabel = 'Back',
    this.skipLabel = 'Skip',
    this.finishLabel = 'Get started',
  });

  final List<ShadOnboardingStep> steps;
  final VoidCallback? onComplete;
  final VoidCallback? onSkip;
  final String nextLabel;
  final String backLabel;
  final String skipLabel;
  final String finishLabel;

  @override
  State<ShadOnboarding> createState() => _ShadOnboardingState();
}

class _ShadOnboardingState extends State<ShadOnboarding> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _next() {
    if (_currentIndex == widget.steps.length - 1) {
      widget.onComplete?.call();
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.steps.isEmpty) return const SizedBox.shrink();
    final style = context.shadStyle;
    final isFirst = _currentIndex == 0;
    final isLast = _currentIndex == widget.steps.length - 1;

    return ShadCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 180,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.steps.length,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (context, index) {
                final step = widget.steps[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (step.icon != null) ...[
                      step.icon!,
                      SizedBox(height: style.spacing),
                    ],
                    ShadText(
                      step.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: style.spacing / 2),
                    ShadText(step.description, textAlign: TextAlign.center),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: style.spacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var index = 0; index < widget.steps.length; index++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    width: index == _currentIndex ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: index == _currentIndex
                          ? context.shadColors.primary
                          : context.shadColors.muted,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: style.spacing),
          Row(
            children: [
              if (!isFirst)
                ShadButton(
                  variant: ShadButtonVariant.outline,
                  onPressed: () => _pageController.previousPage(
                    duration: const Duration(milliseconds: 240),
                    curve: Curves.easeOut,
                  ),
                  child: ShadText(widget.backLabel),
                ),
              const Spacer(),
              if (!isLast && widget.onSkip != null)
                ShadButton(
                  variant: ShadButtonVariant.ghost,
                  onPressed: widget.onSkip,
                  child: ShadText(widget.skipLabel),
                ),
              ShadButton(
                onPressed: _next,
                child: ShadText(isLast ? widget.finishLabel : widget.nextLabel),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
