class Agency{
  String Name;
  String profile;
  String Email;
  String uid;
  Agency({
    required this.Name,
    required this.Email,
    required this.profile,
    required this.uid,
  });
  factory Agency.fromJson(Map<String,dynamic> json){
    return Agency(Name: json['name'], Email: json['Email'], profile: json['profile'], uid: json['uid']);
  }
}