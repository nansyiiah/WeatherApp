import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weatherapp/models/data_current.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final String url = "https://demoapi-hilmy.sanbercloud.com/api/news-all";
  final token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVtb2FwaS1oaWxteS5zYW5iZXJjbG91ZC5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2NjQ3ODk5MjAsImV4cCI6MTcyNDc4OTg2MCwibmJmIjoxNjY0Nzg5OTIwLCJqdGkiOiI0Nlc0M3NaSjFhNFRLYXZzIiwic3ViIjoxMTQsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.CvARZtFZlnyOo6Sg7wpzOzRbGe6xo1RMsP1sET7OUoQ";
  @override
  getJsonData() async {
    var response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });
    var jsonData = jsonDecode(response.body);
    // print(jsonData);
    List<Datass> data = [];
    for (var u in jsonData["data"]) {
      Datass user = Datass(u['author'], u['description'], u['title']);
      data.add(user);
    }
    // print(users[0].cuaca);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              var data = (snapshot.data as List<Datass>).toList();

              return Container(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      // height: 150,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Container(
                              width: 400,
                              height: 140,
                              decoration: BoxDecoration(
                                color: Colors.white30,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    // data[index].kota,
                                    data[index].title,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    // data[index].id,
                                    data[index].description,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
