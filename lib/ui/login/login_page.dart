import 'dart:io';
import 'package:eriell/ui/constants.dart';
import 'package:eriell/ui/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'forgot_password_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _btnColor = false;

  @override
  void initState() {
    super.initState();

    _loginController.addListener(() {
      validate();
    });

    _passwordController.addListener(() {
      validate();
    });
  }

  void validate() {
    if (_loginController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
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
                    SvgPicture.asset(
                      "assets/icons/logo.svg",
                      height: 50,
                    ),
                    SizedBox(
                      height: 46,
                    ),
                    Text(
                      'Вход',
                      style: TextStyle(
                        color: CupertinoColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: _loginController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              autofocus: false,
                              validator: (value) =>
                                  value!.isEmpty ? 'Пустое поле' : null,
                              decoration: InputDecoration(
                                labelText: 'Логин',
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
                          SizedBox(height: 18),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Stack(
                              children: [
                                TextFormField(
                                  controller: _passwordController,
                                  textInputAction: TextInputAction.done,
                                  obscureText: true,
                                  autofocus: false,
                                  validator: (value) =>
                                      value!.isEmpty ? 'Пустое поле' : null,
                                  decoration: InputDecoration(
                                    labelText: 'Пароль',
                                    filled: true,
                                    fillColor: Color.fromRGBO(245, 245, 245, 1),
                                    suffixIcon: _passwordController.text.isEmpty
                                        ? Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                left: BorderSide(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.12),
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                            child: TextButton(
                                              child: Text(
                                                'Забыли пароль?',
                                                style: TextStyle(
                                                    color: kPrimaryColor),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ForgotPassword(),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        : Container(
                                            width: 0,
                                            height: 0,
                                          ),
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                              (route) => false,
                            );
                          }
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
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'У вас ещё нет аккаунта?',
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Зарегистрируйтесь',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                      ],
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
                    SvgPicture.asset(
                      "assets/icons/logo.svg",
                      height: 50,
                    ),
                    SizedBox(
                      height: 46,
                    ),
                    CupertinoFormSection(
                      header: Center(
                        child: Text(
                          "Вход",
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                      children: [
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            controller: _loginController,
                            placeholder: "Введите логин",
                          ),
                          prefix: Text("Логин"),
                        ),
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            controller: _passwordController,
                            placeholder: "Введите пароль",
                            obscureText: true,
                          ),
                          prefix: Text("Пароль"),
                          helper: _passwordController.text.isEmpty
                              ? TextButton(
                                  child: Text(
                                    'Забыли пароль?',
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => ForgotPassword(),
                                      ),
                                    );
                                  },
                                )
                              : null,
                        )
                      ],
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
                        if (_loginController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                            (route) => false,
                          );
                        }
                      },
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'У вас ещё нет аккаунта?',
                        ),
                        TextButton(
                          child: Text(
                            'Зарегистрируйтесь',
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
