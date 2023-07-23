import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'some_controller.g.dart';

@riverpod
class SomeController extends _$SomeController {
  @override
  FutureOr<int> build() {
    return future;
  }

  Future<void> mutate(int input) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => Future.delayed(
          const Duration(milliseconds: 400),
          () => Random().nextBool() ? input : throw Exception("ouch"),
        ));
  }
}
