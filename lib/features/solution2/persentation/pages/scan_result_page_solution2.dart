import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safasoft_mrz_scanner_flutter_task/features/solution1/persentation/cubits/scan_cubit_solution1.dart';
import 'package:safasoft_mrz_scanner_flutter_task/features/solution1/persentation/cubits/scan_state_solution1.dart';
import 'package:safasoft_mrz_scanner_flutter_task/features/solution2/persentation/cubits/scan_cubit_solution2.dart';

import '../../../../core/utils/constants.dart';

class ScanResultPageSolution2 extends StatelessWidget {
  const ScanResultPageSolution2({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Result (Solution 2)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Constants.pagePadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 10,),
              const Divider(),
              const SizedBox(height: 10,),
              BlocBuilder<ScanMRZCubitSolution1, ScanMRZStateSolution1>(
                builder: (context, state) {
                    return ElevatedButton.icon(
                      onPressed: () {
                        context.read<ScanMRZCubitSolution2>().saveExtractedData(context);
                      },
                      label: const Text('Save'),
                      icon: const Icon(Icons.save),
                    );
                  }

              )
            ],
          ),
        ),
      ),
    );
  }
}
