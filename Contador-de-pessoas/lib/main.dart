import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(

    title: "Contador de pessoas",
    home: Home()


  ));

}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {  

  int _pessoa = 0;

  String _texto = "Pode Entrar";
  void _alteraValor(int delta){


    setState(() {
    _pessoa+=delta;

    if(_pessoa < 0){
      _texto = "Mundo invertido";
    }else if(_pessoa <= 10){
      _texto = "Pode entrar";
    }else if(_pessoa>10){
      _texto = "Lotado";
    }

    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[

        Image.asset("Imagens/imagem.jpg", 
        fit: BoxFit.cover, 
        height: 1000.0,),

        Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
      
      Text("Pessoa:$_pessoa", 
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 40)
      ,),
      
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[

              Padding(padding: EdgeInsets.all(10.0),
              
              child: FlatButton( 
              child: Text("+1", style: TextStyle(fontSize: 48.0,color: Colors.yellow),),
              onPressed: () {
                _alteraValor(1)
                ;},

              ),),
             
              Padding(padding: EdgeInsets.all(10.0),
              
              child: FlatButton( 
              child: Text("-1", style: TextStyle(fontSize: 48.0,color: Colors.yellow),),
              onPressed:  () {
                _alteraValor(-1)
                ;},

              ),)
              

      ],),
      
      Text(_texto, 
      style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic,fontSize: 25)
      ,)

    ],)
      
    ],);

  }
}