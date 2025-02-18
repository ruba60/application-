
import 'package:flutter/material.dart';



class MainViewEquipmentInventory extends StatefulWidget {
  const MainViewEquipmentInventory({super.key});

  @override
  State<MainViewEquipmentInventory> createState() => _MainViewEquipmentInventoryState();
}

class _MainViewEquipmentInventoryState extends State<MainViewEquipmentInventory> {
  List<Equipment> equipment = [
    Equipment('قطن', 'Used to treat pain and fever.', 50, DateTime(2023, 12, 31), 'samsoung',),
    Equipment('شاش طبي', 'Used to treat bacterial infections.', 30, DateTime(2024, 6, 30), 'samsoung',),
    Equipment('لصاقات طبية', 'Used to treat allergies.', 20, DateTime(2023, 8, 15), 'samsoung' ,),
  ];



  List<Equipment> filteredEquipment = [];

  TextEditingController searchEquipmentController = TextEditingController();
  TextEditingController name_Equipment_Controller = TextEditingController();
  TextEditingController description_Equipment_Controller = TextEditingController();
  TextEditingController quantity_Equipment_Controller = TextEditingController();
  TextEditingController expiryDate_Equipment_Controller = TextEditingController();
  TextEditingController company_Equipment_Controller = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey();


  @override
  void initState() {
    filteredEquipment = equipment;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('مستودع الأدوية '),
      //   backgroundColor: Colors.cyan,
      // ),
      body: Column(
        children: [

          Container(
            // padding: EdgeInsets.all(50),
            padding: EdgeInsets.symmetric(vertical: 15 , horizontal: 50 ),
            child: TextFormField(
              controller: searchEquipmentController,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                label: Text('البحث عن مستلزم طبي'),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),

              onChanged: (value) {
                setState(() {
                  filteredEquipment = equipment
                      .where((drug) =>
                      drug.name.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),

          // TextField(
          //   controller: searchController,
          //   decoration: InputDecoration(
          //     labelText: 'Search for a drug',
          //   ),
          //   onChanged: (value) {
          //     setState(() {
          //       filteredDrugs = drugs
          //           .where((drug) =>
          //           drug.name.toLowerCase().contains(value.toLowerCase()))
          //           .toList();
          //     });
          //   },
          // ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10 ,horizontal: 40),
              itemCount: equipment.length,
              itemBuilder: (context, index) {
                return Container(
                  color: index % 2 == 0 ? Colors.grey[100] : Colors.white,
                  child: ListTile(
                    title: Text(equipment[index].name),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('الوصف: ${equipment[index].description}'),
                        Text('الكمية: ${equipment[index].quantity}'),
                        Text('تاريخ الانتهاء: ${equipment[index].expiryDate.toString()}'),
                        Text('الشركة المصنعة : ${equipment[index].company}'),

                      ],

                    ),
                    trailing:IconButton (
                      icon: Icon(Icons.mode_edit_outline_outlined),
                      onPressed: (){

                      },
                    ),
                    // onTap: () {
                    //   // Edit drug functionality goes here
                    //   // You can show a dialog or navigate to a new screen to edit the drug details
                    // },

                  ),
                );

              },

            ),
          ),
        ],
      ),
      // ... (الكود السابق)

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {

              return AlertDialog(
                title:const Text('إضافة مادة جديدة '),
                content:  Container(
                  width:MediaQuery.of(context).size.width * 0.4,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _globalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: name_Equipment_Controller,
                            decoration: const InputDecoration(labelText: 'الاسم '),

                          ),
                          TextField(
                            controller: description_Equipment_Controller,

                            decoration: InputDecoration(labelText: 'الوصف'),

                          ),
                          TextField(
                            controller: quantity_Equipment_Controller,
                            decoration: const InputDecoration(labelText: 'الكمية '),
                            keyboardType: TextInputType.number,
                          ),
                          TextField(
                            controller: expiryDate_Equipment_Controller,
                            decoration:const InputDecoration(labelText: 'تاريخ الانتهاء(YYYY-MM-DD)'),
                            keyboardType: TextInputType.datetime,

                          ),
                          TextField(
                            controller: company_Equipment_Controller,
                            decoration: InputDecoration(labelText: 'الشركة المصنعة'),

                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('إلغاء'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('إضافة'),
                    onPressed: () {

                      setState(() {
                        equipment.add(Equipment(
                          name_Equipment_Controller.text,
                          description_Equipment_Controller.text,
                          int.parse(quantity_Equipment_Controller.text),
                          DateTime.parse(expiryDate_Equipment_Controller.text),
                          company_Equipment_Controller.text,
                        ));
                        filteredEquipment = equipment;
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),

// ... (الكود السابق)

    );
  }
}
class Equipment {
  String name;
  String description;
  int quantity;
  DateTime expiryDate;
  String company ;

  Equipment(this.name, this.description, this.quantity, this.expiryDate, this.company );
}
