import 'package:flutter/material.dart';

import '../components/shad_button.dart';
import '../components/shad_card.dart';
import '../components/shad_checkbox.dart';
import '../components/shad_input.dart';
import '../components/shad_password_field.dart';
import '../components/shad_text.dart';
import '../components/shad_text_button.dart';
import '../theme/shad_theme.dart';

class ShadLoginForm extends StatefulWidget {
  const ShadLoginForm({
    super.key,
    this.emailController,
    this.passwordController,
    this.onSubmitted,
    this.onForgotPassword,
    this.onCreateAccount,
    this.title = 'Welcome back',
    this.description = 'Enter your email and password to continue.',
    this.submitLabel = 'Sign in',
    this.forgotPasswordLabel = 'Forgot password?',
    this.createAccountLabel = 'Create an account',
    this.rememberMe = true,
    this.showRememberMe = true,
    this.showCreateAccount = true,
  });

  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final VoidCallback? onSubmitted;
  final VoidCallback? onForgotPassword;
  final VoidCallback? onCreateAccount;
  final String title;
  final String description;
  final String submitLabel;
  final String forgotPasswordLabel;
  final String createAccountLabel;
  final bool rememberMe;
  final bool showRememberMe;
  final bool showCreateAccount;

  @override
  State<ShadLoginForm> createState() => _ShadLoginFormState();
}

class _ShadLoginFormState extends State<ShadLoginForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late bool _rememberMe;

  @override
  void initState() {
    super.initState();
    _emailController = widget.emailController ?? TextEditingController();
    _passwordController = widget.passwordController ?? TextEditingController();
    _rememberMe = widget.rememberMe;
  }

  @override
  void dispose() {
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
            controller: _emailController,
            label: 'Email',
            hintText: 'name@example.com',
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: style.spacing),
          ShadPasswordField(
            controller: _passwordController,
            label: 'Password',
            hintText: 'Enter your password',
          ),
          if (widget.showRememberMe) ...[
            SizedBox(height: style.spacing),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              runSpacing: 8,
              children: [
                ShadCheckbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() => _rememberMe = value ?? false);
                  },
                  label: const ShadText('Remember me'),
                ),
                if (widget.onForgotPassword != null)
                  ShadTextButton(
                    onPressed: widget.onForgotPassword,
                    variant: ShadButtonVariant.link,
                    child: ShadText(widget.forgotPasswordLabel),
                  ),
              ],
            ),
          ],
          SizedBox(height: style.spacing),
          ShadButton(
            onPressed: widget.onSubmitted,
            child: ShadText(widget.submitLabel),
          ),
          if (widget.showCreateAccount || widget.onCreateAccount != null) ...[
            SizedBox(height: style.spacing),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 4,
              children: [
                ShadText('Need an account?'),
                ShadTextButton(
                  onPressed: widget.onCreateAccount,
                  variant: ShadButtonVariant.link,
                  child: ShadText(widget.createAccountLabel),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
