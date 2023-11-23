import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexDotProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
