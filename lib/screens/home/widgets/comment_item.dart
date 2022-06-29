import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lagoon/theme/colors.dart';
import 'package:lagoon/theme/path_to_icons.dart';
import 'package:lagoon/theme/text_style.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        SvgPicture.asset(LagoonIcons.lagoon),
        const SizedBox(width: 7),
        SizedBox(
          width: 200,
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Комментировать...",
                hintStyle: LagoonTextStyle.title13(LagoonColors.lightGrey)),
          ),
        ),
      ],
    );
  }
}
