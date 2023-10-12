// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:v/core/failure/failure.dart';
import 'package:v/src/domain/entities/daily_info.dart';

import 'package:v/src/domain/use_case/get_daily_info_usecase.dart';

@Injectable()
class MessageController with ChangeNotifier {
  final GetDailyInfoUseCase getDailyInfoUseCase;

  MessageController({
    required this.getDailyInfoUseCase,
  });

  String _data = '...';
  String get data => _data;
  set data(String value) {
    _data = value;
    notifyListeners();
  }

  void refresh() async {
    final Either<Failure, DailyInfo> failOrInfo = await getDailyInfoUseCase.call();

    failOrInfo.fold(
      (failure) => null,
      (info) => data = info.message,
    );
  }

  //....
}
