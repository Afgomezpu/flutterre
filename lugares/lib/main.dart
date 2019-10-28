import 'package:flutter/material.dart';
import 'package:lugares/establecimiento.dart';
import 'package:lugares/form.dart';
import 'package:lugares/multi_form.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Multi Form',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.greenAccent,
      ),
      home: MultiForm(),
    );
  }
}