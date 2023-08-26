import 'package:hive/hive.dart';

part 'mrz_model_solution2.g.dart';
@HiveType(typeId: 2)
class MRZModelSolution2 extends HiveObject {
  @HiveField(0)
  String fullExtractedText;

  MRZModelSolution2(this.fullExtractedText);
}
