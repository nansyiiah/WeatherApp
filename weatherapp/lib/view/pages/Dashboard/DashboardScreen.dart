import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weatherapp/models/data.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final String url = "https://ibnux.github.io/BMKG-importer/cuaca/501191.json";
  @override
  getJsonData() async {
    var response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    var jsonData = jsonDecode(response.body);
    List<Datas> data = [];
    for (var u in jsonData) {
      Datas user = Datas(u['cuaca'], u['tempC'], u['jamCuaca']);
      data.add(user);
    }
    // print(users[0].cuaca);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(135, 206, 235, 1),
      body: Container(
        child: FutureBuilder(
          future: getJsonData(),
          builder: (context, snapshot) {
            if (snapshot.hasData == false) {
              return Container(
                child: Center(
                  child: Text("Loading . . ."),
                ),
              );
            } else {
              var data = (snapshot.data as List<Datas>).toList();
              var jam = [];
              var temp = [];
              for (var i = 0; i < data.length; i++) {
                final dateTime = DateTime.parse(data[i].jamCuaca);
                final time = DateFormat('HH:mm a').format(dateTime);
                jam.add(time);
              }
              temp = [];

              return Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 16),
                    margin: EdgeInsets.only(top: 10),
                    color: Color.fromRGBO(135, 206, 235, 1),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.black.withBlue(100),
                                size: 28,
                              ),
                            ),
                            Text(
                              "Jakarta",
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 28,
                                color: Colors.black.withBlue(100),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          // height: 300,
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/img/berawan.png",
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Berawan",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black.withBlue(100),
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text(
                                  "33°C",
                                  style: TextStyle(
                                      color: Colors.black.withBlue(100),
                                      fontSize: 33,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.air,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                  ),
                                  Text(
                                    "10 km/h",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                  ),
                                  Icon(
                                    Icons.water_drop_rounded,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                  ),
                                  Text(
                                    "68%",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 100,
                              ),
                              Container(
                                height: 200,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Container(
                                      child: Container(
                                        width: 120,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.white30,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.topCenter,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              jam[4],
                                            ),
                                            (data[4].cuaca == "Cerah")
                                                ? Image(
                                                    image: AssetImage(
                                                      "assets/img/cerah.png",
                                                    ),
                                                  )
                                                : (data[4].cuaca ==
                                                        "Cerah Berawan")
                                                    ? Image(
                                                        image: AssetImage(
                                                          "assets/img/cerah_berawan.png",
                                                        ),
                                                      )
                                                    : (data[4].cuaca == "hujan")
                                                        ? Image(
                                                            image: AssetImage(
                                                              "assets/img/hujan.png",
                                                            ),
                                                          )
                                                        : (data[4].cuaca ==
                                                                "Berawan")
                                                            ? Image(
                                                                image:
                                                                    AssetImage(
                                                                  "assets/img/berawan.png",
                                                                ),
                                                              )
                                                            : (data[4].cuaca ==
                                                                    "Berkabut")
                                                                ? Image(
                                                                    image:
                                                                        AssetImage(
                                                                      "assets/img/berawan.png",
                                                                    ),
                                                                  )
                                                                : (data[4].cuaca ==
                                                                        "Hujan Petir")
                                                                    ? Image(
                                                                        image:
                                                                            AssetImage(
                                                                          "assets/img/hujan_petir.png",
                                                                        ),
                                                                      )
                                                                    : (data[4].cuaca ==
                                                                            "Hujan Ringan")
                                                                        ? Image(
                                                                            image:
                                                                                AssetImage(
                                                                              "assets/img/hujan.png",
                                                                            ),
                                                                          )
                                                                        : (data[4].cuaca ==
                                                                                "Hujan Sedang")
                                                                            ? Image(
                                                                                image: AssetImage(
                                                                                  "assets/img/hujan.png",
                                                                                ),
                                                                              )
                                                                            : Text(
                                                                                "Image not Found",
                                                                              ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 20,
                                              ),
                                            ),
                                            Text(
                                              data[4].cuaca,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                    ),
                                    Container(
                                      child: Container(
                                        width: 120,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.white30,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.topCenter,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              jam[5],
                                            ),
                                            (data[5].cuaca == "Cerah")
                                                ? Image(
                                                    image: AssetImage(
                                                      "assets/img/cerah.png",
                                                    ),
                                                  )
                                                : (data[5].cuaca ==
                                                        "Cerah Berawan")
                                                    ? Image(
                                                        image: AssetImage(
                                                          "assets/img/cerah_berawan.png",
                                                        ),
                                                      )
                                                    : (data[5].cuaca == "hujan")
                                                        ? Image(
                                                            image: AssetImage(
                                                              "assets/img/hujan.png",
                                                            ),
                                                          )
                                                        : (data[5].cuaca ==
                                                                "Berawan")
                                                            ? Image(
                                                                image:
                                                                    AssetImage(
                                                                  "assets/img/berawan.png",
                                                                ),
                                                              )
                                                            : (data[5].cuaca ==
                                                                    "Berkabut")
                                                                ? Image(
                                                                    image:
                                                                        AssetImage(
                                                                      "assets/img/berawan.png",
                                                                    ),
                                                                  )
                                                                : (data[5].cuaca ==
                                                                        "Hujan Petir")
                                                                    ? Image(
                                                                        image:
                                                                            AssetImage(
                                                                          "assets/img/hujan_petir.png",
                                                                        ),
                                                                      )
                                                                    : (data[5].cuaca ==
                                                                            "Hujan Ringan")
                                                                        ? Image(
                                                                            image:
                                                                                AssetImage(
                                                                              "assets/img/hujan.png",
                                                                            ),
                                                                          )
                                                                        : (data[5].cuaca ==
                                                                                "Hujan Sedang")
                                                                            ? Image(
                                                                                image: AssetImage(
                                                                                  "assets/img/hujan.png",
                                                                                ),
                                                                              )
                                                                            : Text(
                                                                                "Image not Found",
                                                                              ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 20,
                                              ),
                                            ),
                                            Text(
                                              data[5].cuaca,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                    ),
                                    Container(
                                      child: Container(
                                        width: 120,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.white30,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.topCenter,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              jam[6],
                                            ),
                                            (data[6].cuaca == "Cerah")
                                                ? Image(
                                                    image: AssetImage(
                                                      "assets/img/cerah.png",
                                                    ),
                                                  )
                                                : (data[6].cuaca ==
                                                        "Cerah Berawan")
                                                    ? Image(
                                                        image: AssetImage(
                                                          "assets/img/cerah_berawan.png",
                                                        ),
                                                      )
                                                    : (data[6].cuaca == "hujan")
                                                        ? Image(
                                                            image: AssetImage(
                                                              "assets/img/hujan.png",
                                                            ),
                                                          )
                                                        : (data[6].cuaca ==
                                                                "Berawan")
                                                            ? Image(
                                                                image:
                                                                    AssetImage(
                                                                  "assets/img/berawan.png",
                                                                ),
                                                              )
                                                            : (data[6].cuaca ==
                                                                    "Berkabut")
                                                                ? Image(
                                                                    image:
                                                                        AssetImage(
                                                                      "assets/img/berawan.png",
                                                                    ),
                                                                  )
                                                                : (data[6].cuaca ==
                                                                        "Hujan Petir")
                                                                    ? Image(
                                                                        image:
                                                                            AssetImage(
                                                                          "assets/img/hujan_petir.png",
                                                                        ),
                                                                      )
                                                                    : (data[6].cuaca ==
                                                                            "Hujan Ringan")
                                                                        ? Image(
                                                                            image:
                                                                                AssetImage(
                                                                              "assets/img/hujan.png",
                                                                            ),
                                                                          )
                                                                        : (data[6].cuaca ==
                                                                                "Hujan Sedang")
                                                                            ? Image(
                                                                                image: AssetImage(
                                                                                  "assets/img/hujan.png",
                                                                                ),
                                                                              )
                                                                            : Text(
                                                                                "Image not Found",
                                                                              ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 20,
                                              ),
                                            ),
                                            Text(
                                              data[6].cuaca,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
