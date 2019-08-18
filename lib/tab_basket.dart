import 'package:flutter/material.dart';
import 'main.dart';
class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void _select(Choice choice) {
      // Causes the app to rebuild with the new _selectedChoice.

    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Sepet",style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          // action button
          IconButton(
            color: Colors.black,
            icon: Icon(choices[0].icon),
            onPressed: () {
              _select(choices[0]);
            },
          ),

          // overflow menu
          /*PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(2).map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
              },
            ),*/
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Center(child : Column(children: <Widget>[
          Image.asset('assets/cart.png', height: 100,width: 100,fit: BoxFit.cover,),
          SizedBox(height: 15),
          Text("Henüz sepetinizde ürün bulunmamaktadır",style: TextStyle(color: Colors.black)),
          SizedBox(height: 15),
          GestureDetector(
              child: Container(
                  width:MediaQuery.of(context).size.width-60,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          image:AssetImage("assets/butonback.png"),
                          fit:BoxFit.fill
                      ),

                  ),
                  child: Center(child: Text("Ürün Ekle",style: TextStyle(color: Colors.white)),) // button text
              ),onTap:(){
            print("you clicked my");
          }
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,)
        )



      )

    );
  }
}
class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.add),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}