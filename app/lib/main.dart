import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};
  List usersData = List.empty();

  getUsers() async {
    http.Response response =
        await http.get(Uri.parse('http://localhost:9222/api/users'));
    data = json.decode(response.body);
    setState(() {
      usersData = data['users'];
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User list'),
        backgroundColor: Colors.indigo[900],
        centerTitle: true,
      ),
      body: ListView.builder(
        // ignore: unnecessary_null_comparison
        itemCount: usersData == null ? 0 : usersData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "${index+1}",
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    )),
                CircleAvatar(
                  backgroundImage: NetworkImage(usersData[index]['Avatar']),
                  backgroundColor: Colors.white,
                ),
                 Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "${usersData[index]["firstName"]} ${usersData[index]["lastName"]}",
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
