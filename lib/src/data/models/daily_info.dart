import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:v/src/domain/entities/daily_info.dart';

class DailyInfoModel extends DailyInfo {
  const DailyInfoModel({required super.message});

  factory DailyInfoModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return DailyInfoModel(message: data['data']);
  }
}
