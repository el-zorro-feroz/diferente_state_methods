import 'package:flutter/material.dart';
import 'package:v/core/services/services.dart';
import 'package:v/src/presentation/controller/message_controller.dart';

class ControllerMethodServerPage extends StatelessWidget {
  const ControllerMethodServerPage({super.key});

  @override
  Widget build(BuildContext context) {
    MessageController controller = services<MessageController>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: controller.refresh,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: ListenableBuilder(
          listenable: controller,
          builder: (_, __) {
            return Text(
              controller.data,
            );
          },
        ),
      ),
    );
  }
}
