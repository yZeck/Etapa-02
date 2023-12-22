import'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/pages/home_contoller.dart';
import 'package:flutter_application_1/models/Usuarios.dart';
import 'package:flutter_application_1/pages/usuarios_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 var controller;


 @override
 void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
     Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Lista usuários'),
      ),
      body: ListView.separated(
        itemCount: controller.tabela.length,
        itemBuilder: (BuildContext contexto, int usuarios){
          final  List<Usuarios> tabela =  controller.tabela;
          return ListTile(
            leading: Image.network(tabela[usuarios].avatar),
            title: Text(tabela[usuarios].nome),
            trailing: Text(
              tabela[usuarios].pontos.toString(),
            ),
            onTap: (){
              Navigator.push(
                contexto, MaterialPageRoute(
                  builder: (_) => UsuariosPage(
                    key: Key(tabela[usuarios].nome),
                    usuarios: tabela[usuarios]
                  ),
                  ));
            }

          );
        },
        separatorBuilder: (_,__) => Divider(),
        padding: EdgeInsets.all(16),
      ),
      );

      
  }
  
  
 
}