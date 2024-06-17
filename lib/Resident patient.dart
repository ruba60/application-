import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResidentPatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.black,
              ),
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            title: const Text(
              'ملف المريض',
              style: TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w900,
              ),
            ),
            centerTitle: true),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: 100, left: 50, right: 50, bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        ':زمرة الدم',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 75,
                                        width: 600,
                                      ),
                                      Text(
                                        ':الجنس',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            ':اسم المريض ',
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 70,
                                            width: 50,
                                          ),
                                          Text(
                                            ':تاريخ الدخول',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    height: 210,
                    width: 865,
                    // margin: const EdgeInsets.only(top: 30, left: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 20, left: 40, right: 30, bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 2),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '   السجل الطبي ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue.shade600,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  height: 90,
                                  width: 750,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(50),
                                          child: TextFormField(
                                            keyboardType: TextInputType.name,
                                            decoration: InputDecoration(
                                              fillColor: Colors.grey.shade100,
                                              filled: true,
                                              label: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(': الوصف'),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                    height: 210,
                    width: 865,
                    // margin: const EdgeInsets.only(top: 30, left: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 20, left: 30, right: 30, bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [],
                              ),
                              Row(children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                ),
                              ]),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'طلب عملية جراحية',
                              style: const TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                            width: 60,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'طلب تصوير شعاعي',
                              style: const TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                            width: 60,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'طلب تحاليل',
                              style: const TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                            width: 60,
                          ),
                        ],
                      ),
                    ),

                    height: 210,
                    width: 865,
                    // margin: const EdgeInsets.only(top: 30, left: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                width: 50,
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: 90, left: 10, right: 10, bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
    showDialog(
    context: context,
    builder: (context) => const RequestDialog(
    typeOfRequest: "emergency tests"));

                                            },
                                            icon: Icon(Icons.add),
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 15,

                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.edit),
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 15,

                                          ),
                                          Text(
                                            'جدول الأدوية',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 300,
                                    margin: const EdgeInsets.only(
                                        top: 30, left: 10),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 20),
                                      child: DataTable(

                                          headingRowColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) =>
                                                      Colors.teal.shade300),

                                          columns: [
                                            DataColumn(label: Text("الجرعة",)),

                                            DataColumn(label: Text("الاسم")),
                                          ],

                                          rows: [

                                            DataRow(cells: [
                                              DataCell(
                                                   Text("كل 6 ساعات")),
                                              DataCell(Text(" سيتامول")),
                                            ]),

                                            DataRow(cells: [
                                              DataCell(Text("كل 8 ساعات")),
                                              DataCell(Text("بروفين")),
                                            ]),
                                          ]),
                                    ),
                                    height: 600,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 5,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    height: 800,
                    width: 500,
                    // margin: const EdgeInsets.only(top: 30, left: 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class RequestDialog extends StatefulWidget {
  final String typeOfRequest;
  const RequestDialog({super.key, required this.typeOfRequest});

  @override
  State<RequestDialog> createState() => _RequestDialogState();
}

class _RequestDialogState extends State<RequestDialog> {
  final GlobalKey<FormState> _globalKey = GlobalKey();
  String? medicamentname;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: AlertDialog(

        title: const Text('أدخل اسم الدواء'),

        content: TextFormField(
          onSaved: (value) => medicamentname = value,
          validator: (value) {

          },

        ),


        actions: <Widget>[
          ElevatedButton(

            child: const Text(
              'add',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            onPressed: () {
              _globalKey.currentState!.save();
              if (_globalKey.currentState!.validate()) {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
