import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalLoaderNotifier extends StateNotifier<bool> {
  GlobalLoaderNotifier() : super(false);

  void setLoderValue(bool value) {
    state = value;
  }
}

final globalLoaderProvider = StateNotifierProvider<GlobalLoaderNotifier, bool>(
  (ref) {
    return GlobalLoaderNotifier();
  },
);
