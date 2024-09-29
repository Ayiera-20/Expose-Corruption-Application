import 'package:expose_corruption_app/components/bottom_navbar.dart';
import 'package:expose_corruption_app/screens/contact.dart';
import 'package:expose_corruption_app/screens/settings.dart';
import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({super.key});


  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4B0082),
        title: const Text('Help and FAQ', style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {}, 
          icon: const Icon(Icons.notification_add)),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Settings() ));
            }, 
          icon: const Icon(Icons.settings))
        ]
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: Padding(padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for help...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7)
                )
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child:ListView(
              children: [
                ListTile(
                  title: Text('Getting Started'),
                  onTap: () {}
                ),
                ListTile(
                  title: Text('Report Submission'),
                  onTap: () {},
                )
              ],
            ),),
            SizedBox(height: 100,),
            Text('Frequently Asked Questions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ExpansionTile(title: Text('How do I submit a corruption report?'),
            children: [
              Padding(padding: EdgeInsets.all(8),
              child: Text("To submit a corruption report, click the 'Report Corruption' button on the home page. You can then provide details, upload evidence, and select the location."),
              )
            ],),
            SizedBox(height: 5,),
            ExpansionTile(title: Text('Can I report anonymously?'),
            children: [
              Padding(padding: EdgeInsets.all(8),
              child: Text("Yes, you can report anonymously without providing your personal details."),
              )
            ],),
            SizedBox(height: 5,),
            ExpansionTile(title: Text('How do I track the status of my report?'),
            children: [
              Text("View My Reports' on the homepage to check the status of your submitted reports.")
            ],),
            SizedBox(height:95),
            Text('Conatct Support'),
            Text('Conatct us or send us your feedback.'),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Contact()
                ));
            }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF4B0082),
            ),
            child: Text('Conatct Us', style: TextStyle(color: Colors.white),))

          ],
        ),
      
      ),
    );
  }
}