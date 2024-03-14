import 'dart:convert';

import 'package:complain_close_flutter/Current_page.dart';
import 'package:complain_close_flutter/SplashScreen.dart';
import 'package:complain_close_flutter/Total_complain_page.dart';
import 'package:complain_close_flutter/complain_form.dart';
import 'package:complain_close_flutter/login.dart';
import 'package:complain_close_flutter/otp_verification.dart';
import 'package:complain_close_flutter/uploadData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Complain Close',
      // initialRoute: "/upload",
      routes: {
        'splash': (context) => splashScreen(),
        '/login': (context) => loginpage(),
        '/mainepage': (context) => MyApp(),
        '/otppage': (context) => otp_verification(),
        '/formpage': (context) => complaine_form(),
        '/upload': (context) => uploaddata(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
            children: [
              currentpage(),
              total_complain()
            ],
          ),

          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('Complain Dashboard',style: TextStyle(
              fontSize: 18,
              color: Colors.white
            ),),
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white60,
                indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(text: 'Current'),
                Tab(text: 'Total'),
              ],
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return Container(

                  child: IconButton(

                    icon: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/profile.png'), // Set your left image here
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                );
              },
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  child: Text('CD'), // Text for Complain Dashboard
                ),
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.png'),
                      // Set your profile image here
                      radius: 40,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person_2_outlined, color: Colors.black38),
                  title: TextButton(
                    onPressed: () {

                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => otp_verification()),
                      // );

                    }, child: Text( 'My Profile',
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black38,
                  ),
                  onTap: () {
                    // Handle navigation for item 1
                  },
                ),
                ListTile(
                  title: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => currentpage()),
                      );

                    }, child: Text( 'Status',
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),),
                  ),
                  leading:
                  Icon(Icons.question_mark_outlined, color: Colors.black38),
                  // Widget to be displayed on the left
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black38,
                  ),
                  onTap: () {
                    // Handle navigation for item 2
                  },
                ),
                ListTile(
                  title: TextButton(
                     onPressed: () {
                       Navigator.pushReplacement(
                         context,
                         MaterialPageRoute(builder: (context) => total_complain()),
                       );
                     }, child: Text('Close Complains',
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),),
                  ),
                  leading: Icon(Icons.done_outline, color: Colors.black38),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black38,
                  ),
                  onTap: () {
                    // Handle navigation for item 2
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.security,
                    color: Colors.black38,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black38,
                  ),
                  title: TextButton(
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => otp_verification()),
                      // );
                    }, child: Text(  'Terms & Condition',style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),),
                  ),
                  onTap: () {
                    // Handle navigation for item 2
                  },
                ),
                // Add more list items as needed
              ],
            ),
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => splashScreen()),
              );
            },
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
