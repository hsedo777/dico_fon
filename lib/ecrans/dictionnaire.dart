//import 'dart:convert';
//import 'package:dico_fon/ecrans/accueil.dart';
import 'package:dico_fon/ecrans/definition.dart';
import 'package:flutter/material.dart';
import 'package:diacritic/diacritic.dart';
import 'package:dico_fon/constants/dico_mots.dart';
//import 'package:flutter/services.dart';
//import 'package:dico_fon/constants/lirejson.dart';

class Dictionnaire extends StatefulWidget {
  const Dictionnaire({Key? key}) : super(key: key);

  @override
  _DictionnaireState createState() => _DictionnaireState();
}

List listFiltree = [];
int indexDef = 0; bool inListFiltree = true;
int typeRecherche = 0;
Color colBout1 = Colors.white; Color colBout2 = Colors.black; Color colBout3 = Colors.black;

class _DictionnaireState extends State<Dictionnaire> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double largeur = MediaQuery.of(context).size.width;

    List<String> cle = [];
    for(var key in listMots){cle.add(key["mot"].toString());}


    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Card(color: Color(0x8800ff00),
          child: TextField(
            style: TextStyle(color: Color(0xFFffffff),
              fontSize: 21, fontWeight: FontWeight.bold
            ),
            controller: _textController,
            autofocus: true, cursorColor: Colors.yellowAccent,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.yellow,),
            ),
            onChanged: (texte){
              texte = removeDiacritics(texte.toLowerCase());
              if(typeRecherche == 1){
                setState(() {
                  listFiltree = cle.where((element) {
                    return removeDiacritics(element).toLowerCase().endsWith(texte);
                  }).toList();
                });
              }
              else if(typeRecherche == 2){
                setState(() {
                  listFiltree = cle.where((element) {
                    return removeDiacritics(element).toLowerCase().contains(texte);
                  }).toList();
                });
              }
              else{
                setState(() {
                  listFiltree = cle.where((element) {
                    return removeDiacritics(element).toLowerCase().startsWith(texte);
                  }).toList();
                });
              }
            },
          ),
        )
      ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: largeur,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0)
                    )
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0)
                  ),
                  child: ListView.builder(
                      itemCount: listFiltree.length == 0 && _textController.text.isEmpty ? cle.length :
                      listFiltree.length != 0 && _textController.text.isEmpty ? cle.length :
                      listFiltree.length,// == 0 && _textController.text.isEmpty ? listFiltree.length : 0,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              indexDef = index;
                              inListFiltree = listFiltree.length == 0 && _textController.text.isEmpty ? false :
                              listFiltree.length != 0 && _textController.text.isEmpty ? false : true;
                            });
                            Navigator.push(
                              context, MaterialPageRoute(builder: (_) => Definition()));
                          },
                          child: Container(height: 40,
                            margin: const EdgeInsets.only(bottom: 4.0, right: 5.0),
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                            decoration: BoxDecoration(
                                color:  Color(0x50aaaaaa),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0)
                                )
                            ),
                            child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 30,
                                    child: CircleAvatar(
                                      radius: 35,
                                      child: Text(listFiltree.length == 0 && _textController.text.isEmpty ?
                                      removeDiacritics(cle[index][0].toString().toUpperCase()):
                                      listFiltree.length != 0 && _textController.text.isEmpty ? removeDiacritics(cle[index][0].toString().toUpperCase()) :
                                      removeDiacritics(listFiltree[index][0].toString().toUpperCase()),
                                        style: TextStyle(
                                          fontSize: 35, fontWeight: FontWeight.bold, color: Color(0xa0000000)
                                      )),
                                      backgroundImage: AssetImage("assets/images/drapeau.png"),
                                    ),
                                  ),
                                  const SizedBox(width: 15.0),
                                  Container(
                                    child: Text(listFiltree.length == 0 && _textController.text.isEmpty ? cle[index] :
                                    listFiltree.length != 0 && _textController.text.isEmpty ? cle[index] :
                                    listFiltree[index],
                                      style: const TextStyle(
                                        color: Color(0xFF404040),
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ),
            ),
          ],
        ),
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(onPressed: (){setState(() {
            colBout1 = Colors.white; colBout2 = Colors.black; colBout3 = Colors.black;
            typeRecherche = 0;});}, child: Text("Début", style: TextStyle(color: colBout1, fontSize: 18))),

          ElevatedButton(onPressed: (){setState(() {
            colBout1 = Colors.black; colBout2 = Colors.white; colBout3 = Colors.black;
            typeRecherche = 2;});}, child: Text("Milieu", style: TextStyle(color: colBout2, fontSize: 18))),

          ElevatedButton(onPressed: (){setState(() {
            colBout1 = Colors.black; colBout2 = Colors.black; colBout3 = Colors.white;
            typeRecherche = 1;});}, child: Text("Fin", style: TextStyle(color: colBout3, fontSize: 18))),
        ],
      )
    );
  }
}

/*body: */