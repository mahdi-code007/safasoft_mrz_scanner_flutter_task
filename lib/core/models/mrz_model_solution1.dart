import 'package:hive/hive.dart';

part 'mrz_model_solution1.g.dart';
@HiveType(typeId: 1)
class MRZModelSolution1 extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String gender;
  @HiveField(2)
  String countryCode;
  @HiveField(3)
  String dateOfBirth;
  @HiveField(4)
  String expiryDate;
  @HiveField(5)
  String docNumber;
  @HiveField(6)
  String docType;
  @HiveField(7)
  String personalNumber;

  MRZModelSolution1(this.name, this.gender, this.countryCode, this.dateOfBirth,
      this.expiryDate, this.docNumber, this.docType, this.personalNumber);
}
