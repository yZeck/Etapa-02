import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EnglishTalk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity),
        
      home: HomePage(),
      
    );
  
  }

}

