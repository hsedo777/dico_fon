import 'package:dico_fon/constants/dico_mots.dart';
import 'package:flutter/material.dart';
import 'package:dico_fon/ecrans/dictionnaire.dart';
import 'package:simple_rich_text/simple_rich_text.dart';

class Definition extends StatefulWidget {
  const Definition({Key? key}) : super(key: key);

  @override
  _DefinitionState createState() => _DefinitionState();
}
String definition = '';
class _DefinitionState extends State<Definition> {

  @override
  Widget build(BuildContext context) {
    if(inListFiltree == true){
      for(var key in listMots){
        if(key["mot"] == listFiltree[indexDef]){
          definition = key["def"];
        }}}
    else{
      for(var key in listMots){
        if(key["mot"] == listMots[indexDef]["mot"]){
          definition = key["def"];
        }}}

    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: CircleAvatar(child: Image.asset("assets/images/logo.png"),
              backgroundColor: Color(0x80000000)),
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.menu, color: Color(0x80000000), size: 40,),
                iconSize: 30, color: Colors.blueGrey,
                onPressed: (){}
            ),
            const Text("   ")
          ],
        ),
        body: ListView( children: [
          Center(child: Text(inListFiltree == true ? listFiltree[indexDef] : listMots[indexDef]["mot"], style: TextStyle(fontSize: 30),)),
          Container(margin: EdgeInsets.all(10),
            child: SimpleRichText(
              definition, style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          )
        ],
        ),//"*_Jésus* est Seignuer. /Amen/_ *{color:blue}important*"
    );
  }
}
