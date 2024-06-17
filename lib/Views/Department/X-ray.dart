import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class XRay extends StatelessWidget {
  const XRay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
          ),
          onPressed: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        title: const Text(
          'قسم الأشعة',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              width: 700,
              margin: const EdgeInsets.only(top: 120, left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  30.0,
                ),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  label: Text('search'),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 1168,
                        height: 2500,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 1168,
                                height: 62.25,
                                decoration:
                                    BoxDecoration(color: Color(0xFFF7F6FE)),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        height: 100,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 1160,
                                              height: 500,
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    left: 26,
                                                    top: 16,
                                                    child: Text(
                                                      'الإسم',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 162,
                                                    top: 16,
                                                    child: SizedBox(
                                                      width: 109,
                                                      child: Text(
                                                        'الكنية',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          height: 0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 292,
                                                    top: 15,
                                                    child: SizedBox(
                                                      width: 116,
                                                      child: Text(
                                                        'رقم الهاتف',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          height: 0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 500,
                                                    top: 16,
                                                    child: SizedBox(
                                                      width: 116,
                                                      child: Text(
                                                        'الموعد',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          height: 0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 248,
                              child: Container(
                                width: 1168,
                                height: 62.25,
                                decoration:
                                    BoxDecoration(color: Color(0xFFF7F6FE)),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 26,
                                      top: 23.50,
                                      child: Text(
                                        'Darlene',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 162,
                                      top: 23.50,
                                      child: Text(
                                        'Robertson',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 292,
                                      top: 22.50,
                                      child: Text(
                                        '+91 9876543210',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 464,
                                      top: 23.50,
                                      child: Text(
                                        '13-Aug-2023 at 10:00 AM',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 882,
                                      top: 18,
                                      child: Positioned(
                                        left: 882,
                                        top: 9.75,
                                        child: Container(
                                          width: 92,
                                          height: 40,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          child: ElevatedButton(

                                            onPressed: () {},
                                            child: Icon(
                                              Icons.done,
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 1020,
                                      top: 13.50,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Icon(
                                          color: Colors.red,
                                          Icons.delete,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 123.50,
                              child: Container(
                                width: 1168,
                                height: 62.25,
                                decoration:
                                    BoxDecoration(color: Color(0xFFF7F6FE)),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 26,
                                      top: 23.50,
                                      child: Text(
                                        'Leslie',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 162,
                                      top: 23.50,
                                      child: Text(
                                        'Alexander',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 292,
                                      top: 22.50,
                                      child: Text(
                                        '+91 9876543210',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 464,
                                      top: 23.50,
                                      child: Text(
                                        '13-Aug-2023 at 10:00 AM',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 882,
                                      top: 18,
                                      child: Positioned(
                                        left: 882,
                                        top: 9.75,
                                        child: Container(
                                          width: 92,
                                          height: 40,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.done,
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 1020,
                                      top: 13.50,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 372.50,
                              child: Container(
                                width: 1168,
                                height: 62.25,
                                decoration:
                                    BoxDecoration(color: Color(0xFFF7F6FE)),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 26,
                                      top: 23.50,
                                      child: Text(
                                        'Kathryn',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 162,
                                      top: 23.50,
                                      child: Text(
                                        'Murphy',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 292,
                                      top: 22.50,
                                      child: Text(
                                        '+91 9876543210',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 464,
                                      top: 23.50,
                                      child: Text(
                                        '13-Aug-2023 at 10:00 AM',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 882,
                                      top: 18,
                                      child: Positioned(
                                        left: 882,
                                        top: 9.75,
                                        child: Container(
                                          width: 92,
                                          height: 40,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.done,
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 1020,
                                      top: 13.50,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 61.25,
                              child: Container(
                                width: 1168,
                                height: 62.25,
                                decoration: BoxDecoration(color: Colors.white),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 26,
                                      top: 23.50,
                                      child: Text(
                                        'Cameron',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 162,
                                      top: 23.50,
                                      child: Text(
                                        'Williamson',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 292,
                                      top: 22.50,
                                      child: Text(
                                        '+91 9876543210',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 464,
                                      top: 23.50,
                                      child: Text(
                                        '13-Aug-2023 at 10:00 AM',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 882,
                                      top: 18,
                                      child: Positioned(
                                        left: 882,
                                        top: 9.75,
                                        child: Container(
                                          width: 92,
                                          height: 40,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.done,
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 1020,
                                      top: 13.50,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 310.25,
                              child: Container(
                                width: 1168,
                                height: 62.25,
                                decoration: BoxDecoration(color: Colors.white),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 26,
                                      top: 23.50,
                                      child: Text(
                                        'Ronald',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 162,
                                      top: 23.50,
                                      child: Text(
                                        'Richards',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 292,
                                      top: 22.50,
                                      child: Text(
                                        '+91 9876543210',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 464,
                                      top: 23.50,
                                      child: Text(
                                        '13-Aug-2023 at 10:00 AM',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 882,
                                      top: 18,
                                      child: Positioned(
                                        left: 882,
                                        top: 9.75,
                                        child: Container(
                                          width: 92,
                                          height: 40,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.done,
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 1020,
                                      top: 13.50,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 185.75,
                              child: Container(
                                width: 1168,
                                height: 62.25,
                                decoration: BoxDecoration(color: Colors.white),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 26,
                                      top: 23.50,
                                      child: Text(
                                        'Savannah',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 162,
                                      top: 23.50,
                                      child: Text(
                                        'Nguyen',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 292,
                                      top: 22.50,
                                      child: Text(
                                        '+91 9876543210',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 464,
                                      top: 23.50,
                                      child: Text(
                                        '13-Aug-2023 at 10:00 AM',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 882,
                                      top: 18,
                                      child: Positioned(
                                        left: 882,
                                        top: 9.75,
                                        child: Container(
                                          width: 92,
                                          height: 40,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.done,
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 1020,
                                      top: 13.50,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 434.75,
                              child: Container(
                                width: 1168,
                                height: 62.25,
                                decoration: BoxDecoration(color: Colors.white),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 26,
                                      top: 23.50,
                                      child: Text(
                                        'Darrell',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 162,
                                      top: 23.50,
                                      child: Text(
                                        'Steward',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 292,
                                      top: 22.50,
                                      child: Text(
                                        '+91 9876543210',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 464,
                                      top: 23.50,
                                      child: Text(
                                        '13-Aug-2023 at 10:00 AM',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 882,
                                      top: 18,
                                      child: Positioned(
                                        left: 882,
                                        top: 9.75,
                                        child: Container(
                                          width: 92,
                                          height: 40,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.done,
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 1020,
                                      top: 13.50,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                height: 800,
                width: 1500,
                margin: const EdgeInsets.only(top: 1, left: 10),
                padding: EdgeInsets.all(150),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
