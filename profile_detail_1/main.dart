import 'package:flutter/material.dart';

void main() => runApp(ContactProfilePage());

class MyAppThemes {
  static ThemeData appThemeLight() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      iconTheme: IconThemeData(
        color: Colors.indigo.shade800,
        ),
    );
  }

  static ThemeData appThemeDark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      iconTheme: IconThemeData(
        color: Colors.orange,
        ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(40);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(
        Icons.arrow_back,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.star_border),
          onPressed: () {
            print("Contact is starred");
          },
        )
      ],
      );
  }
}

class ContactProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyAppThemes.appThemeDark(),
      home: Scaffold(
        appBar: MyAppBar(),
        body: buildBodyWidget(),
      ),
    );
  }

  Widget buildAppBarWidget() {
    return AppBar(
      leading: Icon(
        Icons.arrow_back,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.star_border),
          onPressed: () {
            print("Contact is starred");
          },
        ),
      ],
    );
    
  }

  Widget buildBodyWidget() {
    return ListView(
          children: <Widget>[
            Container(
                width: double.infinity,
                child: Image.network(
                  "https://media-exp1.licdn.com/dms/image/C4D03AQGywJAjCCLdWw/profile-displayphoto-shrink_800_800/0/1596536845741?e=1644451200&v=beta&t=JjOLsBksFAoxRZd8Ts_ZK-GbUc4ejy91K2KniX4oeJc",
                  height: 250,
                  fit: BoxFit.cover,
                )),
                Container(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Kerem Alan",
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Theme(
                    data: ThemeData(
                      iconTheme: IconThemeData(
                        color: Colors.blueGrey,
                      ),
                    ),
                  child: profileActionItems(),
                  ),              
                ),
              Divider(
                color: Colors.grey,
              ),

              mobilePhoneListTile(),
              otherPhoneListTile(),
              Divider(
                color: Colors.grey,  
              ),

              emailListTile(),
              Divider(
                color: Colors.grey,
              ),
              addressListTile(),
          ],
        );
  }

  Widget profileActionItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildCallButton(),
        buildTextButton(),
        buildEmailButton(),
        buildDirectionsButton(),
        buildPayButton(),
      ],
    );
  }

  Widget buildCallButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.call,
          ),
          onPressed: () {},
        ),
        Text("Ara"),
      ],
    );
  }

  Widget buildTextButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.message,
          ),
          onPressed: () {},
        ),
        Text("Mesaj"),
      ],
    );
  }

  Widget buildEmailButton() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.email,
          ),
          onPressed: () {},
        ),
        Text("E-Posta"),
      ],
    );
  }

  Widget buildDirectionsButton() {
      return Column(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.directions,
            ),
            onPressed: () {},
          ),
          Text("Konum"),
        ],
      );
  }

  Widget buildPayButton(){
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.payment,
          ),
          onPressed: () {},
        ),
        Text("Ödeme"),
      ],
    );
  } 

  Widget mobilePhoneListTile() {
    return ListTile(
      leading: Icon(Icons.call),
      title: Text("534-743-7751"),
      subtitle: Text("mobil"),
      trailing: IconButton(
        icon: Icon(Icons.message),
        color: Colors.grey,
        onPressed: () {},
      ),
    );
  }

  Widget otherPhoneListTile() {
    return ListTile(
      leading: Text(""),
      title: Text("+90-534-743-7751"),
      subtitle: Text("diğer"),
      trailing: IconButton(
        icon: Icon(Icons.message),
        color: Colors.grey,
        onPressed: () {},
      ),
    );
  }

  Widget emailListTile() {
    return ListTile(
      leading: Icon(Icons.email),
      title: Text("kerem.alan@outlook.com"),
      subtitle: Text("e-posta"),
    );
  }

  Widget addressListTile() {
    return ListTile(
      leading: Icon(Icons.location_on),
      title: Text("Yağcilar Mahallesi, Araç Sokak"),
      subtitle: Text("ev"),
      trailing: IconButton(
        icon: Icon(Icons.directions),
        color: Colors.grey,
        onPressed: () {},
      ),
    );
  }
}