import 'package:flutter/material.dart';

import 'Views/Ambulance/Ambulance.dart';

import 'Views/admen/dashboard.dart';
import 'Views/machine_inventory/main_view_machine_inventory.dart';
import 'Views/medicile_inventory/home_page_inventory.dart';
import 'children.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _selectedDepartment;
  final _passwordController = TextEditingController();
  bool? _isPasswordIncorrect; // Updated variable

  @override
  void initState() {
    super.initState();
    _isPasswordIncorrect = false; // Initialize the variable
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: SizedBox.expand(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('images/do.jpg'),
                fit: BoxFit.cover,
              )),
              alignment: Alignment.center,
            ),
          )),
          // Right Side: Transparent 3D Rectangle with Buttons (rounded corners)
          Expanded(
            child: Container(
              color: Colors.transparent, // Maintain transparency
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'مشفى زيد الشريطي',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),

                    // Container with rounded corners (applied to both parent and child)
                    Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust for desired roundness
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5.0,
                            blurRadius: 7.0,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Drop-down Menu for Departments
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            hint: Text('اختر القسم'),
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
                          SizedBox(height: 20.0),

                          // Password Input Field
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              labelText: 'كلمة المرور',
                            ),
                          ),
                          SizedBox(height: 20.0),

                          // Login Button
                          if (_isPasswordIncorrect == true)
                            Text(
                              'كلمة المرور غير صحيحة!',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          SizedBox(height: 10.0),
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
                              } else if (_selectedDepartment ==
                                      'مستودع الأدوية والمستلزمات الطبية' &&
                                  _passwordController.text == '000') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePageInventory(),
                                  ),
                                );
                              } else if (_selectedDepartment ==
                                      'مستودع الأجهزة الطبية' &&
                                  _passwordController.text == '000') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainViewMachine(),
                                  ),
                                );
                              } else {
                                setState(() {
                                  _isPasswordIncorrect = true;
                                  // Set the variable to true
                                });
                              }
                            },
                            child: Text('تسجيل الدخول',
                                style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),

                          // Error message for incorrect password
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Replace with your actual list of departments (in Arabic)
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
    'مستودع الأدوية والمستلزمات الطبية',
    'مستودع الأجهزة الطبية',

    // Add other departments here
  ];
}
