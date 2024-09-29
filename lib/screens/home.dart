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
        Padding(padding: EdgeInsets.only(left: 5, right: 5, bottom: 20, top: 20 ),
        child: Column( children: [
          Text("Corruption is everyone's fight, and with your help, we can make a real difference",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Card(
        child: Container(
            height: 150,
              child: Padding(padding: EdgeInsets.only(left: 5, right: 35, top: 10  ),
              child: Text("ExposeCorruption allows you to report corrupt activities in your community safely, securely, and anonymously.",
              style: TextStyle( fontSize: 16, color: Colors.white,),),              
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("images/living.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                ),
                borderRadius: BorderRadius.circular(10)
              ),
            ),),
            ],)
        ),

        Container(
        decoration: const BoxDecoration(
          borderRadius:BorderRadius.only( 
            topLeft: Radius.elliptical(50, 50),
            topRight: Radius.elliptical(50, 50)
            ),
          gradient: LinearGradient(
            colors: [
              Color(0xFF00FFFF), 
              Color(0xFF4169E1), 
              Color(0xFF4B0082),
            ] 
          ),                  
        ),
        child: Padding(padding: const EdgeInsets.only(left: 20, bottom: 131, right: 10,),
        child: Column(
          children: [
            const SizedBox(height: 100,),
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
                            padding: EdgeInsets.only( right:80),
                            child: Icon(
                            Icons.edit_document,
                            color:Color(0xFF4B0082), 
                            size: 80,
                          )
                            ),

                          
                          
                        ),
                        const Padding(padding: EdgeInsets.only(left: 20, bottom: 20, right: 10),
                          child: Text('Report corruption', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

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
                          child: Icon(
                            Icons.help,
                            size: 80,
                            color: Color(0xFF4B0082),
                            ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 20, bottom: 20, right: 40),
                          child: Text('How to report?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

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
                          child: Icon(
                            Icons.list_alt_rounded,
                            color:Color(0xFF4B0082), 
                            size: 80,
                            )
                        ),
                        const Padding(padding: EdgeInsets.only(left: 20, bottom: 20, right: 40),
                          child: Text('View my report', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

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
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 4,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(7)
                            
                          ),
                          child:Icon(
                            Icons.info,
                            size: 80,
                            color: Color(0xFF4B0082)
                            )
                          
                        ),
                        const Padding(padding: EdgeInsets.only(left: 20, bottom: 20, right: 80),
                          child: Text('Resources', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

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