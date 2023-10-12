import 'package:equatable/equatable.dart';

class DailyInfo extends Equatable {
  final String message;

  const DailyInfo({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
