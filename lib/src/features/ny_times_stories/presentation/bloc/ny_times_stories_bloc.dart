import 'package:bloc/bloc.dart';
import 'package:ny_times_stories_app_flutter/src/core/network/error/failures.dart';
import 'package:ny_times_stories_app_flutter/src/core/util/injections.dart';
import 'package:ny_times_stories_app_flutter/src/features/ny_times_stories/domain/usecases/ny_times_stories_usecase.dart';

part 'ny_times_stories_event.dart';

part 'ny_times_stories_state.dart';

class NyTimesStoriesBloc
    extends Bloc<NyTimesStoriesEvent, NyTimesStoriesState> {
  late StoriesUseCase nyTimesUseCase;

  NyTimesStoriesBloc() : super(LoadingGetNyTimesStoriesState()) {
    nyTimesUseCase = sl<StoriesUseCase>();

    on<OnGettingNyTimesStoriesEvent>(_onGettingNyTimesEvent);
  }

  // Getting ny times event
  _onGettingNyTimesEvent(OnGettingNyTimesStoriesEvent event,
      Emitter<NyTimesStoriesState> emitter) async {
    emitter(LoadingGetNyTimesStoriesState());

    final result = await nyTimesUseCase.call(
      StoriesParams(""),
    );
    result.fold((l) {
        emitter(ErrorGetNyTimesStoriesState(l.errorMessage));
    }, (r) {
      // Return list of stories with filtered by search text
      emitter(SuccessGetNyTimesStoriesState([]));
    });
  }
}
