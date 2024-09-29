import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';



class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  DateTime? incidentDate;
  File? _image; 
  final picker = ImagePicker();


  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != incidentDate) {
      setState(() {
        incidentDate = picked;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4B0082),
        title: const Text('Submit a report', style: TextStyle(color: Colors.white),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back), color: Colors.white,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF00FFFF),
                    Color(0xFF4169E1), 
                    Color(0xFF4B0082), 
                    
                  ] )
              ),
        child: Padding(padding: const EdgeInsets.only( left: 20, right: 20, top: 30),
        child:  Column(
          children: [
            Text("Your voice matters! Please use this form to report any incidents of corruption that you have witnessed or experienced. Your submission will remain confidential, and your identity will be protected.",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50,),
            const TextField(
              maxLines: 5,
              decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Description of corruption',
                  ),
                  
            ),
            const SizedBox(height: 30,),
            const TextField(
              decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Involved Parties',
              ),
                  
            ),
            const SizedBox(height: 16,),
            const TextField(
              decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Location of incident',
              ),                  
            ),
            SizedBox(height: 16,),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius:  BorderRadius.zero
              ),
            child: Row(
                children: [
                  Text(
                    incidentDate == null
                        ? 'Select Incident Date'
                        : 'Incident Date: ${incidentDate!.toLocal()}'.split(' ')[0],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4B0082), 
                    ),
                    child: Text('Pick Date', style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: Icon(Icons.camera_alt),
                label: Text('Upload Evidence (Photo)'),
              ),
              SizedBox(height: 16),
              _image == null
                  ? Text('No image selected.')
                  : Image.file(
                      _image!,
                      height: 200,
                    ),
              SizedBox(height: 16),
            ElevatedButton(
                    onPressed: () {
                      ();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4B0082),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(365, 50),
                    ),
                    child: const Text('Sumbit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                ),
          ],
        ),
        ),
      ),
    );
  }
}