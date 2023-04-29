import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/injections.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/domain/usecases/ny_times_stories_usecase.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/providers/stories/state/stories_notifier.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/providers/stories/state/stories_state.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/providers/stories_section/state/stories_section_notifier.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/presentation/providers/stories_section/state/stories_section_state.dart';


final storiesSectionStateNotifierProvider =
    StateNotifierProvider<StoriesSectionNotifier, StoriesSectionState>(
  (ref) {
    return StoriesSectionNotifier();
  },
);
