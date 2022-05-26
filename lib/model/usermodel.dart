class UserModel {
 late String id ,name,email,pass;

  UserModel({required this.id, required this.name, required this.email, required this.pass});

  UserModel.fromJson(Map<dynamic,dynamic> map){
    if(map==null){
      return;
    }
    id=map['id'];
    name=map['name'];
    email=map['email'];
    // pic=map['pic'];
    pass=map['pass'];
  }
  toJson(){
    return{
    'id':id,
    'name':name,
    'email':email,
    // 'pic':pic,
    'pass':pass,

    };
  }
}