import 'package:flutter/material.dart';

class Principal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(appBar: new AppBar(title: Text('Bienvenido'),),
    body: new Column(children: <Widget>[new Text('Lista de establecimientos')],),
    );
    
  }



}