import 'package:flutter/material.dart';
import '../../utility/assets_path.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key, this.radius}) : super(key: key);

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 50.0,
      backgroundImage: AssetImage(AssetsPath.pp),
    );
  }
}
