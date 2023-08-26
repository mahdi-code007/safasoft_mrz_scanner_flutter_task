import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:safasoft_mrz_scanner_flutter_task/features/solution1/persentation/cubits/scan_state_solution1.dart';
import 'package:safasoft_mrz_scanner_flutter_task/features/solution1/persentation/pages/scan_result_page_solution1.dart';

import '../../../../core/models/mrz_model_solution1.dart';
import '../../../../core/utils/constants.dart';
import '../pages/stored_result_screen_solution1.dart';




class ScanMRZCubitSolution1 extends Cubit<ScanMRZStateSolution1> {
  ScanMRZCubitSolution1() : super(ScanMRZStateSolution1(isPermissionGranted: false));

  static ScanMRZCubitSolution1 get (context) => BlocProvider.of(context);

  final textRecognizer = TextRecognizer();
  var recognizedText = '';

  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if(status.isPermanentlyDenied){
      openAppSettings();
    }
    emit(state.copyWith(isPermissionGranted: status == PermissionStatus.granted));
  }

  Future<void> saveExtractedData(BuildContext context , MRZModelSolution1 mrzModel) async {
    final navigator = Navigator.of(context);

    try {
      final mRZModelSolution1 = Hive.box<MRZModelSolution1>(Constants.mrzHiveBoxSolution1);
      mRZModelSolution1.add(mrzModel);
      emit(state.copyWith(isLoading: false));
      await navigator.push(
          MaterialPageRoute(builder: (context) => StoredResultPageSolution1(),)
      );
      if(recognizedText.isNotEmpty){

      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Empty text'),
          ),
        );
      }

    } catch (e) {
      emit(state.copyWith(isLoading: false));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred when scanning text'),
        ),
      );
    }
  }
}


