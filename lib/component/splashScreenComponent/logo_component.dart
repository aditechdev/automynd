import 'package:automynd/const/resource.dart';
import 'package:flutter/material.dart';

class LogoComponent extends StatelessWidget {
  const LogoComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      R.ASSETS_LOGO_AUTO_MYND_LOGO_PNG,
      height: 120,
      fit: BoxFit.cover,
      width: 120,
    );
  }
}
