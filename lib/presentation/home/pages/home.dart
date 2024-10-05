import 'package:flutter/material.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';
import 'package:spotify/presentation/home/widgets/custom_tabs.dart';
import 'package:spotify/presentation/home/widgets/home_top_card.dart';
import 'package:spotify/presentation/home/widgets/news_songs.dart';
import 'package:spotify/presentation/home/widgets/play_list.dart';
import '../widgets/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HomeTopCard(),
            CustomTabs(
              tabController: _tabController,
            ),
            Container(
              height: 260,
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth! * WidthSizeManager.s30),
              child: TabBarView(controller: _tabController, children: [
                const NewsSongs(),
                Container(),
                Container(),
                Container(),
              ]),
            ),
            const PlayList(),
          ],
        ),
      ),
    );
  }
}
