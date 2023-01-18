class UserModel {
  dynamic id;
  dynamic name;
  dynamic department;
  dynamic email;
  dynamic contact;
  dynamic leave;
  dynamic present;
  dynamic absent;
  dynamic totalClasses;
  dynamic imgurl;

  UserModel(
      {this.id,
      this.name,
      this.department,
      this.email,
      this.contact,
      this.leave,
      this.present,
      this.absent,
      this.totalClasses,
      this.imgurl});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    department = json['department'];
    email = json['email'];
    contact = json['contact'];
    leave = json['leave'];
    present = json['present'];
    absent = json['absent'];
    totalClasses = json['total classes'];
    imgurl = json['imgurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['department'] = this.department;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['leave'] = this.leave;
    data['present'] = this.present;
    data['absent'] = this.absent;
    data['total classes'] = this.totalClasses;
    data['imgurl'] = this.imgurl;
    return data;
  }
}
