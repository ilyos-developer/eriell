import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/custom_text_field.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  bool _btnColor = false;

  @override
  void initState() {
    super.initState();

    _nameController.addListener(() {
      validate();
    });

    _emailController.addListener(() {
      validate();
    });

    _passwordController.addListener(() {
      validate();
    });

    _phoneController.addListener(() {
      validate();
    });
  }

  void validate() {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty) {
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
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/logo.svg", height: 50),
                  SizedBox(
                    height: 46,
                  ),
                  Text(
                    'Регистрация',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    title: "Имя и Фамилия",
                    controller: _nameController,
                  ),
                  CustomTextField(
                    title: "Email",
                    controller: _emailController,
                  ),
                  CustomTextField(
                    title: "Придумайте пароль",
                    controller: _passwordController,
                    isObscureText: true,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      validator: (value) => value!.isEmpty ? 'Пустое поле' : null,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Номер телефона',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 5,
                            bottom: 5,
                          ),
                          child: Container(
                            padding: EdgeInsets.only(top: 10, right: 8),
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Color.fromRGBO(174, 179, 183, 1),
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: Text(
                              '+7',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
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
                  SizedBox(height: 14),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('validate');
                        }
                      },
                      elevation: 0.0,
                      height: 60,
                      minWidth: MediaQuery.of(context).size.width,
                      child: Text(
                        'Зарегистрироваться',
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
                  SizedBox(height: 8),
                  Text(
                    'Регистрируясь, вы принимаете наши Условия,\nПолитику использования данных и Политику\nв отношении файлов cookie.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(174, 179, 183, 1),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Есть аккаунт?  ',
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                              (Route<dynamic> route) => false);
                        },
                        child: Ink(
                          child: Text(
                            'Вход',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
