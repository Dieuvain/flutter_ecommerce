import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/pages/login_page.dart';
import 'package:flutter_ecommerce/pages/register_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LimangaMarket',

      //Appel des Pages par Navigation

routes: { '/login': (BuildContext context) =>loginPage() , '/register': (BuildContext context) =>RegisterPage()


}, //routage de la page  Login



      theme: ThemeData(
        
        brightness: Brightness.dark,

textTheme: TextTheme(
                    
                    //Design des Text a Utiliser directment sur le Projet
                    headline: 

                    TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold ),


                     title: 
                     
                     TextStyle(fontSize: 36.0, fontWeight: FontWeight.w300),

                     body1: 

                     TextStyle(fontSize:18.0),
                  
                  
                    ),

        primaryColor: Colors.deepOrange[900],
        accentColor: Colors.amber[800],
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RegisterPage() 
    );
  }
}


