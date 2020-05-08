import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(

    home: Home(),

  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController pesoControle = TextEditingController();
  TextEditingController alturaControle = TextEditingController();
  GlobalKey<FormState> validacao = GlobalKey<FormState>();

  String _resultado = "(Informe seus dados)";

  void _reset(){

    setState(() {
        pesoControle.text = "";
        alturaControle.text = "";
        _resultado = "";
    });
  }

  void _calcular(){
    setState(() {
      double peso = double.parse(pesoControle.text);
      double altura = double.parse(alturaControle.text) / 100;
      double imc = peso /(altura * altura);
      _resultado = "Seu imc é: {${imc.toStringAsPrecision(4)}}";  
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC",),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: () {_reset();},)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: validacao,
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: <Widget>[
          
          Icon(Icons.assignment_ind,size: 120, color: Colors.green,),
          
          TextFormField(keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Peso (kg)", labelStyle: TextStyle(color: Colors.green)
            ),
            style: TextStyle(color: Colors.green,fontSize: 20.0),
            controller: pesoControle,
            validator: (value){
              if(value.isEmpty){
                return "Digite o peso";
              }
            },
            ),

          Padding(padding: EdgeInsets.all(10.0)),

          TextFormField(keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Altura (cm)", labelStyle: TextStyle(color: Colors.green)
            ),
            style: TextStyle(color: Colors.green,fontSize: 20.0),
            controller: alturaControle,
            validator: (value){
              if(value.isEmpty){
                return "Digite a altura";
              }
            },
          ),
        
        Padding(padding: EdgeInsets.all(15.0)),

         Text("Resultado: $_resultado", 
         textAlign: TextAlign.center,
         style: TextStyle(color: Colors.green,fontSize: 25.0),
          
         
         )

        ],
        ),),),

       floatingActionButton: FloatingActionButton(
            
            child: Icon(Icons.add),
            onPressed: (){
              if(validacao.currentState.validate()){
                _calcular();
              }
            },
          
          ),

       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          
    );
  }
}