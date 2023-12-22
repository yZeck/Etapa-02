import 'dart:io';

import'package:flutter/material.dart';
import 'package:flutter_application_1/models/Usuarios.dart';
import 'package:flutter_application_1/models/Progresso.dart';
import 'package:flutter_application_1/pages/add_Progresso_page.dart';

class UsuariosPage extends StatefulWidget {
  Usuarios usuarios;
  UsuariosPage({required Key key, required this.usuarios}): super(key: key);

  @override
  State<UsuariosPage> createState() => _usuariosPageState();
}

class _usuariosPageState extends State<UsuariosPage> {

  progressoPage(){
    Navigator.push(context, MaterialPageRoute(builder: (_) => 
    AddProgressoPage(usuario: widget.usuarios, onSave: this.addProgresso
    ),
    )
    );
  }

  addProgresso(Progresso progresso){
    setState(() {
      widget.usuarios.progressos.add(progresso);
    });

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Salvo com Sucesso!')));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.usuarios.cor,
          title: Text(widget.usuarios.nome),
          actions: [IconButton(icon: Icon(Icons.add), onPressed: progressoPage)],
          bottom: TabBar(tabs: [
            Tab(
            icon: Icon(Icons.stacked_line_chart),
            text:  'Estatísticas',
            ),
            Tab(
              icon: Icon(Icons.emoji_events),
              text: 'Conquista',
            )
          ],
          indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Padding(
              padding: EdgeInsets.all(24),
              child: Image.network(widget.usuarios.avatar.replaceAll("40x40","100x100")),

            ),
            
            Text('Pontos: ${widget.usuarios.pontos}',
            style: TextStyle(fontSize: 22),
            )
          ],
          ),
          progressos(),
          ],
          ),
      ),
    );
  }

  Widget progressos(){
  final quantidade = widget.usuarios.progressos.length;
  return quantidade == 0
  ? Container(
    child: Center(
      child:Text('Nenhuma Conquista ainda'),
       ),
    )

    : ListView.separated(
      itemBuilder: (BuildContext context, int index){
       return ListTile(
        leading: Icon(Icons.emoji_events),
        title: Text(widget.usuarios.progressos[index].conquista),
        trailing: Text(widget.usuarios.progressos[index].ano),
       );
        },
       separatorBuilder: (_,__) => Divider(),
      itemCount: quantidade,
    );

}
}

