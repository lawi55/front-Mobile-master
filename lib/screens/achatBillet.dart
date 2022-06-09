import 'dart:math';

import 'package:currency_flutter/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class AchatBillet extends StatefulWidget {
  const AchatBillet({Key? key}) : super(key: key);

  @override
  State<AchatBillet> createState() => _AchatBilletState();
}

class _AchatBilletState extends State<AchatBillet> {
  String classe = 'Economique';
  String adult = '0';
  String enfant = '0';
  String bebe = '0';
  String jeune = '0';

  int _value = 0;
  List<String> villes = [
    'Abidjan',
    'Alger',
    'Amman',
    'Amesterdam',
    'Bâle',
    'Bamako',
    'Barcelone',
    'Benghazi',
    'Berlin',
    'Bologne',
    'Bordeaux',
    'Bruxelles',
    'Casablanca',
    'Conakry',
    'Constantine',
    'Cotonou',
    'Dakar',
    'Djerba',
    'Dubai',
    'Duesseldorf',
    'Enfidha',
    'Frankfurt',
    'Gabes',
    'Gafsa',
    'Genève',
    'Hamburg',
    'Istanbul',
    'Jeddah',
    'Le Caire',
    'Lille',
    'Lisbonne',
    'Londres',
    'Lyon',
    'Madrid',
    'Malte',
    'Marseille',
    'Médine',
    'Milan',
    'Monastir',
    'Montréal',
    'Munich',
    'Nantes',
    'Naples',
    'Niamey',
    'Nice',
    'Nouakchott',
    'Oran',
    'Ouagadougou',
    'Palerme',
    'Paris',
    'Prague',
    'Rome',
    'Sfax',
    'Strasbourg',
    'Tabarka',
    'Toulouse',
    'Tozeur',
    'Tripoli',
    'Tunis',
    'Venise',
    'Vérone',
    'Vienne',
    'Zurich'
  ];
  List<String> voyageurs = [
    'un voyageurs ',
    'deux voyageurs',
    'trois voyageurs',
    '3 voyageurs',
    '4 voyageurs',
    '5 voyageurs',
    '6 voyageurs'
  ];
  String voyageur = '0 voyageurs';
  String ville1 = 'Tunis';
  String ville2 = 'Paris';
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Color(0xFFD80404),
        title: Container(
          padding: EdgeInsets.all(25),
          child: Image.asset(
            "assets/images/tunisair.png",
            height: 60,
          ),
        ),
        elevation: 0.0,
      ),
        body: SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text("Achat d'une billet Prime",
                    style: TextStyle(fontSize: 25, fontFamily: 'ElMessiri')),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Type de voyage :",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = 1;
                            });
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Aller simple",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      SizedBox(
                        width: 40,
                      ),
                      Radio(
                          value: 2,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = 2;
                            });
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Aller retour",
                          style: TextStyle(
                            fontSize: 18,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Départ :",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: DropdownButton<String>(
                        value: ville1,
                        icon: const Icon(Icons.arrow_drop_down_rounded),
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        underline: Container(
                          height: 2,
                          color: Colors.grey.shade400,
                        ),
                        items: villes
                            .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child:
                                    Text(item, style: TextStyle(fontSize: 19))))
                            .toList(),
                        onChanged: (item) {
                          setState(() {
                            ville1 = item!;
                          });
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Destination :",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: DropdownButton<String>(
                        value: ville2,
                        icon: const Icon(Icons.arrow_drop_down_rounded),
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        underline: Container(
                          height: 2,
                          color: Colors.grey.shade400,
                        ),
                        items: villes
                            .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child:
                                    Text(item, style: TextStyle(fontSize: 19))))
                            .toList(),
                        onChanged: (item) {
                          setState(() {
                            ville2 = item!;
                          });
                        }),
                  ),
                  Row(
                    children: [
                      Text("Vol départ :",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 250,
                        child: TextFormField(
                            readOnly: true,
                            controller: _date,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.calendar_today_rounded),
                            ),
                            onTap: () async {
                              DateTime? pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2101));
                              if (pickeddate != null) {
                                setState(() {
                                  _date.text = DateFormat('dd/MM/yyyy')
                                      .format(pickeddate);
                                });
                              }
                            }),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Vol retour : ",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 250,
                        child: TextFormField(
                            readOnly: true,
                            controller: _date,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.calendar_today_rounded),
                            ),
                            onTap: () async {
                              DateTime? pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2101));
                              if (pickeddate != null) {
                                setState(() {
                                  _date.text = DateFormat('dd/MM/yyyy')
                                      .format(pickeddate);
                                });
                              }
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Voyageurs :",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Adultes :",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 50,
                        child: DropdownButton<String>(
                            value: adult,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            iconSize: 24,
                            elevation: 16,
                            isExpanded: true,
                            underline: Container(
                              height: 2,
                              color: Colors.grey.shade400,
                            ),
                            items: const [
                              DropdownMenuItem<String>(
                                  child: Text("0"), value: '0'),
                              DropdownMenuItem<String>(
                                  child: Text("1"), value: '1'),
                              DropdownMenuItem<String>(
                                  child: Text("2"), value: '2'),
                              DropdownMenuItem<String>(
                                  child: Text("3"), value: '3'),
                              DropdownMenuItem<String>(
                                  child: Text("4"), value: '4'),
                              DropdownMenuItem<String>(
                                  child: Text("5"), value: '5'),
                              DropdownMenuItem<String>(
                                  child: Text("6"), value: '6'),
                            ],
                            onChanged: (item) {
                              setState(() {
                                adult = item!;
                              });
                            }),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text("Jeunes :",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 50,
                        child: DropdownButton<String>(
                            value: jeune,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            iconSize: 24,
                            elevation: 16,
                            isExpanded: true,
                            underline: Container(
                              height: 2,
                              color: Colors.grey.shade400,
                            ),
                            items: const [
                              DropdownMenuItem<String>(
                                  child: Text("0"), value: '0'),
                              DropdownMenuItem<String>(
                                  child: Text("1"), value: '1'),
                              DropdownMenuItem<String>(
                                  child: Text("2"), value: '2'),
                              DropdownMenuItem<String>(
                                  child: Text("3"), value: '3'),
                              DropdownMenuItem<String>(
                                  child: Text("4"), value: '4'),
                              DropdownMenuItem<String>(
                                  child: Text("5"), value: '5'),
                              DropdownMenuItem<String>(
                                  child: Text("6"), value: '6'),
                            ],
                            onChanged: (item) {
                              setState(() {
                                jeune = item!;
                              });
                            }),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Enfants :",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 50,
                        child: DropdownButton<String>(
                            value: enfant,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            iconSize: 24,
                            elevation: 16,
                            isExpanded: true,
                            underline: Container(
                              height: 2,
                              color: Colors.grey.shade400,
                            ),
                            items: const [
                              DropdownMenuItem<String>(
                                  child: Text("0"), value: '0'),
                              DropdownMenuItem<String>(
                                  child: Text("1"), value: '1'),
                              DropdownMenuItem<String>(
                                  child: Text("2"), value: '2'),
                              DropdownMenuItem<String>(
                                  child: Text("3"), value: '3'),
                              DropdownMenuItem<String>(
                                  child: Text("4"), value: '4'),
                              DropdownMenuItem<String>(
                                  child: Text("5"), value: '5'),
                              DropdownMenuItem<String>(
                                  child: Text("6"), value: '6'),
                            ],
                            onChanged: (item) {
                              setState(() {
                                enfant = item!;
                              });
                            }),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Text("Bébés :",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 50,
                        child: DropdownButton<String>(
                            value: bebe,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            iconSize: 24,
                            elevation: 16,
                            isExpanded: true,
                            underline: Container(
                              height: 2,
                              color: Colors.grey.shade400,
                            ),
                            items: const [
                              DropdownMenuItem<String>(
                                  child: Text("0"), value: '0'),
                              DropdownMenuItem<String>(
                                  child: Text("1"), value: '1'),
                              DropdownMenuItem<String>(
                                  child: Text("2"), value: '2'),
                              DropdownMenuItem<String>(
                                  child: Text("3"), value: '3'),
                              DropdownMenuItem<String>(
                                  child: Text("4"), value: '4'),
                              DropdownMenuItem<String>(
                                  child: Text("5"), value: '5'),
                              DropdownMenuItem<String>(
                                  child: Text("6"), value: '6'),
                            ],
                            onChanged: (item) {
                              setState(() {
                                bebe = item!;
                              });
                            }),
                      )
                    ],
                  ),
                  Text("Classe :",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  DropdownButton<String>(
                      value: classe,
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      underline: Container(
                        height: 2,
                        color: Colors.grey.shade400,
                      ),
                      items: const [
                        DropdownMenuItem<String>(
                            child: Text("Economique"), value: 'Economique'),
                        DropdownMenuItem<String>(
                            child: Text("Business"), value: 'Business'),
                      ],
                      onChanged: (item) {
                        setState(() {
                          classe = item!;
                        });
                      }),
                ],
              )
              
            ],
          )),
          
    ));
  }
}
