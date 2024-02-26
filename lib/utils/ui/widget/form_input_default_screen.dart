import 'package:flutter/material.dart';
import 'package:pos/utils/ui/styles/app_theme.dart';
import 'package:pos/utils/ui/styles/colors.dart';

class FormInputDefaultScreen extends StatelessWidget {
  final Function(dynamic) onChanged;
  final String label;
  final String placehoder;
  final TextInputType? keyboardType;
  final String? initialValue;
  final bool obscureText;

  const FormInputDefaultScreen({
    Key? key,
    required this.onChanged,
    required this.label,
    required this.placehoder,
    this.keyboardType,
    this.initialValue,
    this.obscureText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              label.toString(),
              style: AppTheme.labelStyle,
            )),
        TextFormField(
          obscureText: obscureText,
          onChanged: onChanged,
          keyboardType: keyboardType,
          initialValue: initialValue,
          decoration: InputDecoration(
            focusColor: mBlueColor,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mBorderColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mBorderColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
            contentPadding: const EdgeInsets.all(10),
            hintText: placehoder.toString(),
            hintStyle: const TextStyle(fontSize: 14, color: Color(0xff6e7278)),
          ),
        ),
      ],
    );
  }
}
