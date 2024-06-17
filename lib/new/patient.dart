class PatientModel {

  Data? data;

  PatientModel({this.data});

  PatientModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? full_name;
  String? address;
  String? mothername;
  String? chain;
  String? gender;
  String? bod;
  String? caseDescription;
  String? treatmentRequired;

  Data(
      {this.full_name,
      this.address,
      this.mothername,
      this.chain,
      this.gender,
      this.bod,
      this.caseDescription,
      this.treatmentRequired});

  Data.fromJson(Map<String, dynamic> json) {
    full_name = json['fullName'];
    address = json['address'];
    mothername = json['mothername'];
    chain = json['chain'];
    gender = json['gender'];
    bod = json['bod'];
    caseDescription = json['caseDescription'];
    treatmentRequired = json['treatmentRequired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.full_name;
    data['address'] = this.address;
    data['mothername'] = this.mothername;
    data['chain'] = this.chain;
    data['gender'] = this.gender;
    data['bod'] = this.bod;
    data['caseDescription'] = this.caseDescription;
    data['treatmentRequired'] = this.treatmentRequired;
    return data;
  }
}
