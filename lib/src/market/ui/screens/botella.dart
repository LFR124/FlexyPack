import 'package:flexypack/src/widgets/drawer.dart';
import 'package:flexypack/src/widgets/listshop.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flexypack/src/market/model/listproduct.dart';
import 'package:flexypack/src/widgets/images.dart';
import 'package:flexypack/src/market/model/addcart.dart';
import 'package:provider/provider.dart';

class botella extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _botella();
}

class _botella extends State<botella>{
  Drawere _drawere = new Drawere();
  final ListWidgetsShop  _ListWidgetsShop = ListWidgetsShop();
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    // TODO: implement build
    return Consumer(builder: (context, cart,child){
      return Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 6), //blanco HEX #FAFAFA
        drawer: _drawere.drawer(context),
        appBar: AppBar(
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.shopping_cart), 
                    onPressed: () => Navigator.pushNamed(context, 'cartshopping')
                    ),
                  Text(cart.addcount.toString(),style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                ],
              ),
            )
          ],
          backgroundColor: Colors.green,
          title: Text('Botella'),
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
              borderRadius: BorderRadius.circular(15.0),),
              child: Card(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.vertical(top: Radius.circular(12),bottom: Radius.circular(12)),
                   ),
                child: Column(
                  children: <Widget>[
                    Stack(
                  children: <Widget>[
                    Container(
                      width: _media.width,
                      height: _media.height*0.17,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(12),

                        top: Radius.circular(12))),
                      child: _ListWidgetsShop.imageHeader(
                        image: imagesRoutes().imageGarrafon+ListProducts().Botella[index]['Image'].toString(),
                        infoaction:(){
                          _ListWidgetsShop.dialogInfoadd(
                            context: context,
                            image:imagesRoutes().imageGarrafon+ListProducts().Botella[index]['Image'].toString(),
                            title: ListProducts().Botella[index]['Title'].toString(),
                            description2: ListProducts().Botella[index]['Description2'].toString(),
                            button: _ListWidgetsShop.addCart(action: (){
                              cart.add(image: 'garrafon/'+ListProducts().Botella[index]['Image'].toString(), 
                              title: ListProducts().Botella[index]['Title'].toString(), 
                              description: ListProducts().Botella[index]['Description1'].toString(),
                              description2: ListProducts().Botella[index]['Description2'].toString()
                              );
                              }),
                            );
                        }
                      ),
                ),
                ],
                ),
                Expanded(
                  child:_ListWidgetsShop.productInfo(
                    title: ListProducts().Botella[index]['Title'].toString(),
                    description: ListProducts().Botella[index]['Description1'].toString(),
                  ),
                  ),
                  Expanded(
                    child:_ListWidgetsShop.addCart(
                      action: (){
                        cart.add(image: 'garrafon/'+ListProducts().Botella[index]['Image'].toString(), 
                        title: ListProducts().Botella[index]['Title'].toString(), 
                        description: ListProducts().Botella[index]['Description1'].toString(),
                        description2: ListProducts().Botella[index]['Description2'].toString()
                        );
                      },
                    ), 
                    ),
                  ],
                ),
              ),
          );
          
        },
        ),
      );
    });
  }

}