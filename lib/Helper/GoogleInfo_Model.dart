class googleInfo{
  final String email;
  final String name;
  final String image;

  googleInfo({
     this.email,
     this.name,
     this.image
  });

  googleInfo.fromMap(Map<dynamic , dynamic>  res)
      : email = res["email"],
        name = res["Name"],
        image = res["image"];

  Map<String, Object> toMap(){
    return {
      'email' : email,
      'Name' :name,
      'image' : image,
    };
  }
}
