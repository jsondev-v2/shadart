import 'package:flutter/material.dart';
import 'package:shadart/shadart.dart';

class FormDemo extends StatefulWidget {
  const FormDemo({super.key});
  @override
  State<FormDemo> createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  bool checked = true;
  bool switched = true;
  int radioValue = 1;
  double sliderValue = .65;
  String? dropdownValue = 'Flutter';
  @override
  Widget build(BuildContext context) => ShadCard(
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
}
