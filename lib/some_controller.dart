import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'some_controller.g.dart';

@riverpod
class SomeController extends _$SomeController {
  int _rebuilds = 0;
  @override
  FutureOr<int> build() {
    ref.listenSelf((previous, next) {
      _rebuilds++;
      print(_rebuilds);
      print("Previous: $previous");
      print("Next: $next");
    });
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
