import 'package:flutter/material.dart';
import 'package:tictic/styles/colors.dart';
import 'package:tictic/widgets/text_input.dart';
import '../../utils/validations.dart';

@immutable
class PasswordInput extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? initialValue;

  const PasswordInput({super.key, this.onChanged, this.initialValue});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isObscure = true;
  IconData _suffixIcon = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    return TextInput(
      prefixIcon: Icons.password,
      hintText: '******',
      onChanged: widget.onChanged,
      labelText: 'Mot de passe',
      obscureText: _isObscure,
      initialValue: "1234567890",
      keyboardType: TextInputType.visiblePassword,
      validator: validatePassword,
      suffixIcon: GestureDetector(
        child: Icon(_isObscure ? Icons.visibility_off : Icons.visibility,
            color: kMainColor),
        onTap: () {
          setState(() {
            _isObscure = !_isObscure;
          });
        },
      ),
    );
  }
}
