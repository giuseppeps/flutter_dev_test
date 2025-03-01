import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_test/routes/app_routes.dart';
import 'package:flutter_dev_test/theme/custom_colors.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;

  const BaseScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final bool canPop = ModalRoute.of(context)?.canPop ?? false;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: canPop
              ? IconButton(
                  icon: const Icon(
                    CupertinoIcons.back,
                    color: CustomColors.brown400,
                  ),
                  onPressed: router.pop,
                )
              : null,
          backgroundColor: CustomColors.white400,
        ),
        body: SingleChildScrollView(child: child),
      ),
    );
  }
}
