import 'package:flutter/cupertino.dart';

class CustomTextFormField extends StatelessWidget {

  CustomTextFormField({Key? key, this.controller, required this.title, this.isObscureText = false}) : super(key: key);

  final TextEditingController? controller;
  final String title;
  bool isObscureText;

  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      child: CupertinoTextFormFieldRow(
        controller: controller,
        placeholder: "Введите $title",
        obscureText: isObscureText,
      ),
      prefix: Text(title),
    );
  }
}