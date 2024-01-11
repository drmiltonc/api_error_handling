import 'package:api_error_handling/api_controller.dart';
import 'package:flutter/material.dart';

class APIButton extends StatefulWidget {
  const APIButton({super.key});

  @override
  State<APIButton> createState() => _APIButtonState();
}

class _APIButtonState extends State<APIButton> {
  @override
  Widget build(BuildContext context) {
    APIController apiController = APIController();
    return FilledButton.tonal(
      onPressed: () async {
        print('Button pressed');
        await apiController.fetchData(context);
      },
      child: const Text('Fetch API'),
    );
  }
}
