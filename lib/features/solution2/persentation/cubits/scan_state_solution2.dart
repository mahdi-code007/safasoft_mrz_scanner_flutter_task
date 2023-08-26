
class ScanMRZStateSolution2 {
  final bool isPermissionGranted;
  final bool isLoading;
  // final CameraController? cameraController;

  ScanMRZStateSolution2({
    required this.isPermissionGranted,
    this.isLoading = false,
    // this.cameraController,
  });

  ScanMRZStateSolution2 copyWith({
    bool? isPermissionGranted,
    bool? isLoading,
    // CameraController? cameraController,
  }) {
    return ScanMRZStateSolution2(
      isPermissionGranted: isPermissionGranted ?? this.isPermissionGranted,
      isLoading: isLoading ?? this.isLoading,
      // cameraController: cameraController ?? this.cameraController,
    );
  }
}
