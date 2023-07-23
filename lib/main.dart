import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_inquiry/some_controller.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final someValue = ref.watch(someControllerProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          someValue.when(
            data: (data) => const Text("Alrite alrite alrite"),
            error: (error, stackTrace) => const Text("Uh oh..."),
            loading: () => const Text("Not yet"),
          ),
          ElevatedButton(
            onPressed: () =>
                ref.read(someControllerProvider.notifier).mutate(9),
            child: const Text("Click me!"),
          )
        ],
      ),
    );
  }
}
