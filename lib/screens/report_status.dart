import 'package:expose_corruption_app/components/bottom_navbar.dart';
import 'package:expose_corruption_app/screens/report_details.dart';
import 'package:flutter/material.dart';

class ReportStatus extends StatelessWidget {
  const ReportStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4B0082),
        title: const Text('Report Status', style: TextStyle(color: Colors.white),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back), color: Colors.white,
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
      body:const Padding(padding: EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          SizedBox(height: 20,),
                          Text('Report ID', style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('001'),
                        ],),
                        SizedBox(width: 25,),
                        Column(children: [
                          Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('001'),
                        ],),
                        SizedBox(width: 25,),
                        Column(children: [
                          Text('Involved Parties', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('001'),
                        ],),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          Text('Location', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('001'),
                        ],),
                        SizedBox(width: 25,),
                        Column(children: [
                          Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('001'),
                        ],),
                        SizedBox(width: 25,),
                        Column(children: [
                          Text('Date Submitted', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('001'),
                          SizedBox(height: 15,)
                        ],),
                      ],
                    )
                  ],
                ),
            ),
            Card(
              color: Colors.white,
              child: Row(
                children: [
                  SizedBox(height: 45,),
                  Text('Progress Bar      ',style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Under Reviews'),
                  SizedBox(height: 45,)
                ],
              ),
            ),
            SizedBox(height: 15,),
          ],
        ),
      )
    );
  }
}