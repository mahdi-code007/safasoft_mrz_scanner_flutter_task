
class ScanMRZStateSolution1 {
  final bool isPermissionGranted;
  final bool isLoading;
  // final CameraController? cameraController;

  ScanMRZStateSolution1({
    required this.isPermissionGranted,
    this.isLoading = false,
    // this.cameraController,
  });

  ScanMRZStateSolution1 copyWith({
    bool? isPermissionGranted,
    bool? isLoading,
    // CameraController? cameraController,
  }) {
    return ScanMRZStateSolution1(
      isPermissionGranted: isPermissionGranted ?? this.isPermissionGranted,
      isLoading: isLoading ?? this.isLoading,
      // cameraController: cameraController ?? this.cameraController,
    );
  }
}
