import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/utils/image_path.dart';
import 'package:flutter_svg/svg.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 21,
          child: SvgPicture.asset(ImagePath.logoVectorUp),
        ),
        Positioned(
          bottom: 21,
          child: SvgPicture.asset(ImagePath.logoVectorDown),
        ),
        Image.asset(ImagePath.logo, height: 222),
      ],
    );
  }
}
