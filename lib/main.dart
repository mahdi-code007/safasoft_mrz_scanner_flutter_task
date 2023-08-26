import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:safasoft_mrz_scanner_flutter_task/core/utils/constants.dart';
import 'package:safasoft_mrz_scanner_flutter_task/features/solution1/persentation/pages/stored_result_screen_solution1.dart';
import 'package:safasoft_mrz_scanner_flutter_task/features/solution1/persentation/cubits/scan_cubit_solution1.dart';
import 'package:safasoft_mrz_scanner_flutter_task/features/solution2/persentation/cubits/scan_cubit_solution2.dart';

import 'core/cubits/bottom_navigation_cubit.dart';
import 'core/models/mrz_model_solution1.dart';
import 'core/models/mrz_model_solution2.dart';
import 'core/widgets/app_bottom_navigation.dart';
import 'features/solution1/persentation/pages/scan_mrz_page_solution1.dart';
import 'features/solution2/persentation/pages/stored_result_screen_solution2.dart';
import 'features/solution2/persentation/pages/scan_mrz_page_solution2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(MRZModelSolution1Adapter());

  Hive.registerAdapter(MRZModelSolution2Adapter());

  await Hive.openBox<MRZModelSolution1>(Constants.mrzHiveBoxSolution1);

  await Hive.openBox<MRZModelSolution2>(Constants.mrzHiveBoxSolution2);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScanMRZCubitSolution1(),
        ),
        BlocProvider(
          create: (context) => ScanMRZCubitSolution2(),
        ),
        BlocProvider(
          create: (context) => AppBottomNavigationCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'MRZ Scanner',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const AppBottomNavigation(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var index = context.read<AppBottomNavigationCubit>().state;
    print(index.toString());
    return Scaffold(
      appBar: AppBar(
        title: index == 0
            ? const Text('MZR Scanner (Solution 1)')
            : const Text('MZR Scanner (Solution 2)'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              index == 0
                  ? const Text('This solution using package(mrz_scanner)',
                      style: TextStyle(
                          fontSize: 14, overflow: TextOverflow.ellipsis))
                  : const Text('This solution using package(google_mlkit_text_recognition)',
                      style: TextStyle(
                          fontSize: 14, overflow: TextOverflow.ellipsis ),
              textAlign: TextAlign.center,
              maxLines: 2,),
              Lottie.asset('assets/mrz_scan.json'),
              const SizedBox(
                height: 60,
              ),
              const Text('Use the camera button to scan the passport',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis)),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  index == 0
                      ? Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const StoredResultPageSolution1(),
                        ))
                      : Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const StoredResultPageSolution2(),
                        ));
                },
                label: const Text('Show Stored MRZ'),
                icon: const Icon(Icons.file_copy_outlined),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          index == 0
              ? Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ScanMRZPageSolution1(),
                ))
              : Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ScanMRZPageSolution2(),
                ));
        },
        elevation: 10,
        child: const Icon(Icons.camera_alt_outlined),
      ),
    );
  }
}
