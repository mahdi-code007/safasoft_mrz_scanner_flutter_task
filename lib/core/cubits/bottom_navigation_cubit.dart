import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';

class AppBottomNavigationCubit extends Cubit<int> {
  AppBottomNavigationCubit() : super(0);

  final List<Widget> screens = [const HomePage(), const HomePage()];

  void updateIndex(int index) => emit(index);
}
