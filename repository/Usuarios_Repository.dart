import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Usuarios.dart';
import 'package:flutter_application_1/models/Progresso.dart';

class UsuariossRepository{

  final List<Usuarios> _usuarios = [];

  get Usuarioss => this._usuarios;

  void addProgresso({required Usuarios Usuarios, required Progresso Progresso}){
    Usuarios.progressos.add(Progresso);

  }

  UsuariossRepository(){
    _usuarios.addAll([
      Usuarios(
        avatar: '30',
         nome: 'Flamengo',
          pontos: 50,
          cor: const Color.fromARGB(255, 223, 13, 13)),
    ] );
  }
}