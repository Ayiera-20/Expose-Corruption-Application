import 'package:expose_corruption_app/components/bottom_navbar.dart';
import 'package:expose_corruption_app/screens/help.dart';
import 'package:expose_corruption_app/screens/login.dart';
import 'package:expose_corruption_app/screens/report.dart';
import 'package:expose_corruption_app/screens/report_details.dart';
import 'package:expose_corruption_app/screens/settings.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4B0082),
        title: const Text('Home', style: TextStyle(color: Colors.white),),
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
      body: Column( children: [
        
        Card(
        child: Container(
            height: 200,
            width: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("images/living.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                ),
                borderRadius: BorderRadius.circular(7)
              ),
              child: Padding(padding: EdgeInsets.only(left: 5, right: 35, top: 10  ),
              child: Text("Expose \n Corruption ",
              style: TextStyle( fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),),              
              ),
            ),),

        Card(
          elevation: 10,
          color: Color(0xFFD8D2CB),
          child: SizedBox(
            height: 100,
            child: Padding(padding: EdgeInsets.only(left: 35, right: 35, top: 10  ),
              child: Text("Expose Corruption allows you to report corrupt activities in your community safely, securely, and anonymously.",
              style: TextStyle( fontSize: 14, color: Color(0xFF2F2F2F), fontWeight: FontWeight.bold),),              
              ),

          ),
        ),
        SizedBox(height: 40),
        Container(
        child: Padding(padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20,),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [   
                Expanded(
                  child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Report()
                      )
                    );
                  },
                  child: Card(
                    elevation: 10,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 50,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(7)
                            
                          ),
                          child: Padding(
                            padding: EdgeInsets.only( right:80),
                            child: Icon(
                            Icons.edit_document,
                            color:Color(0xFF4B0082), 
                            size: 60,
                          )
                            ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 20, bottom: 20, right: 10),
                          child: Text('Report Corruption', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),

                        )
                      ],
                    ),
                  ),
                ),),

                Expanded(
                  child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Help()
                      )
                    );
                  },
                  child: Card(
                    elevation: 10,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 2,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(7)
                            
                          ),
                          child: Padding(
                            padding: EdgeInsets.only( right:50),
                            child: Icon(
                            Icons.help,
                            color:Color(0xFF4B0082), 
                            size: 60,
                          )
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 20, bottom: 20, right: 10),
                          child: Text('How to report?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),

                        )
                      ],
                    ),
                  ),
                ))

              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [                
                Expanded(child: 
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ReportDetails()
                      )
                    );
                  },
                  child: Card(
                    elevation: 10,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 2,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(7)
                            
                          ),
                          child: Padding(
                            padding: EdgeInsets.only( right:100),
                            child: Icon(
                            Icons.list_alt_rounded,
                            color:Color(0xFF4B0082), 
                            size: 60,
                          )
                            ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 20, bottom: 20, right: 10),
                          child: Text('View reports', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

                        )
                      ],
                    ),
                  ),
                ),),

                Expanded(
                  child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Login()
                      )
                    );
                  },
                  child: Card(
                    elevation: 10,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 50,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(7)
                            
                          ),
                          child:Icon(
                            Icons.info,
                            size: 60,
                            color: Color(0xFF4B0082)
                            )
                          
                        ),
                        const Padding(padding: EdgeInsets.only(left: 20, bottom: 20, right: 10),
                          child: Text('Resources', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),

                        )
                      ],
                    ),
                  ),
                ),)

              ],
            )
          ],
        ),
        )   

      ),
  ]
      )
    );
  }
}