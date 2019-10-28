import 'package:flutter/material.dart';
import 'package:lugares/establecimiento.dart';
import 'package:lugares/form.dart';

class MultiForm extends StatefulWidget {
  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  List<Establecimiento> establecimientos = [];
  List<EstablecimientoForm> forms = [];

  @override
  Widget build(BuildContext context) {
    forms.clear();
    for(int i=0; i<establecimientos.length; i++){
      forms.add(EstablecimientoForm(
        key:GlobalKey(),
        establecimiento: establecimientos[i],
        onDelete: ()=> onDelete(i),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Establecimiento'),
        actions: <Widget>[
          FlatButton(
            child: Text('Guardar'),
            onPressed: onSave,
          )
        ],
      ),
      body: establecimientos.length<=0 ? Center(
        child: Text('Añana establecimiento oprimiendo el boton [+] abajo'),
      )
          : ListView.builder(
        itemCount: establecimientos.length,
        itemBuilder: (_, i)=> forms,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onAddForm,
      ),
    );
  }

  ///on form user deleted
  void onDelete(int index){
    setState(() {
      establecimientos.removeAt(index);
    });
  }

  ///on add form
  void onAddForm(){
    setState(() {
      establecimientos.add(Establecimiento());
    });
  }

  ///on save forms
  void onSave(){
    forms.forEach((form)=>form.isValid());
  }
}
