import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:safasoft_mrz_scanner_flutter_task/features/solution2/persentation/cubits/scan_state_solution2.dart';
import 'package:safasoft_mrz_scanner_flutter_task/features/solution2/persentation/pages/stored_result_screen_solution2.dart';
import 'package:safasoft_mrz_scanner_flutter_task/features/solution2/persentation/pages/scan_result_page_solution2.dart';

import '../../../../core/models/mrz_model_solution2.dart';
import '../../../../core/utils/constants.dart';

class ScanMRZCubitSolution2 extends Cubit<ScanMRZStateSolution2> {
  ScanMRZCubitSolution2() : super(ScanMRZStateSolution2(isPermissionGranted: false));

  static ScanMRZCubitSolution2 get (context) => BlocProvider.of(context);

  final textRecognizer = TextRecognizer();
  var recognizedText = '';

  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if(status.isPermanentlyDenied){
      openAppSettings();
    }
    emit(state.copyWith(isPermissionGranted: status == PermissionStatus.granted));
  }

  final picker = ImagePicker();
  File? selectedImage;

  Future pickImageFromGallery(BuildContext context) async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
    );
    selectedImage = File(pickedFile!.path);
    print('message ${selectedImage?.path}');
    scanImage(context);
  }


  Future<void> scanImage(BuildContext context) async {
    final navigator = Navigator.of(context);

    try {
      emit(state.copyWith(isLoading: true));
      final inputImage = InputImage.fromFile(selectedImage!);
      await textRecognizer.processImage(inputImage).then((value) => {
        recognizedText = value.text
      });

      emit(state.copyWith(isLoading: false));
      await navigator.push(
       MaterialPageRoute(builder: (context) => ScanResultPageSolution2(text: recognizedText,),)
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred when scanning text'),
        ),
      );
    }
  }

  Future<void> saveExtractedData(BuildContext context) async {
    final navigator = Navigator.of(context);

    try {
      final boxSolution2 = Hive.box<MRZModelSolution2>(Constants.mrzHiveBoxSolution2);
      boxSolution2.add(MRZModelSolution2(recognizedText));
      emit(state.copyWith(isLoading: false));
      await navigator.push(
          MaterialPageRoute(builder: (context) => const StoredResultPageSolution2(),)
      );

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


