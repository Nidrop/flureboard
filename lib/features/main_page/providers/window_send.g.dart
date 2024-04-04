// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window_send.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$windowSendTeamHash() => r'36a057f02b878e8ca0397eddfa9601829f419b88';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [windowSendTeam].
@ProviderFor(windowSendTeam)
const windowSendTeamProvider = WindowSendTeamFamily();

/// See also [windowSendTeam].
class WindowSendTeamFamily extends Family<void> {
  /// See also [windowSendTeam].
  const WindowSendTeamFamily();

  /// See also [windowSendTeam].
  WindowSendTeamProvider call({
    required int teamIndex,
    String? teamName,
    String? country,
    int? score,
    int? timeouts,
    int? falls,
  }) {
    return WindowSendTeamProvider(
      teamIndex: teamIndex,
      teamName: teamName,
      country: country,
      score: score,
      timeouts: timeouts,
      falls: falls,
    );
  }

  @override
  WindowSendTeamProvider getProviderOverride(
    covariant WindowSendTeamProvider provider,
  ) {
    return call(
      teamIndex: provider.teamIndex,
      teamName: provider.teamName,
      country: provider.country,
      score: provider.score,
      timeouts: provider.timeouts,
      falls: provider.falls,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'windowSendTeamProvider';
}

/// See also [windowSendTeam].
class WindowSendTeamProvider extends AutoDisposeProvider<void> {
  /// See also [windowSendTeam].
  WindowSendTeamProvider({
    required int teamIndex,
    String? teamName,
    String? country,
    int? score,
    int? timeouts,
    int? falls,
  }) : this._internal(
          (ref) => windowSendTeam(
            ref as WindowSendTeamRef,
            teamIndex: teamIndex,
            teamName: teamName,
            country: country,
            score: score,
            timeouts: timeouts,
            falls: falls,
          ),
          from: windowSendTeamProvider,
          name: r'windowSendTeamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$windowSendTeamHash,
          dependencies: WindowSendTeamFamily._dependencies,
          allTransitiveDependencies:
              WindowSendTeamFamily._allTransitiveDependencies,
          teamIndex: teamIndex,
          teamName: teamName,
          country: country,
          score: score,
          timeouts: timeouts,
          falls: falls,
        );

  WindowSendTeamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.teamIndex,
    required this.teamName,
    required this.country,
    required this.score,
    required this.timeouts,
    required this.falls,
  }) : super.internal();

  final int teamIndex;
  final String? teamName;
  final String? country;
  final int? score;
  final int? timeouts;
  final int? falls;

  @override
  Override overrideWith(
    void Function(WindowSendTeamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WindowSendTeamProvider._internal(
        (ref) => create(ref as WindowSendTeamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        teamIndex: teamIndex,
        teamName: teamName,
        country: country,
        score: score,
        timeouts: timeouts,
        falls: falls,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<void> createElement() {
    return _WindowSendTeamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WindowSendTeamProvider &&
        other.teamIndex == teamIndex &&
        other.teamName == teamName &&
        other.country == country &&
        other.score == score &&
        other.timeouts == timeouts &&
        other.falls == falls;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, teamIndex.hashCode);
    hash = _SystemHash.combine(hash, teamName.hashCode);
    hash = _SystemHash.combine(hash, country.hashCode);
    hash = _SystemHash.combine(hash, score.hashCode);
    hash = _SystemHash.combine(hash, timeouts.hashCode);
    hash = _SystemHash.combine(hash, falls.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WindowSendTeamRef on AutoDisposeProviderRef<void> {
  /// The parameter `teamIndex` of this provider.
  int get teamIndex;

  /// The parameter `teamName` of this provider.
  String? get teamName;

  /// The parameter `country` of this provider.
  String? get country;

  /// The parameter `score` of this provider.
  int? get score;

  /// The parameter `timeouts` of this provider.
  int? get timeouts;

  /// The parameter `falls` of this provider.
  int? get falls;
}

class _WindowSendTeamProviderElement extends AutoDisposeProviderElement<void>
    with WindowSendTeamRef {
  _WindowSendTeamProviderElement(super.provider);

  @override
  int get teamIndex => (origin as WindowSendTeamProvider).teamIndex;
  @override
  String? get teamName => (origin as WindowSendTeamProvider).teamName;
  @override
  String? get country => (origin as WindowSendTeamProvider).country;
  @override
  int? get score => (origin as WindowSendTeamProvider).score;
  @override
  int? get timeouts => (origin as WindowSendTeamProvider).timeouts;
  @override
  int? get falls => (origin as WindowSendTeamProvider).falls;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
