import 'package:flutter/material.dart';

import 'dash.dart';
import 'departments.dart';
import 'home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // NavigationRail
          Container(
            //color: Colors.blue,
            width: 300, // عرض المستطيل
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              color: Colors.blue, // لون الخلفية أزرق
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),

              // إضافة حشوة داخل المستطيل
              child: NavigationRail(
                minWidth: 72.0,
                selectedIndex: _selectedIndex,
                onDestinationSelected: _onItemTapped,
                labelType: NavigationRailLabelType.all,
                backgroundColor: Colors.blue,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white, // لون الأيقونة أبيض
                    ),
                    label: Text(
                      'الصفحة الرئيسية',
                      style: TextStyle(color: Colors.white), // لون النص أبيض
                    ),
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                      Icons.supervised_user_circle,
                      color: Colors.white, // لون الأيقونة أبيض
                    ),
                    label: Text(
                      ' الأطباء',
                      style: TextStyle(color: Colors.white), // لون النص أبيض
                    ),
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                      Icons.notes,
                      color: Colors.white, // لون الأيقونة أبيض
                    ),
                    label: Text(
                      'الأقسام ',
                      style: TextStyle(color: Colors.white),
                      // onPressed: () => _transferToNursery(patient), // لون النص أبيض
                    ),
                  ),
                  NavigationRailDestination(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white, // لون الأيقونة أبيض
                    ),
                    label: Text(
                      'تسجيل الخروج',
                      style: TextStyle(color: Colors.white), // لون النص أبيض
                    ),
                  ),
                ],
              ),
            ),
          ),

          // واجهة المحتوى
          Expanded(
              child: _selectedIndex == 0
                  ? Dash()
                  : _selectedIndex == 1
                      // ignore: prefer_const_constructors
                      ? Home()
                      : const AddDepartmentScreen()),
        ],
      ),
    );
  }
}
