import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddPatientController {
  var status;
  var token;
  var serverUrl = "http://127.0.0.1:8000";
  void addPatientData(
      int id,
    String fullName,
    String address,
    DateTime dob,
    String momName,
    String gender,
    int chain,
    String caseDescription,
    String treatmentRequired,
  ) async {
    print(id);
    print(fullName);
    print(address);
    print(dob);
    print(momName);
    print(gender);
    print(chain);
    print(caseDescription);
    print(treatmentRequired);

    String myUrl = "$serverUrl/api/patient/add";

    var response;
    try {
      response = await http.post(
        Uri.parse(myUrl),
        body: {
          "id":id,
          "full_name": fullName,
          "address": address,
          "date_of_birth": dob,
          "mom_name": momName,
          "chain": chain,
          "gender": gender,
          "case_description": caseDescription,
          "treatment_required": treatmentRequired,
        },
        headers: {
          'token' : 'eyJpZCI6MiwibmFtZSI6IkFtYnVsYW5jZSIsImNyZWF0ZWRfYXQiOiIyMDI0LTA1LTI4VDE5OjQ4OjIwLjAwMDAwMFoiLCJ1cGRhdGVkX2F0IjoiMjAyNC0wNS0yOFQxOTo0ODoyMC4wMDAwMDBaIn0=',
          'Accept': 'application/json',
        },
      );

      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
    } catch (error) {
      print('error: $error');
    }

    status = response.body.contains('errors');
    print('status is: $status');
    var data = json.decode(response.body);
    print('data is $data');
    print(data['token']);
    print(token);

    if (status) {
      print('data: ${data["error"]}');
    } else {
      print('data: ${data["token"]}');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', '${data["token"]}');
    }
  }
}
