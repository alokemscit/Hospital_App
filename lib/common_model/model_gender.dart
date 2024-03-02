class ModelGenderMaster {
  String? iD;
  String? nAME;

  ModelGenderMaster({this.iD, this.nAME});

  ModelGenderMaster.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAME = json['NAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAME'] = this.nAME;
    return data;
  }
}
