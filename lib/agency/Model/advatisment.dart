class Ad{
 final  String image_ad;
  Ad({required this.image_ad});
   factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
        image_ad: json['image_ad']
    );
  }
}