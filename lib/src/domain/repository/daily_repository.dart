import 'package:dartz/dartz.dart';
import 'package:v/core/failure/failure.dart';
import 'package:v/src/domain/entities/daily_info.dart';

abstract class DailyRepository {
  Future<Either<Failure, DailyInfo>> get();
}
