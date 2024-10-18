import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../presentation.dart';

class ProfileCardTile extends StatelessWidget {
  const ProfileCardTile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.email,
    this.onPressed,
  });

  final String imageUrl;
  final String name;
  final String email;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
              color: context.theme.cardColor,
              borderRadius: BorderRadius.circular($styles.insets.xs)),
          padding: EdgeInsets.all($styles.insets.sm),
          child: Row(
            children: [
              CachedNetworkImage(
                width: $styles.size.size100 * 8,
                height: $styles.size.size100 * 8,
                imageUrl: imageUrl,
                placeholderFadeInDuration: $styles.time.slow,
                placeholder: (context, url) => Padding(
                  padding: EdgeInsets.all($styles.insets.sm),
                  child: const CustomCircularIndicator(),
                ),
                errorWidget: (context, url, error) {
                  String firstChar = name[0].toUpperCase();
                  return CircleAvatar(
                    radius: $styles.size.size100 * 4,
                    backgroundColor: $styles.color.getRandomColor(firstChar),
                    child: Text(
                      firstChar,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: context.textTheme.titleLarge?.color),
                    ),
                  );
                },
              ),
              ($styles.insets.xs * 1.5).toWidthSizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  ($styles.insets.xxs).toHeightSizedBox,
                  Text('($email)'),
                ],
              ),
            ],
          )),
    );
  }
}
