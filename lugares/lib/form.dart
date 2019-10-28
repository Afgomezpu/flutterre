import 'package:flutter/material.dart';
import 'package:lugares/establecimiento.dart';


typedef OnDelete();
class EstablecimientoForm extends StatefulWidget {
  final Establecimiento establecimiento;
  final state = _EstablecimientoFormState();
  final OnDelete onDelete;

  EstablecimientoForm({Key key, this.establecimiento, this.onDelete}): super(key: key);
  @override
  _EstablecimientoFormState createState() => state;

  bool isValid()=> state.validate();
}

class _EstablecimientoFormState extends State<EstablecimientoForm> {
  final form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: Icon(Icons.home),
                title: Text('Informacion del Establecimiento'),
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: widget.onDelete,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: widget.establecimiento.nombre,
                  onSaved: (val)=>widget.establecimiento.nombre = val,
                  validator: (val)=>
                    val.length>3 ? null : 'Nombre muy pequeño (minimo 4 letras)',
                  decoration: InputDecoration(
                    labelText: 'Nombre del establecimiento', hintText: 'Introdusca el nombre de su establecimiento',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: widget.establecimiento.direccion,
                  onSaved: (val)=>widget.establecimiento.direccion = val,
                  decoration: InputDecoration(
                    labelText: 'Dirección del establecimiento', hintText: 'Introdusca la dirección de su establecimiento',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: widget.establecimiento.ciudad,
                  onSaved: (val)=>widget.establecimiento.ciudad = val,
                  decoration: InputDecoration(
                    labelText: 'Ciudad del establecimiento', hintText: 'Introdusca la ciudad de su establecimiento',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: widget.establecimiento.departamento,
                  onSaved: (val)=>widget.establecimiento.departamento = val,
                  validator: (val)=>
                  val.length>3 ? null : 'Nombre muy pequeño (minimo 4 letras)',
                  decoration: InputDecoration(
                    labelText: 'Departamento del establecimiento', hintText: 'Introdusca el departamento de su establecimiento',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: widget.establecimiento.precio,
                  onSaved: (val)=>widget.establecimiento.precio = val,
                  decoration: InputDecoration(
                    labelText: 'Precio del establecimiento', hintText: 'Introdusca el precio de su establecimiento',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: widget.establecimiento.descripcion,
                  onSaved: (val)=>widget.establecimiento.descripcion = val,
                  decoration: InputDecoration(
                    labelText: 'Descripción del establecimiento', hintText: 'Introdusca la descripción de su establecimiento',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///form validator
  bool validate(){
    var valid = form.currentState.validate();
    if(valid) form.currentState.save();
    return valid;
  }
}
