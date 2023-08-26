import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/models/mrz_model_solution1.dart';
import '../../../../core/utils/constants.dart';

class MRZTileSolution1 extends StatelessWidget {
  MRZTileSolution1({super.key, required this.index});

   final boxSolution1 = Hive.box<MRZModelSolution1>(Constants.mrzHiveBoxSolution1);

  final int index;
  @override
  Widget build(BuildContext context) {
    var singleModel = boxSolution1.getAt(index);
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
      title: Text(boxSolution1.getAt(index)?.name ?? '',
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white)),
      childrenPadding: const EdgeInsets.all(10),
      children: [
        _singleText(singleModel?.gender ?? ''),
        _singleText(singleModel?.countryCode ?? ''),
        _singleText(singleModel?.dateOfBirth ?? ''),
        _singleText(singleModel?.expiryDate ?? ''),
        _singleText(singleModel?.docNumber ?? ''),
        _singleText(singleModel?.docType ?? ''),
        _singleText(singleModel?.personalNumber ?? ''),
        const SizedBox(height: 14),
      ],
    );
  }

  Widget _singleText(String text){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 2),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),

      ),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(text,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }
}
