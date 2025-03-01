part of 'home_cubit.dart';

class HomeState {
  final int index;

  HomeState(this.index);

  HomeState copyWith({
    int? index,
  }) {
    return HomeState(
      index ?? this.index,
    );
  }

  factory HomeState.empty() {
    return HomeState(0);
  }
}
