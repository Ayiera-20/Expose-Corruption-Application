import 'package:expose_corruption_app/components/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReportDetails extends StatefulWidget {
  const ReportDetails({super.key});

  @override
  State<ReportDetails> createState() => _ReportDetailsState();
}

class _ReportDetailsState extends State<ReportDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4B0082),
        title: const Text('Report Details', style: TextStyle(color: Colors.white),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back), color: Colors.white,
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: Padding(padding: EdgeInsets.only(right: 20, left: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: 150,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF00FFFF),
                    Color(0xFF4169E1), 
                    Color(0xFF4B0082), 
                    
                  ] )
              ),
              child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero),
              child:Column(
                children: [
                  SizedBox(height: 50,),
                  Text("Description of corruption:"),
                  SizedBox(height: 5,),
                  Text("Description of Corruption")
                ],
              )
            ),),
            SizedBox(height: 16,),
            Container(
              width: 350,
              height: 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF00FFFF),
                    Color(0xFF4169E1), 
                    Color(0xFF4B0082), 
                    
                  ] )
              ),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero),
                child:Column(
                  children: [
                    SizedBox(height: 20,),
                    Text("Involved Parties:"),
                    SizedBox(height: 5,),
                    Text("Involved parties")
                  ],
                )
              ),),
            SizedBox(height: 16,),
            Container(
              width: 350,
              height: 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF00FFFF),
                    Color(0xFF4169E1), 
                    Color(0xFF4B0082), 
                    
                  ] )
              ),
              child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero),
              child:Column(
                children: [
                  SizedBox(height: 20),
                  Text("Location of incident:"),
                  SizedBox(height: 5,),
                  Text("Location of incident")
                ],
              )
            ),),
            SizedBox(height: 16,),
            Container(
              width: 350,
              height: 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF00FFFF),
                    Color(0xFF4169E1), 
                    Color(0xFF4B0082), 
                    
                  ] )
              ),
              child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero),
              child:Column(
                children: [
                  SizedBox(height: 20,),
                  Text("Incident Date"),
                  SizedBox(height: 5,),
                  Text("Incident Date")
                ],
              )
            ),)

          ],
        ),
      )
    );
  }
}