class googleInfo{
  final String email;
  final String name;
  final String image;

  googleInfo({
     this.email,
     this.name,
     this.image
  });

  /*Cart.fromMap(Map<dynamic,dynamic>res,
      this.productId,
      this.Name,
      this.image)
  :id=res['id'];*/

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
