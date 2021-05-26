import 'package:flutter/material.dart';
import 'package:flutter_application_widget/providers/menu_provider.dart';
import 'package:flutter_application_widget/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Itzel'),
      ),
      body: _lista(context),
    );
  }

  Widget _lista(BuildContext context) {
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: _listI(snapshot.data, context),
          );
        });
  }

  List<Widget> _listI(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((otp) {
      final widgetTemp = ListTile(
        title: Text(otp['texto']),
        leading: getIcon(otp['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right_sharp,
          color: Colors.pinkAccent,
        ),
        onTap: () {
          Navigator.pushNamed(context, otp['ruta']);
          /*showDialog(
            context: context,
            builder: (BuildContext context) => _dialog(context, otp['texto']),
          );*/
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }

  Widget _buildPopUpDialog(BuildContext context, String opt) {
    return new AlertDialog(
      title: const Text('Diste click'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Soy  opcion ' + opt),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Cerrar'),
        ),
      ],
    );
  }
}
