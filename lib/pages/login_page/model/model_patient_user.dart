class ModelPatitentUser {
  String? hCN;
  String? pATNAME;
  String? fNAME;
  String? mNAME;
  String? sPOUSENAME;
  String? gUARDIANNAME;
  String? dOB;
  String? sEX;
  String? rELIGION;
  String? bLOODGRP;
  String? mARITALSTATUS;
  String? nID;
  String? eMAIL;
  String? cELLPHONE;
  String? hOMEPHONE;
  String? hOVIARRD;
  String? pOSTCODE;
  String? tHANACODE;
  String? dISTRICTCODE;
  String? cOUNTRY;
  String? eCONTPERSON;
  String? eADDRESS;
  String? eCELLPHONE;
  String? eRELWITHPAT;
  String? cORPORATEID;
  String? iMAGE;

  ModelPatitentUser(
      {this.hCN,
      this.pATNAME,
      this.fNAME,
      this.mNAME,
      this.sPOUSENAME,
      this.gUARDIANNAME,
      this.dOB,
      this.sEX,
      this.rELIGION,
      this.bLOODGRP,
      this.mARITALSTATUS,
      this.nID,
      this.eMAIL,
      this.cELLPHONE,
      this.hOMEPHONE,
      this.hOVIARRD,
      this.pOSTCODE,
      this.tHANACODE,
      this.dISTRICTCODE,
      this.cOUNTRY,
      this.eCONTPERSON,
      this.eADDRESS,
      this.eCELLPHONE,
      this.eRELWITHPAT,
      this.cORPORATEID,
      this.iMAGE});

  ModelPatitentUser.fromJson(Map<String, dynamic> json) {
    hCN = json['HCN'];
    pATNAME = json['PAT_NAME'];
    fNAME = json['FNAME'];
    mNAME = json['MNAME'];
    sPOUSENAME = json['SPOUSE_NAME'];
    gUARDIANNAME = json['GUARDIAN_NAME'];
    dOB = json['DOB'];
    sEX = json['SEX'];
    rELIGION = json['RELIGION'];
    bLOODGRP = json['BLOOD_GRP'];
    mARITALSTATUS = json['MARITAL_STATUS'];
    nID = json['NID'];
    eMAIL = json['EMAIL'];
    cELLPHONE = json['CELL_PHONE'];
    hOMEPHONE = json['HOME_PHONE'];
    hOVIARRD = json['HO_VI_AR_RD'];
    pOSTCODE = json['POST_CODE'];
    tHANACODE = json['THANA_CODE'];
    dISTRICTCODE = json['DISTRICT_CODE'];
    cOUNTRY = json['COUNTRY'];
    eCONTPERSON = json['E_CONT_PERSON'];
    eADDRESS = json['E_ADDRESS'];
    eCELLPHONE = json['E_CELL_PHONE'];
    eRELWITHPAT = json['E_REL_WITH_PAT'];
    cORPORATEID = json['CORPORATE_ID'];
    iMAGE = json['IMAGE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HCN'] = this.hCN;
    data['PAT_NAME'] = this.pATNAME;
    data['FNAME'] = this.fNAME;
    data['MNAME'] = this.mNAME;
    data['SPOUSE_NAME'] = this.sPOUSENAME;
    data['GUARDIAN_NAME'] = this.gUARDIANNAME;
    data['DOB'] = this.dOB;
    data['SEX'] = this.sEX;
    data['RELIGION'] = this.rELIGION;
    data['BLOOD_GRP'] = this.bLOODGRP;
    data['MARITAL_STATUS'] = this.mARITALSTATUS;
    data['NID'] = this.nID;
    data['EMAIL'] = this.eMAIL;
    data['CELL_PHONE'] = this.cELLPHONE;
    data['HOME_PHONE'] = this.hOMEPHONE;
    data['HO_VI_AR_RD'] = this.hOVIARRD;
    data['POST_CODE'] = this.pOSTCODE;
    data['THANA_CODE'] = this.tHANACODE;
    data['DISTRICT_CODE'] = this.dISTRICTCODE;
    data['COUNTRY'] = this.cOUNTRY;
    data['E_CONT_PERSON'] = this.eCONTPERSON;
    data['E_ADDRESS'] = this.eADDRESS;
    data['E_CELL_PHONE'] = this.eCELLPHONE;
    data['E_REL_WITH_PAT'] = this.eRELWITHPAT;
    data['CORPORATE_ID'] = this.cORPORATEID;
    data['IMAGE'] = this.iMAGE;
    return data;
  }
}
