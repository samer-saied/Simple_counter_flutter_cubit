final class AddState {}

final class AddInitialState extends AddState {}

final class AddLoadingState extends AddState {}

final class AddLoadedState extends AddState {
  final int times;

  AddLoadedState({required this.times});
}
