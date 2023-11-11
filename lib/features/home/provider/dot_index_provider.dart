import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBannerDotIndexNotifier extends StateNotifier<int> {
  HomeBannerDotIndexNotifier() : super(0);

  void onIndexChange(int index) {
    state = index;
  }
}

final homeBannerDotIndexProviderProvider =
    StateNotifierProvider<HomeBannerDotIndexNotifier, int>((ref) {
  return HomeBannerDotIndexNotifier();
});
