class ModelMySqlDoctor {
  String? docid;
  String? designation;
  String? speciality;
  String? image;
  String? details;

  ModelMySqlDoctor(
      {this.docid,
      this.designation,
      this.speciality,
      this.image,
      this.details});

  ModelMySqlDoctor.fromJson(Map<String, dynamic> json) {
    docid = json['docid'].toString();
    designation = json['designation'];
    speciality = json['speciality'];
    image = json['image'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['docid'] = this.docid;
    data['designation'] = this.designation;
    data['speciality'] = this.speciality;
    data['image'] = this.image;
    data['details'] = this.details;
    return data;
  }
}