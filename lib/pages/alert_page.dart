import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_widget/pages/guardar_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertPage extends StatelessWidget {
  AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tipos  alerta"),
      ),
      body: Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Alert Dialog"),
                  onPressed: () => _alertDialog(context),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Simple Dialog"),
                  onPressed: () => _showDialog(context),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Show Modal"),
                  onPressed: () => _showModal(context),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Show Toast"),
                  onPressed: () => _showToast(context),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Dialogo Personalizado"),
                  onPressed: () => _dialogPersonal(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _alertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerta de dialogo'),
          content: Text('En este solo mostramos mensajes de advertencia '),
          actions: <Widget>[
            FlatButton(
              child: Text('salir'),
              onPressed: () {
                Navigator.of(context).pop('ok');
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("Dialogo simple"),
            children: <Widget>[
              ListTile(
                title: Text("Ejemplo 1 eliminar"),
                leading: Icon(Icons.delete),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Ejemplo 2 Editar"),
                leading: Icon(Icons.edit),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        });
  }

  void _showModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Alerta de"),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Show Modal"),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text("Boton"),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        });
  }

  void _showToast(BuildContext context) {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.amber,
        textColor: Colors.blue,
        fontSize: 16.0);
  }

  void _dialogPersonal(BuildContext context) {
    String _texto = '¿Algo que quieras recordar?';
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: _texto),
                    ),
                    SizedBox(
                      width: 320.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GuardarPage(_texto)),
                          );
                        },
                        child: Text(
                          "Escribir Recordatorio",
                          style: TextStyle(color: Colors.pink),
                        ),
                        color: const Color(0xFF1BC0C5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
