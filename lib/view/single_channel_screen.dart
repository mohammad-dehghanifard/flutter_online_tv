import 'package:flutter/material.dart';
import 'package:flutter_online_tv/controller/channel_controller.dart';
import 'package:flutter_online_tv/models/channel_model.dart';
import 'package:flutter_online_tv/resources/app_colors.dart';
import 'package:get/get.dart';
import '../resources/dimens.dart';
import '../resources/text_style.dart';
import '../widgets/linear_channel_item.dart';

class SingleChannelScreen extends StatelessWidget {
  const SingleChannelScreen({super.key, required this.channel});
  final Channel channel;

  @override
  Widget build(BuildContext context) {
    final ChannelController channelController = Get.put(ChannelController());
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              // video player
              Container(
                width: double.infinity,
                height: 250,
                color: AppColors.gray,
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
                      Image.network(channel.logo,width: 120,),
                      Text(channel.channelName,style: AppTextStyle.subTitle.copyWith(fontWeight: FontWeight.w700,fontSize: 18),)
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
          ),
        ),
      ),
    );
  }
}


