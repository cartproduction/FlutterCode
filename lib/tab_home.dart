import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutterapp/models/ProductResponse.dart';
import 'package:flutterapp/models/Categories.dart';
import 'package:http/http.dart' as http;
import 'productdetail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'productbloc.dart';

class FirstPage extends StatelessWidget {

  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bloc.getProducts();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          centerTitle: true,
          title: new Image.asset('assets/black.png', height: 90,width: 90,),
      ),
      body: Center(
        //child: _widgetOptions.elementAt(_selectedIndex),
        child: StreamBuilder<ProductResponse>(
          stream: bloc.subject.stream,
          builder: (context, AsyncSnapshot<ProductResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null && snapshot.data.error.length > 0){
                return _buildErrorWidget(snapshot.data.error);
              }
              return _buildUserWidget(snapshot.data);

            } else if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error);
            } else {
              return _buildLoadingWidget();
            }
          },
        )
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error occured: $error"),
          ],
        ));
  }

  Widget _buildUserWidget(ProductResponse data) {
    return ListView.builder(

      itemCount: data.categories.length,
      itemBuilder: (context, index) {
        Categories project = data.categories[index];
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(todo: project),
                ),
              );
            },
            child: Stack(
              alignment: AlignmentDirectional.centerStart ,
              children: <Widget>[

                CachedNetworkImage(
                  imageUrl: "http://dhsv9nci6oo42.cloudfront.net"+ project.photo,
                  placeholder: (context, url) => Center(child: Image.asset('assets/gallery.png',height: MediaQuery.of(context).size.width/3,width: MediaQuery.of(context).size.width/3,)),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
                Image.asset("assets/proback.png",alignment: AlignmentDirectional.centerStart,width: MediaQuery.of(context).size.width/3+35,),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child : Text(project.name,style: Theme.of(context).textTheme.title.copyWith(color: Colors.white))
                )



              ],
            )
        );
      },
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