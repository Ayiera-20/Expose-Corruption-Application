import 'package:expose_corruption_app/components/bottom_navbar.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4B0082),
        title: const Text('Settings', style: TextStyle(color: Colors.white),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back), color: Colors.white,
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(left: 15, top: 30),
          child: Row(
            children: [
              ElevatedButton(
                    onPressed: () {
                      ();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4B0082),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(60, 40),
                    ),
                    child: const Text('SIGN OUT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                  ),
                  SizedBox(width: 5),
              ElevatedButton(
                    onPressed: () {
                      ();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4B0082),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(80, 40),
                    ),
                    child: const Text('DELETE ACCOUNT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                ),
            ],
          ),),
          SizedBox(height: 50,),
          CircleAvatar(
            radius: 60,
            child: Text('MA'),),
            SizedBox(height: 10,),
            Card(
              elevation: 5,
              color: Colors.white,
              child:Padding(padding: EdgeInsets.all(10),
              child: Text('Email address'),
            )),
          SizedBox(height: 20,),
          Card(
            color: Colors.white,
            elevation: 5,
            child:Padding(padding: EdgeInsets.all(10),
            child: Text('Number of submitted Reports: '),)
          )
        ],
      ),
    );
  }
}