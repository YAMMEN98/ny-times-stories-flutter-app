import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/widgets/app_loader.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/widgets/custom_app_bar_widget.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/widgets/divider_bottom_sheet_widget.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/widgets/reload_widget.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/widgets/text_field_widget.dart';
import 'package:ny_times_stories_app_flutter/src/core/styles/app_colors.dart';
import 'package:ny_times_stories_app_flutter/src/core/translations/l10n.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/helper/helper.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/helper/helper_ui.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/entities/section_story_enum.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/data/entities/story_model.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/domain/usecases/ny_times_stories_usecase.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/providers/search/search_providers.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/providers/stories/stories_providers.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/widgets/story_card_grid_item_widget.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/widgets/story_card_list_item_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StoriesPage extends ConsumerStatefulWidget {
  static const String routeName = 'DashboardScreen';

  const StoriesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends ConsumerState<StoriesPage> {
  // Key for scaffold to open drawer
  GlobalKey<ScaffoldState> _key = GlobalKey();

  // Search text field
  TextEditingController _searchController = TextEditingController();
  FocusNode _searchFocusNode = FocusNode();

  // Refresh controller for list view
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  // Selected story section
  StorySectionEnum selectedStorySection = StorySectionEnum.home;
  StorySectionEnum tempStorySection = StorySectionEnum.home;

  // Grid/List View
  bool isListView = true;

  OutlineInputBorder defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      color: AppColors.gray,
      width: 1,
    ),
  );

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _getStories();
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
                            size: 20.sp,
                          ),
                        ),

                        SizedBox(
                          width: 5.w,
                        ),

                        // Search
                        Expanded(child: Consumer(
                          builder: (context, ref, child) {
                            final searchState =
                                ref.watch(searchStateNotifierProvider);
                            return searchState.maybeMap(
                              openSearch: (value) {
                                return TextFieldWidget(
                                  controller: _searchController,
                                  focusNode: _searchFocusNode,
                                  hintText: S.of(context).search,
                                  onChanged: (value) {
                                    if (value != null) {
                                      _getSearchedStories(value.trim());
                                    } else {
                                      _getSearchedStories("");
                                    }
                                  },
                                  suffixIcon: IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                    onPressed: () {
                                      setState(() {
                                        _searchFocusNode.unfocus();
                                        _searchController.clear();
                                        _getSearchedStories("");
                                        ref
                                            .read(searchStateNotifierProvider
                                                .notifier)
                                            .closeSearch();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      size: 20.sp,
                                    ),
                                  ),
                                );
                              },
                              closeSearch: (value) {
                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                    onPressed: () {
                                      setState(() {
                                        ref
                                            .read(searchStateNotifierProvider
                                                .notifier)
                                            .openSearch();
                                        _searchFocusNode.requestFocus();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.search,
                                      size: 20.sp,
                                    ),
                                  ),
                                );
                              },
                              orElse: () {
                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                    onPressed: () {
                                      setState(() {
                                        ref
                                            .read(searchStateNotifierProvider
                                                .notifier)
                                            .openSearch();
                                        _searchFocusNode.requestFocus();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.search,
                                      size: 20.sp,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ))
                      ],
                    ),
                  ),

                  SizedBox(
                    width: Helper.getVerticalSpace(),
                  ),

                  // Filter
                  GestureDetector(
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
                        reset: () {
                          selectedStorySection = StorySectionEnum.home;
                          tempStorySection = selectedStorySection;
                          showUpperSheetState(() {});
                        },
                        confirm: () {
                          selectedStorySection = tempStorySection;
                          _getStories();
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.filter_alt,
                          size: 20.sp,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          S.of(context).filter,
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: _buildActions(),
          ),

          // Space
          SizedBox(
            height: Helper.getVerticalSpace(),
          ),

          // Stories, Loading and Error Widget
          Consumer(builder: (_, ref, __) {
            final storiesState = ref.watch(storiesStateNotifierProvider);

            return Expanded(
              child: storiesState.maybeMap(
                initial: (value) {
                  return const AppLoader();
                },
                loading: (value) {
                  return const AppLoader();
                },
                success: (value) {
                  _refreshController.refreshCompleted(
                    resetFooterState: true,
                  );
                  if (value.stories.isEmpty) {
                    return ReloadWidget.empty(
                      content: S.of(context).no_data,
                      onPressed: () {
                        _getStories();
                      },
                    );
                  }

                  if (isListView) {
                    return _buildListStories(
                      context,
                      value.stories,
                    );
                  } else {
                    return _buildGridViewStories(
                      context,
                      value.stories,
                    );
                  }
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
          }),
        ],
      ),
    );
  }

// Stories grid view, Loading and Error Widget
  _buildListStories(BuildContext context, List<StoryModel> stories) {
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
          itemCount: stories.length,
          itemBuilder: (context, index) {
            return StoryCardListItemWidget(model: stories[index]);
          },
        ));
  }

  // Stories list , Loading and Error Widget
  _buildGridViewStories(BuildContext context, List<StoryModel> stories) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      header: WaterDropHeader(
        waterDropColor: Theme.of(context).cardColor,
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: null,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.3),
            mainAxisExtent: 250.h),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return StoryCardGridItemWidget(
            model: stories[index],
          );
        },
      ),
    );
  }

  // Refresh method called when pull down list
  void _onRefresh() async {
    _refreshController.requestRefresh();
    _getStories();
  }

  // Build actions in app bar
  List<Widget> _buildActions() {
    return [

      // List view
        CircleAvatar(
          backgroundColor:isListView? Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.5):AppColors.transparent,
          child: IconButton(
            constraints: BoxConstraints(),
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                isListView = true;
              });
            },
            icon: Icon(
              Icons.format_list_bulleted,
              color: isListView?Theme.of(context).scaffoldBackgroundColor:Theme.of(context).iconTheme.color,
              size: 20.sp,
            ),
          ),
        ),

      // Grid view
      CircleAvatar(
        backgroundColor:!isListView? Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.5):AppColors.transparent,
        child: IconButton(
          constraints: BoxConstraints(),
          padding: EdgeInsets.zero,
          onPressed: () {
            setState(() {
              isListView = false;
            });
          },
          icon: Icon(
            Icons.grid_view_rounded,
            color: !isListView?Theme.of(context).scaffoldBackgroundColor:Theme.of(context).iconTheme.color,
            size: 20.sp,
          ),
        ),
      ),
    ];
  }

  // Filter widget to filtering on stories
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

        _buildSearchDropdown(showUpperSheetState),

        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }

  // Dropdown search for story section
  _buildSearchDropdown(showUpperSheetState) {
    return DropdownSearch<StorySectionEnum>(
      enabled: true,
      items: StorySectionEnum.values,
      selectedItem: tempStorySection,
      itemAsString: (StorySectionEnum u) => u.section,
      onChanged: (StorySectionEnum? data) {
        print(data);
        if (data != null) {
          showUpperSheetState(() {
            tempStorySection = data;
          });
        }
      },
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: Theme.of(context).textTheme.bodyLarge,
        dropdownSearchDecoration: InputDecoration(
          border: defaultBorder,
          focusedBorder: defaultBorder,
          enabledBorder: defaultBorder,
          labelText: S.of(context).search_by_section,
          labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.gray,
              ),
        ),
      ),
      popupProps: PopupProps.modalBottomSheet(
        itemBuilder: (context, item, isSelected) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 15,
            ),
            child: Text(
              item.section,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        },
        showSearchBox: true,
        title: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 15,
          ),
          child: Column(
            children: [
              DividerBottomSheetWidget(
                width: ScreenUtil().screenWidth * 0.25,
              ),
              SizedBox(
                height: Helper.getVerticalSpace(),
              ),
              Text(
                S.of(context).search_by_section,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            hintText: S.of(context).search,
            hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.gray,
                ),
            border: defaultBorder,
            focusedBorder: defaultBorder,
            enabledBorder: defaultBorder,
          ),
        ),
        modalBottomSheetProps: ModalBottomSheetProps(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      ),
    );
  }

  // Get all stories
  void _getStories() {
    ref.read(storiesStateNotifierProvider.notifier).getStories(
          StoriesParams(selectedStorySection.section),
          text: _searchController.text.trim(),
        );
  }

  // Get stories after apply search
  void _getSearchedStories(String text) {
    ref.read(storiesStateNotifierProvider.notifier).getSearchedStories(text);
  }
}
