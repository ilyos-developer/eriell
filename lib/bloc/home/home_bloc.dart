import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eriell/models/user_info.dart';
import 'package:eriell/sirvice/api_client.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetUsers) {
      yield HomeInitial();
      try {
        List<UserInfo> users = await ApiClient.getUserInfo();
        yield LoadedUsers(users);
      } catch (e) {
        print(e);
      }
    }
  }
}
