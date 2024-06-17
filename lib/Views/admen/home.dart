
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Doctor> doctors = [
    Doctor("دكتور أحمد", "0123456789", "الباطنة"),
    Doctor("دكتورة سارة", "0123456879", "الأطفال"),
    Doctor("دكتور محمد", "0123456780", "الجراحة"),
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController specialtyController = TextEditingController();

  bool isEditing = false;
  int editingIndex = -1;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    specialtyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body:   Column(
        children: [
          Container(
   margin: const EdgeInsets.only(top: 50, left: 70),
            width: 1000,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'ابحث عن قسم',
                      border: InputBorder.none,


                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search,color: Colors.teal,),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          
        ],
    ),

    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: buildSearchTextField(),
    );
  }

  TextField buildSearchTextField() {
    return TextField(
      decoration: InputDecoration(hintText: "ابحث عن طبيب..."),
      onChanged: (value) {
        setState(() {
          // implement search functionality
        });
      },
    );
  }

  Widget buildDoctorsList() {
    // Filter doctors based on search query
    List<Doctor> filteredDoctors = doctors.where((doctor) {
      String searchTerm = nameController.text.toLowerCase();
      return doctor.name.toLowerCase().contains(searchTerm);
    }).toList();

    return ListView.builder(
      itemCount: filteredDoctors.length,
      itemBuilder: (context, index) {
        return buildDoctorTile(filteredDoctors[index], index);
      },
    );
  }

  Widget buildDoctorTile(Doctor doctor, int index) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    doctor.phone,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.0),
            Text(
              doctor.specialty,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(width: 16.0),
            buildDoctorActionsButtons(doctor, index),
          ],
        ),
      ),
    );
  }

  Row buildDoctorActionsButtons(Doctor doctor, int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildEditButton(doctor, index),
        SizedBox(width: 8.0),
        buildDeleteButton(index),
      ],
    );
  }

  IconButton buildEditButton(Doctor doctor, int index) {
    return IconButton(
      icon: Icon(Icons.edit),
      color: Colors.blue,
      onPressed: () {
        setState(() {
          isEditing = true;
          editingIndex = index;
          nameController.text = doctor.name;
          phoneController.text = doctor.phone;
          specialtyController.text = doctor.specialty;
        });
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("تعديل معلومات الطبيب"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  buildTextField("اسم الطبيب", nameController),
                  buildTextField("رقم الهاتف", phoneController),
                  buildTextField("التخصص", specialtyController),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    doctors[editingIndex] = Doctor(
                      nameController.text,
                      phoneController.text,
                      specialtyController.text,
                    );
                    isEditing = false;
                    editingIndex = -1;
                    nameController.clear();
                    phoneController.clear();
                    specialtyController.clear();
                  });
                  Navigator.pop(context);
                },
                child: Text("حفظ"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    doctors.removeAt(index);
                    Navigator.pop(context);
                  });
                },
                child: Text("حذف"),
              ),
            ],
          ),
        );
      },
    );
  }

  IconButton buildDeleteButton(int index) {
    return IconButton(
      icon: Icon(Icons.delete),
      color: Colors.red,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("تأكيد الحذف"),
            content: Text("هل أنت متأكد أنك تريد حذف هذا الطبيب؟"),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    doctors.removeAt(index);
                    Navigator.pop(context);
                  });
                },
                child: Text("حذف"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("إلغاء"),
              ),
            ],
          ),
        );
      },
    );
  }

  FloatingActionButton buildAddDoctorButton() {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("إضافة طبيب جديد"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  buildTextField("اسم الطبيب", nameController),
                  buildTextField("رقم الهاتف", phoneController),
                  buildTextField("التخصص", specialtyController),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    doctors.add(
                      Doctor(
                        nameController.text,
                        phoneController.text,
                        specialtyController.text,
                      ),
                    );
                    nameController.clear();
                    phoneController.clear();
                    specialtyController.clear();
                  });
                  Navigator.pop(context);
                },
                child: Text("إضافة"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("إلغاء"),
              ),
            ],
          ),
        );
      },
      child: Icon(Icons.add),
    );
  }

  TextFormField buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
class Doctor {
  final String name;
  final String phone;
  final String specialty;

  Doctor(this.name, this.phone, this.specialty);
}
