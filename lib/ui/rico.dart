import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class Rico extends StatefulWidget {
  @override
  _RicoState createState() => _RicoState();
}

//classe interna do tipo State, que recebe a Class Rico
class _RicoState extends State<Rico> {

  double _contador = 6;

  void_showDialog()
  {
    showDialog(
    context: context,
    builder: (BuildContext context)
    {
      return AlertDialog(
        title: Text("Game Over"),
        content: Text("Voce Perdeu Tudo - you Lose!!"),
        actions: <Widget>[
          new FlatButton(onPressed: () => exit(0),
              child: Text("Fechar")
          ), //FlapButton

        ], // <Widget>[]
      );  // AlertDialog
  },
    );
}//ShowDialog


  void _maisGrana()
  {

    setState(() {
      //metodo responsável pela atualizacao (valores) da nossa

      Random sorteio = new Random();

      int min = 1;
      int max = 4;
      int r = min + sorteio.nextInt(max - min);
      if(r == 1)
        {
          //Se o sorteio for = 1 o usuario perde 10
          _contador = _contador - 20;
          print(r);
        }
      else if(r == 2)
        {
          //Se o sorteio for = 2 o usuario pode duplicar seu dinheiro
          _contador = _contador + 10;
          print(r);
        }
      else if(r == 3)
        {
          //Se o sorteio for = 3 o  usuario pode duplicar seu dinheiro
          _contador = _contador * 2;
          print(r);
        }
      if(r == 4)
        {
          //Se o sorteio for = 4 o  usuario perde 10
          _contador = _contador / 2;
          print(r);
        }

         if(_contador <= 0)
           {
             void_showDialog();
             _contador = 10;
           }

    });

  }


  @override
  Widget build(BuildContext context) {
    //Cria a tela(ui)
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("App Rico")),
        backgroundColor: Colors.green,
      ), // AppBar

     body: Padding(
       padding: const EdgeInsets.all(10.0),
       child: Container(
        child: Column(
          children: <Widget>[
            //Titulo do App
            Expanded(
              child: Center(
                child: Text("Venha Ficar Rico!!!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: _contador  >= 100 ? Colors.red : Colors.green,
                ), //TextStyle
              ), // Text
          ),
            ), // Center


            //Valor em dinheiro
           Expanded(
             child: Center(
               child: Text("R\$ $_contador",
                 style: TextStyle(
                   fontSize: 60,
                   fontWeight: FontWeight.w900,
                     color: Colors.green,
                 ), // TextStyle
               ), // Text
             ), // Center
           ), // Expanded

            //Botão de Ação
            Expanded(
              child: Center(
                child: FlatButton(
                  onPressed: _maisGrana,
                  color: Colors.blueAccent,
                  textColor: Colors.white,

                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Mais Grana!!!",
                      style: TextStyle(
                        fontSize: 30,
                      ),// TextStyle
                    ), // Text
                  ), // Padding
                ), // FlatButton
              ), // Center
            ), // Expanded

        ], // <Widget>[]
    ), // Column
       ), // Container
     ), // Padding
    ); // Scaffold
  }
}
