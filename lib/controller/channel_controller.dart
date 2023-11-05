import 'package:flutter_online_tv/services/web_service.dart';
import 'package:get/get.dart';
import '../models/channel_model.dart';

class ChannelController extends GetxController{

//================================ Variables ===================================
  RxList<Channel> channels = RxList();
  final WebService _webService = WebService();

//================================ Methods =====================================

  Future<void> _fetchChannelData() async {
    final response = await _webService.getMethod("https://hitaldev.ir/channels");
    response.data["data"].forEach((channel) => channels.add(Channel.fromJson(channel)));
  }

//================================ life cycle ==================================
  @override
  void onInit() {
    _fetchChannelData();
    super.onInit();
  }
}