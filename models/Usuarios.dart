import 'package:flutter/material.dart';

import  'Progresso.dart';

class Usuarios{
  String nome;
  String avatar;
  int pontos;
  Color cor;
  List<Progresso> progressos = [];

  Usuarios({required this.avatar, required this.nome, required this.pontos, required this.cor});

}