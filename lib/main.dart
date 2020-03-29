import 'package:eventful_app/pages/home.dart';
import 'package:eventful_app/pages/login.dart';
import 'package:eventful_app/pages/register.dart';
import 'package:eventful_app/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>.value(
          value: Auth(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xff023429),
        ),
        home: LoginPage(),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          LoginPage.routeName: (context) => LoginPage(),
          RegisterPage.routeName: (context) => RegisterPage(),
        },
      ),
    );
  }
}
