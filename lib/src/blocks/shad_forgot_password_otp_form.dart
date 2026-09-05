import 'package:flutter/material.dart';

import '../components/shad_button.dart';
import '../components/shad_card.dart';
import '../components/shad_input.dart';
import '../components/shad_text.dart';
import '../theme/shad_theme.dart';

class ShadForgotPasswordOtpForm extends StatefulWidget {
  const ShadForgotPasswordOtpForm({
    super.key,
    this.otpController,
    this.onSubmitted,
    this.onResend,
    this.title = 'Enter verification code',
    this.description = 'Enter the code we sent to your email address.',
    this.submitLabel = 'Verify code',
    this.resendLabel = 'Resend code',
  });

  final TextEditingController? otpController;
  final VoidCallback? onSubmitted;
  final VoidCallback? onResend;
  final String title;
  final String description;
  final String submitLabel;
  final String resendLabel;

  @override
  State<ShadForgotPasswordOtpForm> createState() =>
      _ShadForgotPasswordOtpFormState();
}

class _ShadForgotPasswordOtpFormState extends State<ShadForgotPasswordOtpForm> {
  late final TextEditingController _otpController;

  @override
  void initState() {
    super.initState();
    _otpController = widget.otpController ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.otpController == null) _otpController.dispose();
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
            controller: _otpController,
            label: 'Verification code',
            hintText: '123456',
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: style.spacing),
          ShadButton(
            onPressed: widget.onSubmitted,
            child: ShadText(widget.submitLabel),
          ),
          if (widget.onResend != null) ...[
            SizedBox(height: style.spacing / 2),
            ShadButton(
              variant: ShadButtonVariant.link,
              onPressed: widget.onResend,
              child: ShadText(widget.resendLabel),
            ),
          ],
        ],
      ),
    );
  }
}
