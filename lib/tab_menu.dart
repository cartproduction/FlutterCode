import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Menü",style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
          child: Column(
              children: <Widget>[
                Image.asset('assets/appimage.jpeg', width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height/4,fit: BoxFit.fitWidth,),
                SizedBox(height: 15),
                Center(child:Text("Hoşgeldin , Serhat",style: Theme.of(context).textTheme.title.copyWith(color: Colors.blueAccent))),
                SizedBox(height: 15),
                Expanded(
                    child: ListView.builder(
                      itemCount: choices.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            leading: Icon(choices.elementAt(index).icon),
                            title: Text(choices.elementAt(index).title),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  //builder: (context) => Picker(),
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

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Siparişlerim', icon: Icons.shopping_basket),
  const Choice(title: 'Adreslerim', icon: Icons.place),
  const Choice(title: 'Profilimi Düzenle', icon: Icons.edit),
  const Choice(title: 'Şifre Değiştir', icon: Icons.vpn_key),
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