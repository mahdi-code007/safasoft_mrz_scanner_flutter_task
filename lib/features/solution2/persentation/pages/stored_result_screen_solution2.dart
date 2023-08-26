import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:safasoft_mrz_scanner_flutter_task/core/models/mrz_model_solution2.dart';
import 'package:safasoft_mrz_scanner_flutter_task/features/solution2/persentation/widgets/mrz_tile_solution2.dart';

import '../../../../core/utils/constants.dart';

class StoredResultPageSolution2 extends StatefulWidget {
  const StoredResultPageSolution2({super.key});

  @override
  State<StoredResultPageSolution2> createState() => _StoredResultPageSolution2State();
}

class _StoredResultPageSolution2State extends State<StoredResultPageSolution2> {
  final boxSolution2 = Hive.box<MRZModelSolution2>(Constants.mrzHiveBoxSolution2);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Result (Solution 2)'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(Constants.pagePadding),
            child: boxSolution2.length == 0
                ? const Center(
                    child: Text('No MRZ Record'),
                  )
                : ListView.separated(
                    itemCount: boxSolution2.length,
                    itemBuilder: (context, index) {
                      final textModel = boxSolution2.getAt(index);
                      return Dismissible(
                          key: ValueKey<MRZModelSolution2>(textModel!),
                          onDismissed: (direction) {
                            boxSolution2.deleteAt(index);
                            setState(() {});
                          },
                          background: Container(
                            color: Colors.red,
                            child: const Icon(Icons.delete),
                          ),
                          child: MRZTileSolution2(
                            index: index,
                          ));
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  )),
      );
}
