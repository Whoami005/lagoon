import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lagoon/models/posts.dart';
import 'package:lagoon/theme/colors.dart';
import 'package:lagoon/theme/path_to_icons.dart';

class IconsItem extends StatelessWidget {
  final Data posts;

  const IconsItem({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      color: LagoonColors.white,
      padding: const EdgeInsets.only(top: 4, left: 16),
      child: Row(
        children: [
          SvgPicture.asset(LagoonIcons.heart),
          Text("${posts.likesCount}"),
          const SizedBox(width: 8),
          SvgPicture.asset(LagoonIcons.comment),
          Text("${posts.commentsCount}"),
          const SizedBox(width: 8),
          SvgPicture.asset(LagoonIcons.arrowBlack),
        ],
      ),
    );
  }
}
