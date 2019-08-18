import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutterapp/models/ProductResponse.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class SplashPage extends StatelessWidget {

  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        //child: _widgetOptions.elementAt(_selectedIndex),
        child: FutureBuilder<ProductResponse>(
          future: getProducts(), //sets the getProducts method as the expected Future
          builder: (context, snapshot) {
            if (snapshot.hasData) { //checks if the response returns valid data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ),
              );

            } else if (snapshot.hasError) { //checks if the response throws an error
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
Future<ProductResponse> getProducts() async {
  String url = "http://173.212.212.137:5000/api/categories/products/list";
  final response =
  await http.get(url, headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    return ProductResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}