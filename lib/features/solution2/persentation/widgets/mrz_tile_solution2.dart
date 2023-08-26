import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:safasoft_mrz_scanner_flutter_task/core/models/mrz_model_solution2.dart';

import '../../../../core/models/mrz_model_solution1.dart';
import '../../../../core/utils/constants.dart';

class MRZTileSolution2 extends StatelessWidget {
  MRZTileSolution2({super.key, required this.index});

   final boxSolution2 = Hive.box<MRZModelSolution2>(Constants.mrzHiveBoxSolution2);

  final int index;
  @override
  Widget build(BuildContext context) {
    var singleModel = boxSolution2.getAt(index);
    return ExpansionTile(
      initiallyExpanded: index == 0 ? true : false,
      textColor: Colors.white,
      collapsedTextColor: Colors.white,
      collapsedBackgroundColor: const Color(0xFF353A5F),
      backgroundColor: const Color(0xFF9EBAF3),
      collapsedIconColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      collapsedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      title: Text('MRZ No $index',
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white)),
      childrenPadding: const EdgeInsets.all(10),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 2),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),

          ),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(singleModel?.fullExtractedText ?? '',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
        const SizedBox(height: 14),
      ],
    );
  }


}
