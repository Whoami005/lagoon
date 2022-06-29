import 'package:flutter/material.dart';
import 'package:lagoon/models/posts.dart';
import 'package:lagoon/theme/colors.dart';
import 'package:lagoon/theme/text_style.dart';
import 'package:readmore/readmore.dart';

class DescriptionTextWidget extends StatelessWidget {
  final Data posts;

  const DescriptionTextWidget({Key? key, required this.posts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ReadMoreText(
        posts.description!,
        trimLines: 2,
        style: LagoonTextStyle.title14(LagoonColors.black),
        colorClickableText: LagoonColors.lightGrey,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'more',
        trimExpandedText: ' less',
      ),
    );
  }
}
