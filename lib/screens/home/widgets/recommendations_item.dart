import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lagoon/theme/path_to_icons.dart';
import 'package:lagoon/theme/text_style.dart';

class RecommendationsItem extends StatelessWidget {
  const RecommendationsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 44,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Text(
                  "Рекомендации",
                  textAlign: TextAlign.center,
                  style: LagoonTextStyle.title17bold(),
                ),
              ),
            ),
            SvgPicture.asset(LagoonIcons.arrowTop),
            const SizedBox(width: 13),
          ],
        ),
      ),
    );
  }
}
