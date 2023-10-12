import 'package:flutter/material.dart';
import 'package:v/core/services/services.dart';
import 'package:v/src/domain/use_case/get_daily_info_usecase.dart';

class FutureMethodServerPage extends StatelessWidget {
  const FutureMethodServerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const FutureMethodServerPage(),
                ),
              );
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: services<GetDailyInfoUseCase>().call(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final String txt = snapshot.data!.fold(
              (failure) => 'Error',
              (info) => info.message,
            );

            return Center(
              child: Text(txt),
            );
          }

          if (snapshot.hasError) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                Text(
                  snapshot.error.toString(),
                ),
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
          );
        },
      ),
    );
  }
}
