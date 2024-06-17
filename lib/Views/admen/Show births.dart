import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'dashboard.dart';


class BirthRecordScreen extends StatelessWidget {
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
      );}),

        centerTitle: true,
        title: Text(
          'عرض الولادات',
          style: TextStyle( color: Colors.white,fontSize: 20.0),
        ),
        backgroundColor: Colors.blue[600],
      ),
      body: SingleChildScrollView(
    child: Column(
    children: [
      Container( height: 800,
        width: 900,
        margin: const EdgeInsets.only(top: 30, left: 300),
        child:  ListView(
        children: [
          SizedBox(height: 20.0),
          Container(
            width: 20.0,
            child: TextField(
              decoration: InputDecoration(
                hintText: "البحث عن مريض ",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26),
                ),
                suffixIcon: Icon(Icons
                    .search,color: Colors.teal,), // يمكنك استبدال "Icons.search" بأيقونة بحث أخرى
              ),
            ),
          ),
          SizedBox(height: 20.0),
          DeathRecordCard(
            name: 'لمى الشريطي',
            dateOfBirth: '01/01/1999',
            dateOfDeath: '05/15/2021',
            placeOfDeath: 'مشفى زيد الشريطي',
            causeOfDeath: 'حادث سير',
            phonenumber: '093216547',
            fetalweight: '4 كيلو غرام',
            dateofdiagnosis:'1/1/2032',
            numberofembryos:'1',

            birthofthefetus:'2/8/2023',

            typeofbirth:'طبيعية',
          ),
          SizedBox(height: 15.0),
          DeathRecordCard(
            name: 'مرح العلي',
            dateOfBirth: '03/10/1980',
            dateOfDeath: '06/20/2023',
            placeOfDeath: 'المنزل',
            causeOfDeath: 'جلطة دماغية',
            phonenumber: '09987654',
            fetalweight: '3 كيلو غرام',
            dateofdiagnosis:'1/1/2032',
            typeofbirth:'قيصرية',
            numberofembryos:'1',
            birthofthefetus:'2/8/2023',
          ),
        ],
      ),),

   ],),), );
  }
}

class DeathRecordCard extends StatelessWidget {
  final String name;
  final String dateOfBirth;
  final String dateOfDeath;
  final String placeOfDeath;
  final String causeOfDeath;
  final String phonenumber;
  final String fetalweight;
  final String  dateofdiagnosis;
  final String   typeofbirth;
  final String numberofembryos;
  final String     birthofthefetus;

  DeathRecordCard({
    required this.name,
    required this.dateOfBirth,
    required this.dateOfDeath,
    required this.placeOfDeath,
    required this.causeOfDeath,
    required this.phonenumber,
    required this.fetalweight,
    required this. dateofdiagnosis,
    required this.typeofbirth,
    required this.numberofembryos,
    required this.birthofthefetus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5.0),
      color: Colors.white60,
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: printPatientReport,
                  child: Text(
                    'طباعة التقرير',
                    style:
                        TextStyle(color: Colors.green.shade700, fontSize: 16.0),
                  ),
                ),
                Text(
                  'تفاصيل الحمل والولادة',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: Colors.blue[700]),
                ),

                Text(
                  ' معلومات الأم',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: Colors.blue[700]),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '  ',),


                Text(

                  ' نوع الولادة : $dateOfBirth',

                ),


                Text(
                  'اسم الأم: $name',
                ),

              ],
            ),
            SizedBox(height: 12.0),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '  ',

                ),
                Text(
                  ' عدد الأجنة : $numberofembryos',

                ),

                Text(
                  'تاريخ الولادة:  $dateOfBirth',
                  style: TextStyle(color: Colors.black),

                ),

              ],
            ),
            SizedBox(height: 12.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '  ',

                ),
                Text(
                  ' تاريخ الولادة : $birthofthefetus',

                ),

                Text(
                  'معلومات الإتصال:  $phonenumber',
                  style: TextStyle(color: Colors.black),
                ),

              ],
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [


                Text(
                  'معلومات الجنين  ',
                  style: TextStyle(color: Colors.blue[700],fontWeight: FontWeight.bold,),
                ),

              ],
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [


                Text(
                  'وزن الجنين: $fetalweight',
                  style: TextStyle(color: Colors.black),
                ),

              ],
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [


                Text(
                  'تاريخ التشخيص:   $dateofdiagnosis',
                  style: TextStyle(color: Colors.black),
                ),

              ],
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
