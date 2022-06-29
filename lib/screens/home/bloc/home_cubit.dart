import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lagoon/models/posts.dart';
import 'package:lagoon/repositories/posts_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final PostsRepository _postsRepository;

  HomeCubit({required PostsRepository postsRepository})
      : _postsRepository = postsRepository,
        super(HomeState(status: HomeStatus.initial));

  Future getPosts() async {
    emit(state.copyWith(status: HomeStatus.loading));
    final response = await _postsRepository.fetchPosts();
    emit(state.copyWith(status: HomeStatus.loaded, posts: response));
  }
}
