import 'package:dico_fon/ecrans/dictionnaire.dart';
//import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class Accueil extends StatefulWidget {
  @override
  _AccueilState createState() => _AccueilState();
}
double sizeTextButton = 20;

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Français - FƆNGBE"),
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: CircleAvatar(child: Image.asset("assets/images/logo.png"),
              backgroundColor: Color(0x80000000),),
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.menu, color: Color(0x80000000), size: 40,),
                iconSize: 30,
                color: Colors.blueGrey,
                onPressed: (){}
            ),
            const Text("   ")
          ],
        ),
        body: Container(decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/back_g.png"),
              fit: BoxFit.cover, opacity: 1),

        ),
          child: Container(color: Color(0x80000000),
            child: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Image.asset("assets/images/logo_p2.png", fit: BoxFit.scaleDown,),
                  SizedBox(height: 100,),
                  Container(width: largeur/1.1, height: 200, //color: Colors.grey,
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Card(color: Color(0xaa005080),
                          child: MaterialButton(
                            child: Row(//mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset("assets/images/dictionnaire.png", width: 50,),
                                Text("  Ouvrir le Dictionnaire  ", style: TextStyle(fontSize: largeur/20, color: Colors.white),),
                              ],
                            ),
                              onPressed: () {
                              //controllerVide = true;
                                Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Dictionnaire()),);
                              }
                          ),
                        ),
                        Card(color: Color(0xaa005080),
                          child: MaterialButton(
                              child: Row(//mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset("assets/images/apprendre.png", width: 45,),
                                  Text("  Apprendre à parler FƆN", style: TextStyle(fontSize: largeur/20, color: Colors.white),),
                                ],
                              ),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => Dictionnaire()),)
                          ),
                        ),
                        Card(color: Color(0xaa005080),
                          child: MaterialButton(
                              child: Row(//mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset("assets/images/drapeau.png", width: 45,),
                                  Text("  Hymne National FƆN", style: TextStyle(fontSize: largeur/20, color: Colors.white),),
                                ],
                              ),
                              onPressed: () => Navigator.push(
                                context, MaterialPageRoute(builder: (_) => Dictionnaire()),)
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(height: 100,),
                ],
              ),
            ),
          )
        )
    );
  }
}
/*
Future<void> lireExcel(String? nomFichier) async {
  ByteData data = await rootBundle.load('assets/$nomFichier');
  var octets = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(octets);
  int j = 0;
  for (var table in excel.tables.keys){
    Map<int, List<String>> mp = Map<int, List<String()>>[];
  }
}*/