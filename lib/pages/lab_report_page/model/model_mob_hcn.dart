class ModelPatWithHCN {
  String? hCN;
  String? pATNAME;
  String? iD;

  ModelPatWithHCN({this.hCN, this.pATNAME,this.iD});

  ModelPatWithHCN.fromJson(Map<String, dynamic> json) {
    hCN = json['HCN'];
    pATNAME = json['PAT_NAME'];
    iD = json['ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HCN'] = this.hCN;
    data['PAT_NAME'] = this.pATNAME;
     data['ID'] = this.iD;
    return data;
  }
}
