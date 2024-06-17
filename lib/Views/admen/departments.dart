import 'package:flutter/material.dart';

class Department {
  final String name;
  String password;

  Department(this.name, this.password);
}

class AddDepartmentScreen extends StatefulWidget {
  const AddDepartmentScreen({super.key});

  @override

  _AddDepartmentScreenState createState() => _AddDepartmentScreenState();
}

class _AddDepartmentScreenState extends State<AddDepartmentScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  List<Department> departments = [
    Department('قسم 1', 'password1'),
    Department('قسم 2', 'password2'),
    Department('قسم 3', 'password3'),
  ];
  List<Department> searchResults = [];

  void searchDepartment(String searchTerm) {
    setState(() {
      searchResults = departments
          .where((department) =>
              department.name.contains(searchTerm) ||
              department.password.contains(searchTerm))
          .toList();
    });
  }

  void editPassword(int index) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController newPasswordController =
            TextEditingController(text: searchResults[index].password);
        return AlertDialog(
          title: Text('تعديل كلمة السر'),
          content: TextField(
            controller: newPasswordController,
            decoration: const InputDecoration(
              labelText: 'كلمة السر الجديدة',
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  searchResults[index].password = newPasswordController.text;
                  departments[departments.indexOf(searchResults[index])]
                      .password = newPasswordController.text;
                });
                Navigator.pop(context);
              },
              child: Text('حفظ'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(''),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 500,
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
                      onChanged: searchDepartment,
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
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(searchResults[index].name),
                    subtitle: Text(searchResults[index].password),
                    trailing: ElevatedButton(
                      onPressed: () {
                        editPassword(index);
                      },
                      child: Text('تعديل'),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                  backgroundColor:Colors.cyan,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('إضافة قسم جديد'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                labelText: 'اسم القسم',
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            TextField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                labelText: 'كلمة السر',
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue.shade700),
                            ),
                            onPressed: () {
                              String departmentName = nameController.text;
                              String password = passwordController.text;
                              setState(() {
                                departments
                                    .add(Department(departmentName, password));
                                searchResults = departments;
                              });
                              Navigator.pop(context);
                            },
                            child: const Text('إضافة'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Icon(Icons.add,color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
