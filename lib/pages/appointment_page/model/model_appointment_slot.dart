class ModelAppiontmentSlot {
  String? iD;
  String? aPPOINTMENTDATE;
  String? dOCTORID;
  String? aPPOINTMENTTIME;
  String? dAYS;
  String? mONTHS;
  String? mONTHNAME;
  String? yEARS;

  ModelAppiontmentSlot(
      {this.iD,
      this.aPPOINTMENTDATE,
      this.dOCTORID,
      this.aPPOINTMENTTIME,
      this.dAYS,
      this.mONTHS,
      this.mONTHNAME,
      this.yEARS});

  ModelAppiontmentSlot.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    aPPOINTMENTDATE = json['APPOINTMENT_DATE'];
    dOCTORID = json['DOCTOR_ID'];
    aPPOINTMENTTIME = json['APPOINTMENT_TIME'];
    dAYS = json['DAYS'];
    mONTHS = json['MONTHS'];
    mONTHNAME = json['MONTH_NAME'];
    yEARS = json['YEARS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['APPOINTMENT_DATE'] = this.aPPOINTMENTDATE;
    data['DOCTOR_ID'] = this.dOCTORID;
    data['APPOINTMENT_TIME'] = this.aPPOINTMENTTIME;
    data['DAYS'] = this.dAYS;
    data['MONTHS'] = this.mONTHS;
    data['MONTH_NAME'] = this.mONTHNAME;
    data['YEARS'] = this.yEARS;
    return data;
  }
}
