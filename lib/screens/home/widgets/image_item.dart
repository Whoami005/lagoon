import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lagoon/models/posts.dart';
import 'package:lagoon/theme/colors.dart';
import 'package:lagoon/theme/path_to_icons.dart';
import 'package:lagoon/theme/text_style.dart';

class ImageItem extends StatelessWidget {
  final Data posts;

  const ImageItem({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.network(
            "${posts.photos![0].path}",
          ),
        ),
        Container(
          height: 28,
          padding: const EdgeInsets.symmetric(
            vertical: 4,
          ),
          width: double.infinity,
          color: LagoonColors.orange,
          child: Row(
            children: [
              const SizedBox(width: 16),
              SvgPicture.asset(
                LagoonIcons.lagoon,
                color: LagoonColors.white,
              ),
              const SizedBox(width: 5),
              Text(
                "Рекомендация",
                style: LagoonTextStyle.title14bold(
                  LagoonColors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
