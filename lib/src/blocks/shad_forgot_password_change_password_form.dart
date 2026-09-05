import 'package:flutter/material.dart';

import '../components/shad_button.dart';
import '../components/shad_card.dart';
import '../components/shad_password_field.dart';
import '../components/shad_text.dart';
import '../theme/shad_theme.dart';

class ShadForgotPasswordChangePasswordForm extends StatefulWidget {
  const ShadForgotPasswordChangePasswordForm({
    super.key,
    this.passwordController,
    this.confirmPasswordController,
    this.onSubmitted,
    this.title = 'Create a new password',
    this.description = 'Choose a strong password for your account.',
    this.submitLabel = 'Update password',
  });

  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
  final VoidCallback? onSubmitted;
  final String title;
  final String description;
  final String submitLabel;

  @override
  State<ShadForgotPasswordChangePasswordForm> createState() =>
      _ShadForgotPasswordChangePasswordFormState();
}

class _ShadForgotPasswordChangePasswordFormState
    extends State<ShadForgotPasswordChangePasswordForm> {
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _passwordController = widget.passwordController ?? TextEditingController();
    _confirmPasswordController =
        widget.confirmPasswordController ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.passwordController == null) _passwordController.dispose();
    if (widget.confirmPasswordController == null) {
      _confirmPasswordController.dispose();
    }
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
          ShadPasswordField(
            controller: _passwordController,
            label: 'New password',
            hintText: 'Enter a new password',
          ),
          SizedBox(height: style.spacing),
          ShadPasswordField(
            controller: _confirmPasswordController,
            label: 'Confirm password',
            hintText: 'Re-enter your password',
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
