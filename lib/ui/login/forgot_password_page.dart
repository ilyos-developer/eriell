import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();

  bool _btnColor = false;

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      validate();
    });
  }

  void validate() {
    if (_emailController.text.isNotEmpty) {
      setState(() {
        _btnColor = true;
      });
    } else {
      setState(() {
        _btnColor = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 82),
              SvgPicture.asset("assets/icons/logo.svg", height: 50),
              SizedBox(
                height: 46,
              ),
              Text(
                'Восстановление доступа',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Введите почту, чтобы получить ссылку\nдля изменения пароля',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 14),
              Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) =>
                    value!.isEmpty ? 'Пустое поле' : null,
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Введите E-mail',
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
                ),
              ),
              SizedBox(height: 14),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                child: MaterialButton(
                  onPressed: () {
                    if (_emailController.text.isNotEmpty) {}
                  },
                  elevation: 0.0,
                  height: 60,
                  minWidth: MediaQuery.of(context).size.width,
                  child: Text(
                    'Войти',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: _btnColor
                      ? Colors.blue
                      : Color.fromRGBO(211, 214, 218, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    )
        : CupertinoPageScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 82),
              SvgPicture.asset("assets/icons/logo.svg", height: 50),
              SizedBox(
                height: 46,
              ),
              Text(
                'Восстановление доступа',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Введите почту, чтобы получить ссылку\nдля изменения пароля',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CupertinoFormSection(
                  children: [
                    CupertinoFormRow(
                      child: CupertinoTextFormFieldRow(
                        controller: _emailController,
                        placeholder: "Введите E-mail",
                      ),
                      prefix: Text("E-mail"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              CupertinoButton(
                color: _btnColor
                    ? kPrimaryColor
                    : Color.fromRGBO(211, 214, 218, 1),
                child: Text(
                  'Войти',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  if (_emailController.text.isNotEmpty) {

                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}