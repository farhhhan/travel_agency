class AgencyModel {
  String name;
  String email;
  String uid;
  String profile;

  AgencyModel({
    required this.name,
    required this.email,
    required this.uid,
    required this.profile,
  });

  factory AgencyModel.fromJson(Map<String, dynamic> json) {
    return AgencyModel(
      name: json['Name'], 
      email: json['Email'],
      uid: json['uid'],
      profile: json['profile'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name; 
    data['Email'] = this.email;
    data['uid'] = this.uid;
    data['profile'] = this.profile;
    return data;
  }
}
