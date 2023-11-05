import 'package:flutter/material.dart';
import 'package:flutter_online_tv/resources/text_style.dart';
import '../resources/app_colors.dart';
import '../resources/dimens.dart';

class TvChannelItem extends StatelessWidget {
  const TvChannelItem({
    super.key, required this.imageUrl, required this.channelName, required this.onTap,
  });
  final String imageUrl;
  final String channelName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // logo
          Container(
            padding: const EdgeInsets.all(Dimens.large),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.scaffoldBg,
            ),
            child: Image.network(imageUrl,width: 65,),
          ),
          const SizedBox(height: Dimens.medium),
          // text
          Text(channelName,style: AppTextStyle.subTitle)
        ],
      ),
    );
  }
}