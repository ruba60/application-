import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddPatient.dart';
import 'Ambulance.dart';

final List<String> _departments = [
  'اسعاف',
  'مراقب الدوام',
  'ادمن',
  'قسم الأطفال',
  'قسم الهضمية',
  'قسم العظمية',
  'قسم النسائية',
  'قسم الأشعة',
  'قسم المخابر',
  'قسم الجراحة',
  'قسم البولية',
  'قسم الصدرية',
  'قسم القلبية',
  'قسم الجلدية',
  'قسم الأعصاب',
  // Add other departments here
];

class PatientDetailsPage extends StatelessWidget {
  final Patient patient;
  String? _selectedDepartment;

  PatientDetailsPage({required this.patient});

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        centerTitle: true,
        title: Text('تفاصيل المريض',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AmbulanceScreen()),
              );
            }),
      ),
      body: Row(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue[100]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'الملف الطبي',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: ListView(
                        padding: const EdgeInsets.all(16.0),
                        children: [
                          Text(
                            'الإسم الثلاثي',
                            style: TextStyle(
                                color: Colors.blue[600],
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(patient.name,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'توصيف حالة المريض',
                            style: TextStyle(
                                color: Colors.blue[600],
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(patient.status,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'العلاج المقترح',
                            style: TextStyle(
                                color: Colors.blue[600],
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(patient.treatment,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ],
                      )),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddPatient()));
                          },
                          child: Text(
                            'تعديل',
                            style: TextStyle(
                                color: Colors.blue[600],
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return AlertDialog(
                              title: Text('اختر قسم'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  DropdownButton<String>(
                                    value: _selectedDepartment,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedDepartment = newValue;
                                      });
                                    },
                                    items:
                                        _departments.map((String department) {
                                      return DropdownMenuItem<String>(
                                        value: department,
                                        child: Text(department),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "تحويل",
                                    style: TextStyle(
                                        color: Colors.blue[600],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Text(
                    'تحويل إلى قسم',
                    style: TextStyle(
                        color: Colors.blue[600],
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('أدخل الطلب'),
                          content: TextField(
                            controller: textController,
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                'إرسال',
                                style: TextStyle(
                                    color: Colors.blue[600],
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                String request = textController.text;

                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'طلب صورة شعاعية',
                    style: TextStyle(
                        color: Colors.blue[600],
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 16),

                //requestEmergencyTests
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('أدخل الطلب'),
                          content: TextField(),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                'إرسال',
                                style: TextStyle(
                                    color: Colors.blue[600],
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'طلب تحاليل إسعافية',
                    style: TextStyle(
                        color: Colors.blue[600],
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 16),

                //viewFileAttachments
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('أدخل الطلب'),
                            content: TextField(),
                            actions: <Widget>[
                              TextButton(
                                child: Text(
                                  'إرسال',
                                  style: TextStyle(
                                      color: Colors.blue[600],
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      'عرض مرفقات الملف الطبي',
                      style: TextStyle(
                          color: Colors.blue[600],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'حالة علاج سريع',
                    style: TextStyle(
                        color: Colors.blue[600],
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
