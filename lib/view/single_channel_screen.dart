import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_tv/controller/channel_controller.dart';
import 'package:flutter_online_tv/models/channel_model.dart';
import 'package:flutter_online_tv/resources/app_colors.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../resources/dimens.dart';
import '../resources/text_style.dart';
import '../widgets/linear_channel_item.dart';

class SingleChannelScreen extends StatefulWidget {
  const SingleChannelScreen({super.key, required this.channel});
  final Channel channel;

  @override
  State<SingleChannelScreen> createState() => _SingleChannelScreenState();
}

class _SingleChannelScreenState extends State<SingleChannelScreen> {
  final ChannelController channelController = Get.put(ChannelController());

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  void playVideo(){
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.channel.url))
      ..initialize().then((value) {
        chewieController = ChewieController(
            videoPlayerController: videoPlayerController!,
            isLive: true
        );
        setState(() {

        });
      });
  }

  @override
  void initState() {
    playVideo();
    super.initState();
  }

  @override
  void dispose() {
   chewieController?.dispose();
    videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: GetBuilder<ChannelController>(
            builder: (controller) {
              return Column(
                children: [
                  // video player
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: chewieController == null? const CircularProgressIndicator() : Chewie(controller: chewieController!),
                  ),
                  //title and logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 200,
                        height: 40,
                        margin: const EdgeInsets.all(Dimens.medium),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.lightBlue
                        ),
                        child:  Center(child: Text("لیست شبکه های تلوزیون",style:AppTextStyle.titleMedium)),
                      ),

                      Column(
                        children: [
                          Image.network(widget.channel.logo,width: 120,),
                          Text(widget.channel.channelName,style: AppTextStyle.subTitle.copyWith(fontWeight: FontWeight.w700,fontSize: 18),)
                        ],
                      )
                    ],
                  ),
                  // more channel list
                  Expanded(
                      child: Obx(
                              () => ListView.builder(
                            itemCount: channelController.channels.length,
                            itemBuilder: (BuildContext context, int index) {
                              final data = channelController.channels[index];
                              return LinearChannelItem(index: index,channel: data);
                            },
                          )
                      )
                  )
                ],
              );
            },
          )
        ),
      ),
    );
  }
}


