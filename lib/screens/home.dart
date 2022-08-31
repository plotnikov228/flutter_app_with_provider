import 'package:flutter/material.dart';
import 'package:flutter_app_with_provider/models/model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<MyModel>(
        create: (_) => MyModel(),
      )
    ], child: const ProviderChild());
  }
}

class ProviderChild extends StatelessWidget {
  const ProviderChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Provider Example'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Counter: ${context.watch<MyModel>().counter}',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<MyModel>().increment();
              },
              child: const Icon(Icons.add),
            )
          ],
        )));
  }
}
