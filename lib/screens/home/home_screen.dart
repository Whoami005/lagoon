import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lagoon/screens/home/bloc/home_cubit.dart';
import 'package:lagoon/screens/home/widgets/app_bar.dart';
import 'package:lagoon/screens/home/widgets/comment_item.dart';
import 'package:lagoon/screens/home/widgets/description_text.dart';
import 'package:lagoon/screens/home/widgets/icon_item.dart';
import 'package:lagoon/screens/home/widgets/image_item.dart';
import 'package:lagoon/screens/home/widgets/recommendations_item.dart';
import 'package:lagoon/screens/home/widgets/story_item.dart';
import 'package:lagoon/screens/home/widgets/user_item.dart';
import 'package:lagoon/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.initial) {
            context.read<HomeCubit>().getPosts();
          }
          if (state.status == HomeStatus.loaded) {
            return Scaffold(
              body: SafeArea(
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) => [
                    const HomeAppBar(),
                    StoryItem(posts: state.posts!),
                  ],
                  physics: const BouncingScrollPhysics(),
                  body: RefreshIndicator(
                    color: LagoonColors.orange,
                    onRefresh: () async {
                      context.read<HomeCubit>().getPosts();
                    },
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        const RecommendationsItem(),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return Column(
                              children: [
                                if (state.posts![index].photos![0].format !=
                                    "video/mp4") ...[
                                  Container(
                                    height: 2,
                                    color: LagoonColors.orange,
                                  ),
                                  UserItem(posts: state.posts![index]),
                                  ImageItem(posts: state.posts![index]),
                                  IconsItem(posts: state.posts![index]),
                                  DescriptionTextWidget(
                                      posts: state.posts![index]),
                                  const CommentItem(),
                                ]
                              ],
                            );
                          }, childCount: state.posts!.length),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
