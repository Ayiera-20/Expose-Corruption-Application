import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4B0082),
        title: const Text('Contact', style: TextStyle(color: Colors.white),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back), color: Colors.white,
        ),
      ),
    body: Container(        
      child: SingleChildScrollView(
      child: Column( 
        children: [
          Padding(padding: const EdgeInsets.only(left: 16, right: 16, top: 60, bottom: 30),
            child: Card(
              elevation: 10,
              color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height:20),
                const Text('Send us a message or your feedback', style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF2F2F2F)),),
                const SizedBox(height: 16,),
                const Text('Name'),
                const SizedBox(height: 8,),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  width: double.infinity,
                  child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey [200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                ),
                const SizedBox(height: 16,),
                const Text('Email'),
                const SizedBox(height: 8,),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  width: double.infinity,
                  child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                ),
                const SizedBox(height: 16,),
                const Text('Your Message'),
                const SizedBox(height: 8,),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  width: double.infinity,
                  child: TextField(
                    maxLines: 5,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey [200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                ),
                const SizedBox(height: 16,),
                ElevatedButton(onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4B0082),
                ),
                child: const Text('Submit', style: TextStyle(color: Colors.white),)),
                const SizedBox(height: 20,),
              ],
            ),
      ),
          ),
        
      const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16, top: 5, bottom: 185),
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Info',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF2F2F2F)),
                        ),
                        SizedBox(height: 8),
                        Text('Location: Nairobi, Kenya'),
                        SizedBox(height: 5),
                        Text('Email: exposecorrupt@ke.mail'),
                        SizedBox(height: 5),
                        Text('Phone number: +254 12345678'),
                      ],
                    ),
                  ),
                ),
              ),
      ]
      )
    ),
    ),
    );
  }
}