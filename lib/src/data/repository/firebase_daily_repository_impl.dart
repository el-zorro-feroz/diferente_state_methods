import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:v/core/failure/failure.dart';
import 'package:v/core/firebase/collections.dart';
import 'package:v/src/data/models/daily_info.dart';
import 'package:v/src/domain/entities/daily_info.dart';
import 'package:v/src/domain/failure/daily_failures.dart';
import 'package:v/src/domain/repository/daily_repository.dart';

@Injectable(as: DailyRepository)
class FirebaseDailyRepositoryImpl implements DailyRepository {
  final FirebaseReferences firebaseReferences;

  FirebaseDailyRepositoryImpl({
    required this.firebaseReferences,
  });

  @override
  Future<Either<Failure, DailyInfo>> get() async {
    try {
      // final result = await firebaseReferences.infoDoc.get();
      // final model = DailyInfoModel.fromDoc(result);
      // return Right(model);

      return firebaseReferences.infoDoc.get().then((doc) async {
        return Right(DailyInfoModel.fromDoc(doc));
      });
    } on FirebaseException catch (_) {
      return Left(FirebaseFailure());
    } catch (_) {
      return Left(UnimplFailure());
    }
  }
}
