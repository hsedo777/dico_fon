class ListJason{
  final List<Jason> jason;

  ListJason({
    required this.jason,
  });

  factory ListJason.fromJson(List<dynamic> parsedJson) {

    List<Jason> jason = <Jason>[];
    jason = parsedJson.map((i)=>Jason.fromJson(i)).toList();

    return new ListJason(
        jason: jason
    );
  }
}

class Jason{
  final String b;
  final String c;

  Jason({
    required this.b,
    required this.c,
  }) ;

  factory Jason.fromJson(Map<String, dynamic> json){
    return new Jason(
      b: json['Mot'],
      c: json['Def'],
    );
  }

}