import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/dark_mode_config_model.dart';
import '../repos/darkmode_config_repo.dart';

final darkModeConfigRepoProvider = Provider<DarkModeConfigRepo>((ref) {
  throw UnimplementedError();
});

class DarkModeConfigViewModel extends Notifier<DarkModeConfigModel> {
  late final DarkModeConfigRepo _darkModeConfigRepo;

  @override
  DarkModeConfigModel build() {
    _darkModeConfigRepo = ref.read(darkModeConfigRepoProvider);
    return DarkModeConfigModel(isDarkMode: _darkModeConfigRepo.isDarkMode);
  }

  bool get isDarkMode => state.isDarkMode;

  void setDarkMode(bool isDarkMode) {
    _darkModeConfigRepo.setDarkModeConfig(isDarkMode);
    state = DarkModeConfigModel(isDarkMode: isDarkMode);
  }
}

final darkModeConfigViewModelProvider = NotifierProvider<DarkModeConfigViewModel, DarkModeConfigModel>(
  DarkModeConfigViewModel.new,
);
