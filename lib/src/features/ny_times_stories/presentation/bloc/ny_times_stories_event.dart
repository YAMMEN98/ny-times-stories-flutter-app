part of 'ny_times_stories_bloc.dart';

abstract class NyTimesStoriesEvent {
  const NyTimesStoriesEvent();
}

// On getting Ny times Event
class OnGettingNyTimesStoriesEvent extends NyTimesStoriesEvent {

}

// On searching Event
class OnSearchingStoriesEvent extends NyTimesStoriesEvent {
  final String text;

  OnSearchingStoriesEvent(
    this.text,
  );
}
