import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/bottom_navigation_cubit.dart';

class AppBottomNavigation extends StatelessWidget {


  const AppBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppBottomNavigationCubit, int>(
        builder: (context, currentIndex) {
          return context.watch<AppBottomNavigationCubit>().screens[currentIndex];
        },
      ),
      bottomNavigationBar: BlocBuilder<AppBottomNavigationCubit, int>(
        builder: (context, currentIndex) {
          return BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              context.read<AppBottomNavigationCubit>().updateIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.scanner), label: 'Solution 1'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.scanner), label: 'Solution 2'),
            ],
          );
        },
      ),
    );
  }
}