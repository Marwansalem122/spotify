import 'package:flutter/material.dart';
import 'package:spotify/common/widget/custom_app_bar_general.dart';
import 'package:spotify/controllers/profile_controller.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/height_size_manager.dart';
import 'package:spotify/presentation/profile/widgets/custom_favorite_songs.dart';
import 'package:spotify/presentation/profile/widgets/custom_top_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s21),
              CustomAppBarGeneral(
                title: "Profile",
                icon: Icons.more_vert,
                onTap: () {
                  ProfileController().navigateToHomePage(context);
                },
              ),
              const CustomTopProfile(),
              const CustomFavoriteSongs()
            ],
          ),
        ),
      ),
    );
  }
}
