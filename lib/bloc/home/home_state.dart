part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadedUsers extends HomeState {
  final List<UserInfo> userList;

  LoadedUsers(this.userList);
}
