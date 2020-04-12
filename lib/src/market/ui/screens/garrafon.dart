import 'dart:convert';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flexypack/src/widgets/drawer.dart';
import 'package:flexypack/src/market/model/listproduct.dart';
import 'package:flexypack/src/widgets/listshop.dart';

class GarrafonScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _GarrafonScreenState();
    // TODO: implement createState
}

//se implementa la interfaz empezando con un scaffold que es la inicialización de la misma continuando con los valores del widget
// dando un appbar que es la barra superior de la interfaz con sus respectivos valores y icoos
//dandole un drawer conocido como menu de hamburguesa derecho que fue diseñado en la carpeta widgets de market para ser utilizado en mas ventanas

class _GarrafonScreenState extends State<GarrafonScreen>{
  Drawere _drawere = new Drawere();
  final ListWidgetsShop  _ListWidgetsShop = ListWidgetsShop();

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: _drawere.drawer(context),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart), 
            onPressed: () => Navigator.pushNamed(context, 'cartshopping')
            ),
        ],
        backgroundColor: Colors.green,
        title: Text('Garrafon'),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: ListProducts().Garrafon.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 0.70,
          ), 
        itemBuilder: (context,index){
          return Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(15.0),),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Stack(
                  children: <Widget>[
                    Container(
                      width: _media.width,
                      height: _media.height*0.17,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12))),
                      child: _ListWidgetsShop.imageHeader(
                        image: ListProducts().Garrafon[index]['Image'].toString(),
                      ),
                ),
                ],
                ),
                Expanded(
                  child: _ListWidgetsShop.productInfo(
                    title: ListProducts().Garrafon[index]['Title'].toString(),
                    description: ListProducts().Garrafon[index]['Description'].toString()
                  ),
                  ),
                  ],
                ),
              ),
          );
          
        },
        ),
    );
  }

}