import 'package:flutter/material.dart';

class Dash extends StatelessWidget {
  const Dash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.supervised_user_circle,
                                        size: 26.0,
                                        color: Color.fromARGB(255, 62, 72, 209),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Text(
                                        "المرضى",
                                        style: TextStyle(
                                            fontSize: 26.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "200 مريض",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 62, 72, 209),
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.medication,
                                        size: 26.0,
                                        color: Color.fromARGB(255, 9, 160, 140),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Text(
                                        "الاطباء",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 8, 148, 129),
                                            fontSize: 26.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "15 طبيب",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 11, 121, 34),
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.notes,
                                        size: 26.0,
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Text(
                                        "االاقسام",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 235, 115, 18),
                                            fontSize: 26.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "22 قسم",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 235, 115, 18),
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "200 مريض",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 28.0),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "4 مرضى جدد",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 101, 180, 245)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 250.0,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "البحث عن مريض ",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                              ),
                              suffixIcon: Icon(Icons
                                  .search), // يمكنك استبدال "Icons.search" بأيقونة بحث أخرى
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.supervised_user_circle,
                            color: Colors.deepPurple.shade400,
                          ),
                          label: Text(
                            "مرضى اليوم ",
                            style: TextStyle(color: Colors.deepPurple.shade400),
                          ),
                        ),
                        /* Row(
                          children: [
                            DropdownButton(
                                hint: Text("Filter by"),
                                items: [
                                  DropdownMenuItem(
                                    value: "Date",
                                    child: Text("Date"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Comments",
                                    child: Text("Comments"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Views",
                                    child: Text("Views"),
                                  ),
                                ],
                                onChanged: ((value) {})),
                            SizedBox(
                              width: 20.0,
                            ),*/

                        /*  DropdownButton(
                                hint: Text("Order by"),
                                items: [
                                  DropdownMenuItem(
                                    value: "Date",
                                    child: Text("Date"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Comments",
                                    child: Text("Comments"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Views",
                                    child: Text("Views"),
                                  ),
                                ],
                                onChanged: ((value) {})),*/
                        /* ],
                        ),*/
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DataTable(
                            headingRowColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.grey.shade200),
                            columns: [
                              DataColumn(label: Text("ID")),
                              DataColumn(label: Text("الاسم")),
                              DataColumn(label: Text("القسم")),
                              DataColumn(label: Text("التاريخ")),
                              DataColumn(label: Text("الطبيب لمسؤول")),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(const Text("1234")),
                                DataCell(Text(" اا")),
                                DataCell(Text("قلبية")),
                                DataCell(Text("${DateTime.now()}")),
                                DataCell(Text("د.ب")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1235")),
                                DataCell(Text("اب")),
                                DataCell(Text("عظمية")),
                                DataCell(Text("${DateTime.now()}")),
                                DataCell(Text("د.ا")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1236")),
                                DataCell(Text("س")),
                                DataCell(Text("قلبية")),
                                DataCell(Text("${DateTime.now()}")),
                                DataCell(Text("د.ن")),
                              ]),
                            ]),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text("1",
                                    style:
                                        TextStyle(color: Colors.deepPurple))),
                            TextButton(
                                onPressed: () {},
                                child: Text("2",
                                    style:
                                        TextStyle(color: Colors.deepPurple))),
                            TextButton(
                                onPressed: () {},
                                child: Text("3",
                                    style:
                                        TextStyle(color: Colors.deepPurple))),
                            TextButton(
                                onPressed: () {},
                                child: Text("4",
                                    style:
                                        TextStyle(color: Colors.deepPurple))),
                            TextButton(
                                onPressed: () {},
                                child: Text("5",
                                    style:
                                        TextStyle(color: Colors.deepPurple))),
                            TextButton(
                                onPressed: () {},
                                child: Text("6",
                                    style:
                                        TextStyle(color: Colors.deepPurple))),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
