import 'package:flutter/material.dart';
import '../models/channel_model.dart';
import '../resources/app_colors.dart';
import '../resources/dimens.dart';
import '../view/single_channel_screen.dart';

class LinearChannelItem extends StatelessWidget {
  const LinearChannelItem({
    super.key,
    required this.channel, required this.index,
  });

  final Channel channel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder:(context) => SingleChannelScreen(channel: channel)));
      },
      child: Container(
        margin:  EdgeInsets.fromLTRB(
          Dimens.medium,
          index == 0? Dimens.large : Dimens.small,
          Dimens.medium,
          Dimens.medium,),
        padding: const EdgeInsets.symmetric(horizontal: Dimens.medium),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppGradiant.yellowGradiant,
            ),
            borderRadius: BorderRadius.circular(16)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(channel.logo,width: 30),
            Text(channel.channelName),
          ],
        ),
      ),
    );
  }
}