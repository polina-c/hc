const kExperiments = bool.fromEnvironment('experiments', defaultValue: false);

class FeatureFlags {
  static const bool exploreScreen = kExperiments;
}
