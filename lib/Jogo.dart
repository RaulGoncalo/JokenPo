import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  
  var _imagemApp = AssetImage("assets/images/padrao.png");
  var _resultado = "";

  void _opcaoSelecionada (String escolhaUsuario){
    this._imagemApp = AssetImage("assets/images/padrao.png");

    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha app: $escolhaApp");
    print("Escolha user: $escolhaUsuario");

    //Exibição da imagem da escolha do App
    switch(escolhaApp){
      case "pedra" :
        setState(() {
          this._imagemApp = AssetImage("assets/images/pedra.png");
        });
        break;
      case "papel" :
        setState(() {
          this._imagemApp = AssetImage("assets/images/papel.png");
        });
        break;
      case "tesoura" :
        setState(() {
          this._imagemApp = AssetImage("assets/images/tesoura.png");
        });
        break;
    }

    //Validação ganhador
    if(
      (escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
          (escolhaUsuario == 'papel' && escolhaApp == 'pedra') ||
            (escolhaUsuario == 'tesoura' && escolhaApp == 'papel')
    ){
      setState(() {
        _resultado = "Você ganho :)";
      });
    }else if(
      (escolhaUsuario == escolhaApp) ||
        (escolhaUsuario == escolhaApp ) ||
        (escolhaUsuario == escolhaApp)
    ){
      setState(() {
        _resultado = "Empate :|";
      });
    }else{
      setState(() {
        _resultado = "Você perdeu :(";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joken Po'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
                'Escolha do App',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Image(image: this._imagemApp),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha uma opção abaixo:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: Image.asset('assets/images/pedra.png'),
                ),
                GestureDetector(
                  onTap:  () => _opcaoSelecionada("papel"),
                  child: Image.asset('assets/images/papel.png'),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset('assets/images/tesoura.png'),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Text(
              'Resultado: $_resultado',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
