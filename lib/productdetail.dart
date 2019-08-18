import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/Categories.dart';
import 'picker.dart';

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Categories todo;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(todo.name,style: TextStyle(color: Colors.black)),
      ),

        body: SafeArea(
            child: Column(
                children: <Widget>[
                  Image.network("http://dhsv9nci6oo42.cloudfront.net"+ todo.photo, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height/4,fit: BoxFit.fitWidth,),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:Text(todo.name,style: Theme.of(context).textTheme.title.copyWith(color: Colors.black)),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:Text(todo.description),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                      child: ListView.builder(
                        itemCount: todo.productResponses.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              leading: Image.network("http://dhsv9nci6oo42.cloudfront.net"+ todo.productResponses.elementAt(index).icon),
                              title: Text(todo.productResponses.elementAt(index).name),
                              subtitle: Text('Fiyat: ${todo.productResponses.elementAt(index).price} TL'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Picker(),
                                  ),
                                );
                              }
                          );
                        },

                      )
                  ),
                ]
            )
        )

    );
  }
}