import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrz_scanner/mrz_scanner.dart';
import 'package:safasoft_mrz_scanner_flutter_task/core/models/mrz_model_solution1.dart';
import 'package:safasoft_mrz_scanner_flutter_task/core/utils/ext.dart';

import '../../../../core/utils/constants.dart';
import '../cubits/scan_cubit_solution1.dart';
import '../cubits/scan_state_solution1.dart';

class ScanMRZPageSolution1 extends StatelessWidget {
  ScanMRZPageSolution1({super.key});

  final MRZController controller = MRZController();

  @override
  Widget build(BuildContext context) {
context.read<ScanMRZCubitSolution1>()
      .requestCameraPermission();
    return BlocConsumer<ScanMRZCubitSolution1, ScanMRZStateSolution1>(
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
        return MRZScanner(
          controller: controller,
          onSuccess: (mrzResult) async {
            await showAdaptiveDialog(
              context: context,
              builder: (context) => Dialog(
                elevation: 10,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          controller.currentState?.resetScanning();
                        },
                        child: const Text('Reset Scanning'),
                      ),
                      Text('Name : ${mrzResult.givenNames}'),
                      Text('Gender : ${mrzResult.sex.name}'),
                      Text('Country Code : ${mrzResult.countryCode}'),
                      Text('Date of Birth : ${mrzResult.birthDate.formatDate}'),
                      Text('Expiry Date : ${mrzResult.expiryDate.formatDate}'),
                      Text('Doc Num : ${mrzResult.documentNumber}'),
                      Text('Doc Type : ${mrzResult.documentType}'),
                      Text('Personal Number: ${mrzResult.personalNumber}'),
                      const SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            context.read<ScanMRZCubitSolution1>().saveExtractedData(
                                  context,
                                  MRZModelSolution1(
                                      'Name : ${mrzResult.givenNames}',
                                      'Gender : ${mrzResult.sex.name}',
                                      'Country Code : ${mrzResult.countryCode}',
                                      'Date of Birth : ${mrzResult.birthDate.formatDate}',
                                      'Expiry Date : ${mrzResult.expiryDate.formatDate}',
                                      'Doc Num : ${mrzResult.documentNumber}',
                                      'Doc Type : ${mrzResult.documentType}',
                                      'Personal Number: ${mrzResult.personalNumber}'),
                                );
                          },
                          label: const Text('Save'),
                          icon: const Icon(Icons.save),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
