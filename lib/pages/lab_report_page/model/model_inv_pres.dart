class ModelInvPresWithHCN {
  String? sN;
  String? tP;
  String? dT;
  String? dOCID;
  String? dOCNAME;
  String? rGID;
  String? rGNAME;
  String? tDID;
  String? tDNAME;
  String? rID;
String? mRID;
//MR_ID
  ModelInvPresWithHCN(
      {this.sN,
      this.tP,
      this.dT,
      this.dOCID,
      this.dOCNAME,
      this.rGID,
      this.rGNAME,
      this.tDID,
      this.tDNAME,
      this.rID,
      this.mRID
      });

  ModelInvPresWithHCN.fromJson(Map<String, dynamic> json) {
    sN = json['SN'];
    tP = json['TP'];
    dT = json['DT'];
    dOCID = json['DOC_ID'];
    dOCNAME = json['DOC_NAME'];
    rGID = json['RG_ID'];
    rGNAME = json['RG_NAME'];
    tDID = json['TD_ID'];
    tDNAME = json['TD_NAME'];
    rID = json['RID'];
    mRID = json['MR_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SN'] = this.sN;
    data['TP'] = this.tP;
    data['DT'] = this.dT;
    data['DOC_ID'] = this.dOCID;
    data['DOC_NAME'] = this.dOCNAME;
    data['RG_ID'] = this.rGID;
    data['RG_NAME'] = this.rGNAME;
    data['TD_ID'] = this.tDID;
    data['TD_NAME'] = this.tDNAME;
    data['RID'] = this.rID;
     data['MR_ID'] = this.mRID;
    return data;
  }
}
