import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validate;
  final String title;
  late bool isObscureText;

  CustomTextField(
      {Key? key,
      this.controller,
      this.validate,
      required this.title,
      this.isObscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        validator: (value) => value!.isEmpty ? 'Пустое поле' : null,
        obscureText: isObscureText,
        decoration: InputDecoration(
          labelText: title,
          filled: true,
          fillColor: Color.fromRGBO(245, 245, 245, 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
