// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:v/core/failure/failure.dart';
import 'package:v/src/domain/entities/daily_info.dart';
import 'package:v/src/domain/repository/daily_repository.dart';

@Injectable()
class GetDailyInfoUseCase {
  DailyRepository repository;

  GetDailyInfoUseCase({
    required this.repository,
  });

  Future<Either<Failure, DailyInfo>> call() {
    return repository.get();
  }
}
