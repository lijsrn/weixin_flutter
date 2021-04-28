
class Chat {
  final String imageUrl;
  final String name;
  final String message;

  const Chat({this.imageUrl,this.name,this.message});

  //工厂构造函数，返回一个对象，类似单例，直接负责返回对象
  factory Chat.fromJson(Map json){
    return Chat(
      name: json["name"],
      imageUrl: json["imageUrl"],
      message: json["message"],
    );
  }
}