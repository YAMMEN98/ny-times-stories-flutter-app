import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/widgets/app_loader.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/widgets/custom_app_bar_widget.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/widgets/reload_widget.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/widgets/text_field_widget.dart';
import 'package:ny_times_stories_app_flutter/src/core/translations/l10n.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/helper/helper.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/helper/helper_ui.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/entities/section_story_enum.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/providers/stories/stories_providers.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/providers/stories_section/stories_section__providers.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/widgets/story_card_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StoriesPage extends StatefulWidget {
  static const String routeName = 'DashboardScreen';

  const StoriesPage({Key? key}) : super(key: key);

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  // Key for scaffold to open drawer
  GlobalKey<ScaffoldState> _key = GlobalKey();

  // Search text field
  TextEditingController _searchController = TextEditingController();
  FocusNode _searchFocusNode = FocusNode();

  // Refresh controller for list view
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      // ref
      //     .read(storiesStateNotifierProvider.notifier)
      //     .getStories(StoriesParams("word"));
    });

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
            leading: Expanded(
              child: Row(
                children: [
                  // Search
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
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

                        SizedBox(
                          width: 5.w,
                        ),

                        // Search
                        Expanded(
                          child: TextFieldWidget(
                            controller: _searchController,
                            focusNode: _searchFocusNode,
                            hintText: S.of(context).search,
                            onChanged: (value) {},
                            suffixIcon: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () {
                                setState(() {
                                  _searchController.clear();
                                });
                              },
                              icon: Icon(
                                Icons.close,
                                size: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    width: Helper.getVerticalSpace(),
                  ),

                  // Filter
                  Consumer(
                    builder: (_, ref, __) {

                      return GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          late Function(void Function()) showUpperSheetState;
                          HelperUi.showUpperSheetModal(
                            context,
                            [
                              StatefulBuilder(builder: (context, setState) {
                                showUpperSheetState = setState;
                                return _buildFilterWidgets(showUpperSheetState);
                              }),
                            ],
                            reset: () {},
                            confirm: () {
                              ref
                                  .read(
                                      storiesSectionStateNotifierProvider.notifier)
                                  .changeStoriesSection(
                                    StorySectionEnum.tMagazine,
                                  );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            IconButton(
                              constraints: BoxConstraints(),
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: Icon(
                                Icons.filter_alt,
                              ),
                            ),
                            Text(
                              S.of(context).filter,
                              style: Theme.of(context).textTheme.bodyLarge,
                            )
                          ],
                        ),
                      );
                    }
                  )
                ],
              ),
            ),
            actions: [
              IconButton(
                constraints: BoxConstraints(),
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(
                  Icons.format_list_bulleted,
                ),
              ),
              IconButton(
                constraints: BoxConstraints(),
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(
                  Icons.grid_view_rounded,
                ),
              ),
            ],
          ),

          // Space
          SizedBox(
            height: Helper.getVerticalSpace(),
          ),

          // Stories, Loading and Error Widget
          Consumer(
              builder: (_, ref, __) {
                final storiesState = ref.watch(storiesStateNotifierProvider);

                return Expanded(
                child: storiesState.maybeMap(
                  loading: (value) {
                    return const AppLoader();
                  },
                  success: (value) {
                    return _buildStories(context);
                  },
                  failure: (value) {
                    return ReloadWidget.error(
                      content: value.error,
                      onPressed: () {},
                    );
                  },
                  orElse: () {
                    return Text("UnSupported Widget");
                  },
                ),
              );
            }
          ),

          Consumer(
              builder: (_, ref, __) {
                final storiesSectionState = ref.watch(storiesSectionStateNotifierProvider);

                return Expanded(
                  child: storiesSectionState.maybeMap(
                    changedStorySection: (value) {
                      print(value.sectionStoryEnum);
                      return Text("aaaaaa");
                    },
                    orElse: () {
                      return Text("UnSupported Widget");
                    },
                  ),
                );
              }
          ),



        ],
      ),
    );
  }

// Stories, Loading and Error Widget
  _buildStories(BuildContext context) {
    return SmartRefresher(
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
        ));
  }

  // Refresh method called when pull down list
  void _onRefresh() async {
    _refreshController.requestRefresh();
  }

  Widget _buildFilterWidgets(showUpperSheetState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Movie type title
        Text(
          S.of(context).section,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),

        SizedBox(
          height: 10.h,
        ),

        DropdownSearch<StorySectionEnum>(
          items: StorySectionEnum.values,
          itemAsString: (StorySectionEnum u) => u.section,
          onChanged: (StorySectionEnum? data) => print(data),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: S.of(context).search_by_section,
            ),
          ),
        ),

        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
