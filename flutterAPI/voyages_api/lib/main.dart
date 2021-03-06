import 'dart:ui';
import 'package:http/http.dart' as http;
import 'Forfait.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Voyages Flutter',
      theme: ThemeData(fontFamily: 'RobotoMono', primarySwatch: Colors.teal),
      home: AppVoyagesFlutter(title: 'Voyages API Rafael'),
    );
  }
}

class AppVoyagesFlutter extends StatefulWidget {
  AppVoyagesFlutter({Key key, this.title}) : super(key: key);

  final String title;

  @override
  AppVoyagesFlutterState createState() => AppVoyagesFlutterState();
}

class AppVoyagesFlutterState extends State<AppVoyagesFlutter> {
  Future<List<Forfait>> _forfaits;

//Importation des forfaits
  Future<List<Forfait>> _getForfaits() async {
    final response = await http.get(Uri.https(
        'forfaits-voyages.herokuapp.com', '/api/forfaits/da/1996340', {}));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((forfait) => new Forfait.fromJson(forfait))
          .toList();
    } else {
      throw Exception('Erreur de chargement des forfaits');
    }
  }

// Inicialization de state
  initState() {
    _forfaits = _getForfaits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Forfait>>(
      future: _forfaits,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
                centerTitle: true,
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              return Container(
                                color: Colors.blueGrey,
                                width: double.infinity,
                                height: 310,
                                margin: EdgeInsets.all(5.5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Wrap(
                                        children: [
                                          Image.network(
                                            'https://images.pexels.com/photos/1450353/pexels-photo-1450353.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
                                            fit: BoxFit.fill,
                                            height: 300,
                                          ),
                                        ],
                                      ),
                                    ), //Section destination
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              10.0, 0, 0, 0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                children: [
                                                  Text('Destination : '),
                                                  Text(
                                                      snapshot.data[index]
                                                              .destination ??
                                                          '',
                                                      style: DefaultTextStyle
                                                              .of(context)
                                                          .style
                                                          .apply(
                                                              fontSizeFactor:
                                                                  2.0)),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('Hôtel : '),
                                                  Text(
                                                      snapshot.data[index].hotel
                                                              .nom ??
                                                          '',
                                                      style: DefaultTextStyle
                                                              .of(context)
                                                          .style
                                                          .apply(
                                                              fontSizeFactor:
                                                                  1.5)),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('Prix : '),
                                                  Text(
                                                      snapshot.data[index].prix
                                                              .toString() ??
                                                          '',
                                                      style: DefaultTextStyle
                                                              .of(context)
                                                          .style
                                                          .apply(
                                                              fontSizeFactor:
                                                                  1.5)),
                                                  Text(' \$')
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('Ville de départ : '),
                                                  Text(snapshot.data[index]
                                                          .villeDepart ??
                                                      ''),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('Durée : '),
                                                  Text(
                                                    '7 Jours',
                                                    style: DefaultTextStyle.of(
                                                            context)
                                                        .style
                                                        .apply(
                                                            fontSizeFactor:
                                                                1.5),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                    //
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(snapshot.data[index]
                                                          .hotel.nombreEtoiles
                                                          .toString() ??
                                                      ''),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.amberAccent,
                                                    size: 16.0,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('Coordonnée : '),
                                                  Text(snapshot.data[index]
                                                          .hotel.coordonnees ??
                                                      ''),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('Date de départ : '),
                                                  Text(snapshot.data[index]
                                                          .dateDepart
                                                          .toString() ??
                                                      ''),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('Date de retour : '),
                                                  Text(snapshot.data[index]
                                                          .dateRetour
                                                          .toString() ??
                                                      ''),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('Nombre de chambres : '),
                                                  Text(snapshot.data[index]
                                                          .hotel.nombreChambres
                                                          .toString() ??
                                                      ''),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('Caractéristiques : '),
                                                  Text(snapshot
                                                          .data[index]
                                                          .hotel
                                                          .caracteristiques
                                                          .toString() ??
                                                      ''),
                                                ],
                                              )
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              );
                            }))
                  ],
                ),
              ));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}
