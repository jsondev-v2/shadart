import 'package:flutter/material.dart';

import '../components/shad_button.dart';
import '../components/shad_card.dart';
import '../components/shad_input.dart';
import '../components/shad_text.dart';
import '../theme/shad_theme.dart';

class ShadForgotPasswordEmailForm extends StatefulWidget {
  const ShadForgotPasswordEmailForm({
    super.key,
    this.emailController,
    this.onSubmitted,
    this.title = 'Forgot password?',
    this.description = 'Enter your email and we will send you a reset code.',
    this.submitLabel = 'Send reset code',
  });

  final TextEditingController? emailController;
  final VoidCallback? onSubmitted;
  final String title;
  final String description;
  final String submitLabel;

  @override
  State<ShadForgotPasswordEmailForm> createState() =>
      _ShadForgotPasswordEmailFormState();
}

class _ShadForgotPasswordEmailFormState
    extends State<ShadForgotPasswordEmailForm> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = widget.emailController ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.emailController == null) _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = context.shadStyle;
    return ShadCard(
      title: ShadText(widget.title),
      description: ShadText(widget.description),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ShadInput(
            controller: _emailController,
            label: 'Email',
            hintText: 'name@example.com',
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: style.spacing),
          ShadButton(
            onPressed: widget.onSubmitted,
            child: ShadText(widget.submitLabel),
          ),
        ],
      ),
    );
  }
}
