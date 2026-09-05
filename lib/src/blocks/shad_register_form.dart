import 'package:flutter/material.dart';

import '../components/shad_button.dart';
import '../components/shad_card.dart';
import '../components/shad_input.dart';
import '../components/shad_password_field.dart';
import '../components/shad_text.dart';
import '../components/shad_text_button.dart';
import '../theme/shad_theme.dart';

class ShadRegisterForm extends StatefulWidget {
  const ShadRegisterForm({
    super.key,
    this.nameController,
    this.emailController,
    this.passwordController,
    this.onSubmitted,
    this.onSignIn,
    this.title = 'Create account',
    this.description = 'Set up your account to start managing projects.',
    this.submitLabel = 'Create account',
    this.signInLabel = 'Sign in',
    this.showSignIn = true,
  });

  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final VoidCallback? onSubmitted;
  final VoidCallback? onSignIn;
  final String title;
  final String description;
  final String submitLabel;
  final String signInLabel;
  final bool showSignIn;

  @override
  State<ShadRegisterForm> createState() => _ShadRegisterFormState();
}

class _ShadRegisterFormState extends State<ShadRegisterForm> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = widget.nameController ?? TextEditingController();
    _emailController = widget.emailController ?? TextEditingController();
    _passwordController = widget.passwordController ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.nameController == null) _nameController.dispose();
    if (widget.emailController == null) _emailController.dispose();
    if (widget.passwordController == null) _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = context.shadStyle;

    return ShadCard(
      title: ShadText(
        widget.title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      description: ShadText(widget.description),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ShadInput(
            controller: _nameController,
            label: 'Full name',
            hintText: 'Jane Doe',
          ),
          SizedBox(height: style.spacing),
          ShadInput(
            controller: _emailController,
            label: 'Email',
            hintText: 'name@example.com',
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: style.spacing),
          ShadPasswordField(
            controller: _passwordController,
            label: 'Password',
            hintText: 'Create a password',
          ),
          SizedBox(height: style.spacing),
          ShadButton(
            onPressed: widget.onSubmitted,
            child: ShadText(widget.submitLabel),
          ),
          if (widget.showSignIn || widget.onSignIn != null) ...[
            SizedBox(height: style.spacing),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShadText('Already have an account?'),
                const SizedBox(width: 4),
                ShadTextButton(
                  onPressed: widget.onSignIn,
                  variant: ShadButtonVariant.link,
                  child: ShadText(widget.signInLabel),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
