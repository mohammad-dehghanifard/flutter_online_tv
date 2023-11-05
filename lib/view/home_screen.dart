import 'package:flutter/material.dart';
import 'package:flutter_online_tv/controller/channel_controller.dart';
import 'package:flutter_online_tv/resources/app_colors.dart';
import 'package:flutter_online_tv/resources/dimens.dart';
import 'package:flutter_online_tv/resources/text_style.dart';
import 'package:flutter_online_tv/view/single_channel_screen.dart';
import 'package:get/get.dart';
import '../widgets/tv_channel_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChannelController channelController = Get.put(ChannelController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //logo
            Image.asset("assets/images/logo.png",scale: 5),
            // banner
            Padding(
              padding:  const EdgeInsets.all(Dimens.medium),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset("assets/images/banner.webp")),
            ),
            // TV channel title
            Container(
              width: 200,
              height: 40,
              margin: const EdgeInsets.symmetric(vertical: Dimens.small - 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.lightBlue
              ),
              child:  Center(child: Text("لیست شبکه های تلوزیون",style:AppTextStyle.titleMedium)),
            ),
            // TV channel list
            Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: Dimens.small),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24),
                    ),
                    color: AppColors.gray
                  ),
                  child: Obx(
                    () =>  GridView.builder(
                      itemCount: channelController.channels.length,
                      padding: const EdgeInsets.all(20),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 150
                      ),
                      itemBuilder: (context, index) {
                        final channel = channelController.channels[index];
                        return TvChannelItem(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  SingleChannelScreen(channel: channel)));
                          },
                          channelName: channel.channelName,
                          imageUrl: channel.logo,
                        );
                      },),
                  )
                )
            )
          ],
        ),
      ),
    );
  }
}


