import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String iconPath;
  final String hintText;
  final TextInputType keyboardType;
  final bool isPasswordField;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.iconPath,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.isPasswordField = false,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              widget.iconPath,
              color: Theme.of(context).primaryColor,
            ),
            Text(' ${widget.label}')
          ],
        ),
        suffixIcon: widget.isPasswordField
            ? InkWell(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
      keyboardType: widget.keyboardType,
      obscureText: widget.isPasswordField ? isObscure : false,
    );
  }
}
