import 'dart:io';
import 'package:eriell/bloc/home/home_bloc.dart';
import 'package:eriell/ui/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc()..add(GetUsers()),
        ),
      ],
      child: Platform.isIOS
          ? CupertinoApp(
              title: 'Eriell App',
              theme: CupertinoThemeData(
                scaffoldBackgroundColor: CupertinoColors.white,
                primaryColor: Colors.blue,
              ),
              home: SplashScreen(),
            )
          : MaterialApp(
              title: 'Eriell App',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: SplashScreen(),
            ),
    );
  }
}
