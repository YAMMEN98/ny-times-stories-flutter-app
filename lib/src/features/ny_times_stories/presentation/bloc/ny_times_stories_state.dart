part of 'ny_times_stories_bloc.dart';

abstract class NyTimesStoriesState {
  const NyTimesStoriesState();
}

class NyTimesInitial extends NyTimesStoriesState {}

// --------------------Start Get Ny Times States-------------------- //

// Loading Get Ny Times State
class LoadingGetNyTimesStoriesState extends NyTimesStoriesState {}

// Error On Getting Ny Times State
class ErrorGetNyTimesStoriesState extends NyTimesStoriesState {
  final String errorMsg;

  ErrorGetNyTimesStoriesState(this.errorMsg);
}

// Success Get Ny Times State
class SuccessGetNyTimesStoriesState extends NyTimesStoriesState {
  final List<String> nyTimesStories;

  SuccessGetNyTimesStoriesState(this.nyTimesStories);
}

