import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class DeathRecordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            }),
        centerTitle: true,
        title: Text(
          'عرض الوفيات',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        backgroundColor: Colors.blue[600],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 800,
              width: 900,
              margin: const EdgeInsets.only(top: 30, left: 300),
              child: ListView(
                children: [
                  SizedBox(height: 20.0),
                  Container(
                    height: 80,
                    width: 700,
                    margin: const EdgeInsets.only(top: 30, left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50.0,
                      ),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        label: Text('البحث عن مريض'),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.teal,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  DeathRecordCard(
                    name: 'لمى الشريطي',
                    dateOfBirth: '01/01/1999',
                    dateOfDeath: '05/15/2021',
                    placeOfDeath: 'مشفى زيد الشريطي',
                    causeOfDeath: 'حادث سير',
                  ),
                  SizedBox(height: 15.0),
                  DeathRecordCard(
                    name: 'زيد أحمد',
                    dateOfBirth: '03/10/1980',
                    dateOfDeath: '06/20/2023',
                    placeOfDeath: 'المنزل',
                    causeOfDeath: 'جلطة دماغية',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeathRecordCard extends StatelessWidget {
  final String name;
  final String dateOfBirth;
  final String dateOfDeath;
  final String placeOfDeath;
  final String causeOfDeath;

  DeathRecordCard({
    required this.name,
    required this.dateOfBirth,
    required this.dateOfDeath,
    required this.placeOfDeath,
    required this.causeOfDeath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5.0),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' ',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: printPatientReport,
                  child: Text(
                    'طباعة التقرير',
                    style:
                        TextStyle(color: Colors.pink.shade500, fontSize: 16.0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            ListTile(
              title: Text(
                name,
                style: TextStyle(
                    color: Colors.blue[700], fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.0),
                  Text(
                    'تاريخ الولادة:  $dateOfBirth',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'تاريخ الوفاة:  $dateOfDeath',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'مكان الوفاة:  $placeOfDeath',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'سبب الوفاة:  $causeOfDeath',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void printPatientReport() {
  // Printing.layoutPdf(onLayout: (format) {
  //   final pdf = PdfDocument();
  //   pdf.addPage(
  //     PdfPage(
  //       build: (PdfPageContext context) {
  //         return Center(
  //           child: Text('Patient Report\\n\\n$label $value'),
  //         );
  //       },
  //     ),
  //   );
  //   return pdf.save();
  // });
}
