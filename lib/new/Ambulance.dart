import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../All_Patients_Model.dart';
import '../../Models/patient.dart';
import '../../View_Models/show_patient.dart';
import '../../login.dart';

import '../../children.dart';
import '../../search_by_name.dart';
import '../admen/dashboard.dart';
import 'AddPatient.dart';
import 'PatientDetailsPage.dart';

final List<String> _departments = [
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


class AmbulanceScreen extends StatefulWidget {

  @override
  _AmbulanceScreenState createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen> {

  List<PatientModel> patients = [];
  ShowPatient showPatient = ShowPatient();
  String name ='';
  AddPatient register =  AddPatient();
  final fullNameController = TextEditingController();
  ShowAllPatients show = ShowAllPatients();
  String? _selectedDepartment;
  final _passwordController = TextEditingController();
  bool? _isPasswordIncorrect;
  // List<Patient> patients = [
  //   Patient(
  //       name: 'محمد',
  //       status: 'حرجة',
  //       treatment: 'تنفس اصطناعي',
  //       entryTime: '10:30 ص'),
  //   Patient(
  //       name: 'أحمد',
  //       status: 'متوسطة',
  //       treatment: 'تثبيت كسر',
  //       entryTime: '11:15 ص'),
  //   Patient(
  //       name: 'سارة',
  //       status: 'خفيفة',
  //       treatment: 'تنظيف جرح',
  //       entryTime: '12:00 م'),
  // ];

  List<dynamic> data = [];
  var serverUrl = "http://192.168.43.173:8000";

  Future<void> fetchData() async {
    String myUrl = "$serverUrl/api/student/Browse_my_Trips";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    http.Response response = await http.get(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final responseData = json.decode(response.body);
    print(responseData);
    setState(() {
      data = responseData;
    });
  }

  @override
  void initState() {
    super.initState();
    _isPasswordIncorrect = false; // Initialize the variable
    showPatient.getData().then((patientData) {
      setState(() {
        patients = patientData;
      });
    }).catchError((error) {
      // Handle the error
      print('Error fetching patient data: $error');
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('اختر القسم'),
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
                        items: _departments.map((String department) {
                          return DropdownMenuItem<String>(
                            value: department,
                            child: Text(department),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'كلمة المرور',
                          errorText: _isPasswordIncorrect!
                              ? 'كلمة المرور غير صحيحة'
                              : null,
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          print(
                              'تمت محاولة تسجيل الدخول بقسم: $_selectedDepartment, كلمة المرور: ${_passwordController.text}');

                          // Check if password is valid for different departments
                          if (_selectedDepartment == 'قسم الأطفال' &&
                              _passwordController.text == '000') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChildrenSection(),
                              ),
                            );
                          } else if (_selectedDepartment == 'ادمن' &&
                              _passwordController.text == '000') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Dashboard(),
                              ),
                            );
                          } else if (_selectedDepartment == 'اسعاف' &&
                              _passwordController.text == '000') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AmbulanceScreen(),
                              ),
                            );
                          } else {
                            setState(() {
                              _isPasswordIncorrect = true;
                              // Set the variable to true
                            });
                          }
                        },
                        child: Text(
                          'تسجيل الدخول',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          'تسجيل خروج',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        title: Text(
          'قسم الإسعاف في المشفى الوطني للسويداء',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body:
      Column(
        children: [
          Container(
            height: 80,
            width: 500,
            margin: const EdgeInsets.only(top: 50, left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                30.0,
              ),
            ),
            child: TextFormField(
              onChanged: (value) {

                name = value;
              },
              decoration: InputDecoration(
                hintText: 'ابحث عن مريض...',
                icon: IconButton(icon:Icon(Icons.search), color: Colors.teal,onPressed: () {

                  searchByName(name).then((results) {
                    // يتم تحديث حالة واجهة المستخدم لعرض نتائج البحث
                    // setState(() {
                    //   searchResults = results;
                    // });
                  }).catchError((error) {

                    print('Error: $error');
                  });
                },),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddPatient()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue.shade700),
                    ),
                    child: Text(
                      'إضافة مريض',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ]),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              width: 1200,
              child: ListView.builder(

                itemCount: patients.length,
                itemBuilder: (context, index) {
                  final patient = patients[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.blue[100],
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Text("${patient.data?.full_name}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            // Text(
                            //     'الحالة: ${patients[index].status}    القسم: ${_selectedDepartment ?? 'غير محدد'}'),
                          ],
                        ),
                      ),
                      onTap: () {
                        // _showPatientDetails(context, patients[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPatientDetails(BuildContext context, Patient patient) {
    // Navigator.push(
    //   // context,
    //   // MaterialPageRoute(
    //   //     builder: (context) => PatientDetailsPage(patient: p,)),
    // );

  }

}
