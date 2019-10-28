import 'dart:convert';
import 'dart:async';  
import 'package:flutter/material.dart';
import 'package:segundaentrega/Paginas/InicioSesion.dart';
import 'package:segundaentrega/Paginas/Principal.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

String username='';

Future<persona> fetchPost() async{
final response = await http.get('https://localhost:44309/api/usuario');
if(response.statusCode==200){
 return persona.fromJson(json.decode(response.body));

}else {
  throw Exception('error conexion');
}
}

class persona{
final int id;
final String nombre;
final String apellido;
final String usuario;
final String password;
persona({this.id,this.nombre,this.apellido,this.usuario,this.password});
factory persona.fromJson(Map<String,dynamic> Json){
  return persona(
    id: Json['id'],
    nombre: Json['nombre'],
    apellido: Json['apellido'],
    usuario: Json['usuario'],
    password: Json['password']
  );
}
}

class MyApp extends StatelessWidget {
   //Future<persona> persona;
  //MyApp({Key key, this.persona}) :super(key:key);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Software III',     
      home: new Ingresar(),
      routes: <String,WidgetBuilder>{
        '/InicioSesion': (BuildContext context)=> new InicioSesion(),
        '/Principal': (BuildContext context)=> new Principal(),
        '/Ingresar': (BuildContext context)=> new Ingresar(),
      },
    );
  }
}

class Ingresar extends StatefulWidget {
  @override
  _IngresarState createState() => _IngresarState();
}

class _IngresarState extends State<Ingresar> {

TextEditingController nombre=new TextEditingController();
TextEditingController contrasena=new TextEditingController();
TextEditingController apellido=new TextEditingController();
TextEditingController usuario=new TextEditingController();

String mensaje='';

Future<List> _login() async {
  final response = await http.post("http://192.168.0.20/software3/login.php", body: {
    "username": usuario.text,
    "password": contrasena.text,
  });

  var datauser = json.decode(response.body);

  if(datauser.length==0){
    setState(() {
          mensaje ="contraseña o correo invalido";
        });
  }else{
    if(datauser[0]['nivel']=='Vendedor'){
       Navigator.pushReplacementNamed(context, '/InicioSesion');
    }else if(datauser[0]['nivel']=='Usuario'){
      Navigator.pushReplacementNamed(context, '/Principal');
    }

    setState(() {
          username= datauser[0]['username'];
        });

  }
return datauser;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Center(child: Text('Registrar',style:TextStyle(fontSize: 18) ,))),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Nombre",style: TextStyle(fontSize: 17),),
              TextField(   
                controller: nombre,                
                decoration: InputDecoration(
                  hintText: 'Nombre'
                ),           
                ),
              Text("Apellido",style: TextStyle(fontSize: 17),),
              TextField(  
                controller: apellido,                  
                 decoration: InputDecoration(
                  hintText: 'Apellido'
                ),                
                ),
               Text("Usuario",style: TextStyle(fontSize: 17),),
              TextField(  
                controller: usuario,                                 
                 decoration: InputDecoration(
                  hintText: 'usuario'
                ),                
                ),
                Text("Contrasena",style: TextStyle(fontSize: 17),),
              TextField(  
                controller: contrasena,              
                obscureText: true,
                 decoration: InputDecoration(
                  hintText: 'contraseña'
                ),                
                ),

              RaisedButton(
                child: Text("Login"),
                onPressed: webservice,
              ),

              Text(mensaje,style: TextStyle(fontSize: 20.0,color: Colors.red),)
             

            ],
          ),
        ),
      ),
    );
}

void webservice(){
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context){
      return Scaffold(appBar: AppBar(title: Text('sesion iniciada'),
      ),
      body: Center(child: FutureBuilder<persona>( builder :(context,snapchot){
        if(snapchot.hasData){
        return Text(snapchot.data.nombre);
        }else if (snapchot.hasError){
          return Text('error');
        }
       return CircularProgressIndicator();
      },
      
      ),)
      );
    }
)
);
 

}
}