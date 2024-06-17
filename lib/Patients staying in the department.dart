import 'package:flutter/material.dart';

import 'Resident patient.dart';


class Patient {
  String name;
  int age;
  String diagnosis;
  PatientStatus status = PatientStatus.admitted;
  String description;

  Patient({
    required this.name,
    required this.age,
    required this.diagnosis,
    required this.description,
  });
}

enum PatientStatus { referred, admitted, nursery }

class AdmittedPatientsPage extends StatefulWidget {
  const AdmittedPatientsPage({Key? key}) : super(key: key);

  @override
  State<AdmittedPatientsPage> createState() => _AdmittedPatientsPageState();
}

class _AdmittedPatientsPageState extends State<AdmittedPatientsPage> {
  List<Patient> _admittedPatients = [
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
    // Add more patients as needed
  ];

  /*void _viewPatientDetails(Patient patient) {
    // Navigate to the patient's health record page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PatientDetailsPage(patient: patient),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المرضى المقيمين'),
      ),
      body: ListView.builder(
        itemCount: _admittedPatients.length,
        /*  separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[300],
            thickness: 1,
          );
        },*/
        itemBuilder: (context, index) {
          final patient = _admittedPatients[index];
          return Container(
            color: index.isEven ? Colors.white : Colors.grey[200],
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patient.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'العمر: ${patient.age}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'التشخيص: ${patient.diagnosis}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResidentPatient()),
                    );
                    // Add login functionality here
                  },
                  child: Text('عرض تفاصيل المريض'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/*class PatientDetailsPage extends StatelessWidget {
  final Patient patient;

  const PatientDetailsPage({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('السجل الصحي للمريض'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              patient.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'العمر: ${patient.age}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'التشخيص: ${patient.diagnosis}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'الوصف: ${patient.description}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}*/
