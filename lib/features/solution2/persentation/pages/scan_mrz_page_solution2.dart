import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mrz_scanner/mrz_scanner.dart';
import 'package:safasoft_mrz_scanner_flutter_task/features/solution2/persentation/cubits/scan_cubit_solution2.dart';
import 'package:safasoft_mrz_scanner_flutter_task/features/solution2/persentation/cubits/scan_state_solution2.dart';

import '../../../../core/utils/constants.dart';

class ScanMRZPageSolution2 extends StatelessWidget {
  ScanMRZPageSolution2({super.key});

  final MRZController controller = MRZController();

  @override
  Widget build(BuildContext context) {
    ScanMRZCubitSolution2 scanCubit = context.read<ScanMRZCubitSolution2>()
      ..requestCameraPermission();
    return BlocConsumer<ScanMRZCubitSolution2, ScanMRZStateSolution2>(
      listener: (context, state) {
        if (state.isLoading) {
          showAdaptiveDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        }
      },
      builder: (context, state) {
        if (!state.isPermissionGranted) {
          return Scaffold(
            body: Center(
              child: Container(
                padding: const EdgeInsets.all(Constants.pagePadding),
                child: const Text(
                  'Camera permission denied',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }
        return Scaffold(
            appBar: AppBar(
              title: const Text('Scan MRZ (Solution 2)'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(Constants.pagePadding),
              child: Column(
                children: [
                  Lottie.asset('assets/mrz_scan.json'),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text('Use the camera button to scan the passport',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis)),
                  const Spacer(),
                  ElevatedButton.icon(
                    onPressed: () {
                      scanCubit.pickImageFromGallery(context);
                    },
                    label: const Text('Scan Now!'),
                    icon: const Icon(Icons.camera_alt_outlined),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
