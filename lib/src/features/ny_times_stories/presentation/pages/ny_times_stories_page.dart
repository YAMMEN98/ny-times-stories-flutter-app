import 'package:flutter/material.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/widgets/custom_app_bar_widget.dart';
import 'package:ny_times_stories_app_flutter/src/core/translations/l10n.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/helper.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/bloc/ny_times_stories_bloc.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/widgets/story_card_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NyTimesStoriesPage extends StatefulWidget {
  const NyTimesStoriesPage({Key? key}) : super(key: key);

  @override
  State<NyTimesStoriesPage> createState() => _NyTimesStoriesPageState();
}

class _NyTimesStoriesPageState extends State<NyTimesStoriesPage> {
  NyTimesStoriesBloc _bloc = NyTimesStoriesBloc();

  // Key for scaffold to open drawer
  GlobalKey<ScaffoldState> _key = GlobalKey();

  // Refresh controller for list view
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    // Call event to get ny times article
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      scaffoldKey: _key,
      withDrawer: true,
      child: Column(
        children: [
          // Custom App Bar
          CustomAppBarWidget(
            title: Text(
              S.of(context).ny_times_most_popular,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            leading: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                _key.currentState!.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: 20,
              ),
            ),
            actions: [
              // Search
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(
                  Icons.search,
                  size: 20,
                ),
              ),
            ],
          ),

          // Space
          SizedBox(
            height: Helper.getVerticalSpace(),
          ),

          // List of stories
          Expanded(
            child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: false,
                header: WaterDropHeader(
                  waterDropColor: Theme.of(context).cardColor,
                ),
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: null,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return StoryCardWidget();
                  },
                )),
          )
        ],
      ),
    );
  }

  // Refresh method called when pull down list
  void _onRefresh() async {
    _refreshController.requestRefresh();
  }
}
