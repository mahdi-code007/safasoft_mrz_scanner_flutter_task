import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:safasoft_mrz_scanner_flutter_task/core/models/mrz_model_solution1.dart';
import 'package:safasoft_mrz_scanner_flutter_task/features/solution1/persentation/widgets/mrz_tile_solution1.dart';

import '../../../../core/utils/constants.dart';

class StoredResultPageSolution1 extends StatefulWidget {
  const StoredResultPageSolution1({super.key});

  @override
  State<StoredResultPageSolution1> createState() => _StoredResultPageSolution1State();
}

class _StoredResultPageSolution1State extends State<StoredResultPageSolution1> {
  final boxSolution1 = Hive.box<MRZModelSolution1>(Constants.mrzHiveBoxSolution1);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Result (Solution 1)'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(Constants.pagePadding),
            child: boxSolution1.length == 0
                ? const Center(
                    child: Text('No MRZ Record'),
                  )
                : ListView.separated(
                    itemCount: boxSolution1.length,
                    itemBuilder: (context, index) {
                      final textModel = boxSolution1.getAt(index);
                      return Dismissible(
                          key: ValueKey<MRZModelSolution1>(textModel!),
                          onDismissed: (direction) {
                            boxSolution1.deleteAt(index);
                            setState(() {});
                          },
                          background: Container(
                            color: Colors.red,
                            child: const Icon(Icons.delete),
                          ),
                          child: MRZTileSolution1(
                            index: index,
                          ));
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  )),
      );
}
