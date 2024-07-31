import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';

class TitleList extends StatelessWidget {
  const TitleList({
    super.key,
    required this.title,
    this.showSeeAll = false, this.onPressSeeAll,
  });
  final String title;
  final bool showSeeAll;
  final Function()? onPressSeeAll;

  @override
  Widget build(BuildContext context) {
    return showSeeAll
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              GestureDetector(
                onTap: onPressSeeAll,
                child: Text(
                  StringConstants.seeAll,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
              )
            ],
          )
        : Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          );
  }
}
