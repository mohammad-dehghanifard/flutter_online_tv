class Channel{
  late String channelName;
  late String url;
  late String logo;

  Channel.fromJson(Map<String,dynamic> json){
    channelName = json['name'];
    url = json['url'];
    logo = json['logo'];
  }

}