import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lagoon/models/posts.dart';
import 'package:lagoon/theme/colors.dart';
import 'package:lagoon/theme/path_to_icons.dart';
import 'package:lagoon/theme/text_style.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserItem extends StatelessWidget {
  final Data posts;

  const UserItem({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListTile(
        horizontalTitleGap: 6,
        enabled: false,
        dense: true,
        minVerticalPadding: 0,
        minLeadingWidth: 0,
        leading: SizedBox(
          width: 22,
          height: 22,
          child: posts.author!.avatar != null
              ? CircleAvatar(
                  backgroundImage: NetworkImage(posts.author!.avatar!.path!),
                )
              : CircleAvatar(
                  child: SvgPicture.asset(LagoonIcons.unknownBig),
                ),
        ),
        title: Text(
          "@${posts.author!.username!}",
          style: LagoonTextStyle.title14bold(LagoonColors.grey),
        ),
        trailing: Text(
          timeago.format(
            posts.updatedAt ?? posts.createdAt!,
            locale: 'ru',
          ),
          style: LagoonTextStyle.title10(LagoonColors.lightGrey),
        ),
      ),
    );
  }
}
