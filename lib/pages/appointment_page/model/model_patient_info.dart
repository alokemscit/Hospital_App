class ModelPatientInfo {
  String? pATNAME;
  String? sEX;
  String? cELLPHONE;
  String? dAYS;
  String? mONTHS;
  String? yEARS;
  String? bLOODGRP;
  String? dOB;

  ModelPatientInfo(
      {this.pATNAME,
      this.sEX,
      this.cELLPHONE,
      this.dAYS,
      this.mONTHS,
      this.yEARS,
      this.bLOODGRP,
      this.dOB});

  ModelPatientInfo.fromJson(Map<String, dynamic> json) {
    pATNAME = json['PAT_NAME'];
    sEX = json['SEX'];
    cELLPHONE = json['CELL_PHONE'];
    dAYS = json['DAYS'];
    mONTHS = json['MONTHS'];
    yEARS = json['YEARS'];
    bLOODGRP = json['BLOOD_GRP'];
    dOB = json['DOB'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PAT_NAME'] = this.pATNAME;
    data['SEX'] = this.sEX;
    data['CELL_PHONE'] = this.cELLPHONE;
    data['DAYS'] = this.dAYS;
    data['MONTHS'] = this.mONTHS;
    data['YEARS'] = this.yEARS;
    data['BLOOD_GRP'] = this.bLOODGRP;
    data['DOB'] = this.dOB;
    return data;
  }
}
