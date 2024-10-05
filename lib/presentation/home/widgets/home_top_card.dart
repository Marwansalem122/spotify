import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/assets_manager.dart';
import 'package:spotify/core/resourses/height_size_manager.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';

class HomeTopCard extends StatelessWidget {
  const HomeTopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: SizeConfig.screenHeight! * HeightSizeManager.s188,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  width: SizeConfig.screenWidth! * WidthSizeManager.s400,
                  AssetsManager.homeTopCard,
                  fit: BoxFit.cover,
                )),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 80),
                  child: Image.asset(
                    AssetsManager.homeArtistImage,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
