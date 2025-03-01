import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/core/utils/constants.dart';
import 'package:flutter_dev_test/core/utils/global_instances.dart';
import 'package:flutter_dev_test/screens/home/controller/cubit/home_cubit.dart';
import 'package:flutter_dev_test/theme/custom_colors.dart';
import 'package:flutter_dev_test/theme/texts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: homeCubit,
      builder: (context, HomeState state) {
        return Scaffold(
          body: Center(
            child: Text(
              menuTitles[state.index],
              style: titleText14.copyWith(color: CustomColors.secondary),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: menuTitles[0],
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: menuTitles[1],
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.logout),
                label: menuTitles[2],
              ),
            ],
            currentIndex: state.index,
            selectedItemColor: Colors.brown,
            unselectedItemColor: Colors.grey,
            onTap: homeCubit.onIndexSelect,
          ),
        );
      },
    );
  }
}
