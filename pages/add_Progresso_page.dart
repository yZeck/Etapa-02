import 'package:flutter/material.dart';

import '../models/Usuarios.dart';
import '../models/Progresso.dart';


class AddProgressoPage extends StatefulWidget {
  Usuarios usuario;
  ValueChanged<Progresso> onSave;

  AddProgressoPage({Key? key, required this.usuario, required this.onSave}): super(key: key);

  @override
  State<AddProgressoPage> createState() => _AddProgressoPageState();
}

class _AddProgressoPageState extends State<AddProgressoPage> {
  final _conquista = TextEditingController();
  final _ano = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Conquista'),
      ),

      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //ano
            Padding(
              padding: EdgeInsets.all(24),
              child: TextFormField(
                controller: _ano,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ano',
                ),
                keyboardType: TextInputType.number, 
                validator: (value) {
                  if(value!.isEmpty){
                    return  'Informe o ano da conquista!';
                  }
                  return null;
                },
                ),
            ),

            //Campeonato
             Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: TextFormField(
                controller: _conquista,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Conquista',
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return  'Informe Qual é a conquista!';
                  }
                  return null;
                },
                ),
            ),

            //Salvar
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.all(24.0),
                child: ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      widget.onSave(
                        Progresso(conquista: _conquista.text, ano: _ano.text)
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Salvar', style: TextStyle(fontSize: 20),),
                        )
                    ],
                  ), 
                  ),
              )
              )
          ],
          ),
        )
    );
  }
}