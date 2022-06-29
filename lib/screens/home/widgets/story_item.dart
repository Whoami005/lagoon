import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lagoon/models/posts.dart';
import 'package:lagoon/theme/path_to_icons.dart';
import 'package:lagoon/theme/text_style.dart';

class StoryItem extends StatelessWidget {
  final List<Data> _posts;

  const StoryItem({Key? key, required List<Data> posts})
      : _posts = posts,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 95,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int index) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8, left: 8),
                  width: 68,
                  height: 68,
                  child: _posts[index].author!.avatar != null
                      ? CircleAvatar(
                          backgroundImage:
                              NetworkImage(_posts[index].author!.avatar!.path!),
                        )
                      : CircleAvatar(
                          child: SvgPicture.asset(LagoonIcons.unknownBig),
                        ),
                ),
                Text(
                  "@${_posts[index].author!.username!}",
                  style: LagoonTextStyle.title12bold(),
                )
              ],
            );
          },
          itemCount: _posts.length,
        ),
      ),
    );
  }
}
