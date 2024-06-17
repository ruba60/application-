import 'package:flutter/material.dart';

import 'Babysitter.dart';
import 'Patients staying in the department.dart';
import 'login.dart';


class Patient {
  String name;
  int age;
  String diagnosis;
  PatientStatus status = PatientStatus.referred;
  String description;

  Patient({
    required this.name,
    required this.age,
    required this.diagnosis,
    required this.description,
  });
}

List<Patient> _nurseryPatients = [
  Patient(
    name: 'خالد',
    age: 3,
    diagnosis: 'التهاب رئوي',
    description: 'يعاني من صعوبة في التنفس وحرارة مرتفعة',
  ),
  Patient(
    name: 'لينا',
    age: 1,
    diagnosis: 'فقر الدم',
    description: 'تعاني من شحوب وإرهاق شديد',
  ),
  Patient(
    name: 'سليم',
    age: 5,
    diagnosis: 'حساسية الغذاء',
    description: 'يعاني من طفح جلدي وانتفاخ في الوجه',
  ),
];

enum PatientStatus { referred, admitted, nursery }

class ChildrenSection extends StatefulWidget {
  const ChildrenSection({Key? key}) : super(key: key);

  @override
  State<ChildrenSection> createState() => _ChildrenSectionState();
}

class _ChildrenSectionState extends State<ChildrenSection> {
  List<Patient> _referredPatients = [];
  List<Patient> _nurseryPatients = [];

  Patient? _selectedPatient;
  int _selectedIndex = 0;

  int _contentIndex = 0;

  @override

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    super.initState();
    _loadReferredPatients();
  }

  void _loadReferredPatients() {
    setState(() {
      _referredPatients = [
        Patient(
          name: 'علي',
          age: 10,
          diagnosis: 'نزلات برد',
          description: 'يعاني من سعال وحرارة',
        ),
        Patient(
          name: 'فاطمة',
          age: 5,
          diagnosis: 'التهاب رئوي',
          description: 'يعاني من صعوبة في التنفس',
        ),
        Patient(
          name: 'أحمد',
          age: 8,
          diagnosis: 'جروح',
          description: 'يعاني من جروح في الوجه واليدين',
        ),
      ];
    });
  }

  void _selectPatient(Patient patient) {
    setState(() {
      _selectedPatient = patient;
    });
  }

  void _admitPatient(Patient patient) {
    setState(() {
      patient.status = PatientStatus.admitted;
      _selectedPatient = null;
    });
  }

  void _requestAdditionalTests(Patient patient) {
    setState(() {
      _contentIndex = 2;
    });
  }

  void _transferToNursery(Patient patient) {
    setState(() {
      patient.status = PatientStatus.nursery;
      _nurseryPatients.add(patient);
      _referredPatients.remove(patient);
      _selectedPatient = null;
    });
  }

  void _requestAdditionalXrays(Patient patient) {
    setState(() {
      _contentIndex = 4;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _contentIndex = index;
    });
  }

  Widget _buildReferredPatientsList() {
    return
      ListView.builder(
      itemCount: _referredPatients.length,
      itemBuilder: (context, index) {
        final patient = _referredPatients[index];
        return ListTile(
          title: Text(patient.name),
          subtitle: Text(patient.diagnosis),
          onTap: () => _selectPatient(patient),
        );
      },
    );
  }

  Widget _buildNurseryPatientsList() {
    return ListView.builder(
      itemCount: _nurseryPatients.length,
      itemBuilder: (context, index) {
        final patient = _nurseryPatients[index];
        return ListTile(
          title: Text(patient.name),
          subtitle: Text('العمر: ${patient.age}'),
          onTap: () => _showPatientDetails(patient),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('قسم الأطفال',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.blue),),
      ),
      body: Container(

        child: Row(
          children: [

            Container(

              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                color: Colors.blue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),


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
                        Icons.list,
                        color: Colors.white, // لون الأيقونة أبيض
                      ),
                      label: Text(
                        'المرضى المقيمين',
                        style: TextStyle(color: Colors.white), // لون النص أبيض
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.baby_changing_station,
                        color: Colors.white, // لون الأيقونة أبيض
                      ),
                      label: Text(
                        'الحاضنة ',
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


            Expanded(
                child: _selectedIndex == 0
                    ? _buildPatientsList()
                    : _selectedIndex == 1
                        // ignore: prefer_const_constructors
                        ? AdmittedPatientsPage()
                        : _selectedIndex == 2
                            ? NurseryList(
                                children: [
                                  Child(
                                    name: 'محمد',
                                    age: 3,
                                  ),
                                  Child(
                                    name: 'فاطمة',
                                    age: 2,
                                  ),
                                  Child(
                                    name: 'علي',
                                    age: 4,
                                  ),
                                ],
                              )
                            : LoginPage()),
          ],
        ),
      ),
    );
  }

  //

  Widget _buildPatientsList() {
    return ListView.builder(
      itemCount: _referredPatients.length,
      itemBuilder: (context, index) {
        final patient = _referredPatients[index];

        return ListTile(
          title: Text(patient.name),
          subtitle: Text('العمر: ${patient.age}'),
          onTap: () => _showPatientDetails(patient),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: () => _admitPatient(patient), child: Text('قبول')),
              SizedBox(
                width: 5.5,
              ),
              ElevatedButton(
                  onPressed: () => _admitPatient(patient),
                  child: Text('طلب تحاليل اضافية')),
              SizedBox(
                width: 5.5,
              ),
              ElevatedButton(
                  onPressed: () => _admitPatient(patient),
                  child: Text('طلب تصوير اشعة ')),
              SizedBox(
                width: 5.5,
              ),
              ElevatedButton(
                  onPressed: () => _admitPatient(patient),
                  child: Text('تحويل الى الحاضنة')),
              SizedBox(
                width: 5.5,
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPatientDetails(Patient patient) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${patient.name}'),
        content: Text(
          'العمر: ${patient.age}\n'
          'التشخيص: ${patient.diagnosis}\n'
          'الوصف: ${patient.description}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('موافق'),
          ),
        ],
      ),
    );
  }
}
