import 'package:flutter/material.dart';
import 'package:v/core/services/services.dart';
import 'package:v/src/domain/use_case/get_daily_info_usecase.dart';

class StatefulMethodServerPage extends StatelessWidget {
  const StatefulMethodServerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UpdatableWidget(),
    );
  }
}

class UpdatableWidget extends StatefulWidget {
  const UpdatableWidget({super.key});

  @override
  State<UpdatableWidget> createState() => _UpdatableWidgetState();
}

class _UpdatableWidgetState extends State<UpdatableWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.refresh,
              ),
            ),
          ),
        ),
        FutureBuilder(
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
      ],
    );
  }
}
