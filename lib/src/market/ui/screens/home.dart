import 'package:flutter/material.dart';
import 'package:flexypack/src/widgets/drawer.dart';
class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreenState();
  }

}

class _HomeScreenState extends State<HomeScreen>{
  Drawere _drawere = new Drawere();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: _drawere.drawer(context),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Image.asset('assets/images/logo.png',width: 200.0,height: 50.0,),
        centerTitle: true,
      ),
      body: Center(
        child: Image.asset('assets/images/logo.png',width: 300.0,height: 200.0,),
      )
    );
  }

}