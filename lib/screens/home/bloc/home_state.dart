part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
}

class HomeState {
  final List<Data>? _posts;
  final HomeStatus _status;

  HomeState({
    List<Data>? posts,
    required HomeStatus status,
  })  : _posts = posts,
        _status = status;

  HomeStatus get status => _status;

  List<Data>? get posts => _posts;

  HomeState copyWith({
    List<Data>? posts,
    HomeStatus? status,
  }) {
    return HomeState(
      posts: posts ?? _posts,
      status: status ?? _status,
    );
  }
}
