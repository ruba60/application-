import 'package:flutter/material.dart';

class Child {
  final String name;
  final int age;

  final MedicalRecord? medicalRecord;

  Child({required this.name, required this.age, this.medicalRecord});
}

class MedicalRecord {
  final String childName;
  final List<Appointment> appointments;
  final List<Medication> medications;

  MedicalRecord(
      {required this.childName,
      required this.appointments,
      required this.medications});
}

class Appointment {
  final DateTime date;
  final String doctorName;
  final String description;

  Appointment(
      {required this.date,
      required this.doctorName,
      required this.description});
}

class Medication {
  final String name;
  final String dosage;
  final String instructions;

  Medication(
      {required this.name, required this.dosage, required this.instructions});
}

class NurseryList extends StatelessWidget {
  final List<Child> children;

  NurseryList({required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('قائمة أطفال الحضانة'),
      ),
      body: ListView.builder(
        itemCount: children.length,
        itemBuilder: (context, index) {
          final child = children[index];
          return ListTile(
            /*  leading: CircleAvatar(
              backgroundImage: NetworkImage(child.imageURL),
            ),*/
            title: Text(child.name),
            subtitle: Text('العمر: ${child.age} سنة'),
          );
        },
      ),
    );
  }
}

class MedicalRecordView extends StatelessWidget {
  final MedicalRecord medicalRecord;

  MedicalRecordView({required this.medicalRecord});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // عنوان "المواعيد"
        Text('المواعيد', style: Theme.of(context).textTheme.subtitle1),
        Divider(),

        // عرض قائمة المواعيد
        if (medicalRecord.appointments.isNotEmpty)
          ListView.builder(
            shrinkWrap: true, // لمنع تمدد القائمة بشكل كبير
            physics: NeverScrollableScrollPhysics(), // لمنع تمرير القائمة
            itemCount: medicalRecord.appointments.length,
            itemBuilder: (context, index) {
              final appointment = medicalRecord.appointments[index];
              return ListTile(
                title: Text(
                  '${appointment.date.day}/${appointment.date.month}/${appointment.date.year} - Dr. ${appointment.doctorName}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(appointment.description),
              );
            },
          )
        else
          Text('لا توجد مواعيد مسجلة'),

        // عنوان "الأدوية"
        Text('الأدوية', style: Theme.of(context).textTheme.subtitle1),
        Divider(),

        // عرض قائمة الأدوية
        if (medicalRecord.medications.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: medicalRecord.medications.length,
            itemBuilder: (context, index) {
              final medication = medicalRecord.medications[index];
              return ListTile(
                title: Text(medication.name),
                subtitle:
                    Text('${medication.dosage} - ${medication.instructions}'),
              );
            },
          )
        else
          Text('لا توجد أدوية مسجلة'),
      ],
    );
  }
}
