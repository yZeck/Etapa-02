
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Usuarios.dart';
import 'package:flutter_application_1/models/Progresso.dart';
import 'package:flutter_application_1/repository/Usuarios_Repository.dart';

class HomeController{
    late UsuariossRepository timesRepository;

   List<Usuarios> get tabela => timesRepository.Usuarioss;

    HomeController() {
    timesRepository = UsuariossRepository();
  }
  
}