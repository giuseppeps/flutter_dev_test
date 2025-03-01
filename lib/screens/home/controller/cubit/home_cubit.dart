import 'package:bloc/bloc.dart';
import 'package:flutter_dev_test/routes/app_routes.dart';
import 'package:flutter_dev_test/routes/routes.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.empty());

  void onIndexSelect(int index) {
    if (index == 2) {
      router.go(Routes.login);
    }
    emit(state.copyWith(index: index));
  }
}
