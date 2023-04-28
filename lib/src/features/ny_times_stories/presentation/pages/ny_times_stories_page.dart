import 'package:flutter/material.dart';
import 'package:ny_times_stories_app_flutter/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/bloc/ny_times_stories_bloc.dart';

class NyTimesStoriesPage extends StatefulWidget {
  const NyTimesStoriesPage({Key? key}) : super(key: key);

  @override
  State<NyTimesStoriesPage> createState() => _NyTimesStoriesPageState();
}

class _NyTimesStoriesPageState extends State<NyTimesStoriesPage> {
  final NyTimesStoriesBloc _bloc = NyTimesStoriesBloc();

  // Key for scaffold to open drawer
  final GlobalKey<ScaffoldState> _key = GlobalKey();



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      scaffoldKey: _key,
      child: const Text("Stories Page"),
    );
  }
}
