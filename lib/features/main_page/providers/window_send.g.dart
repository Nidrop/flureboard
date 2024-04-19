// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window_send.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$windowSendTeamHash() => r'13a233e614445fafa3e162dd29df8ce2b47d333f';

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

String _$windowSendPlayerHash() => r'195242335e9b0352e5d4cc6cf696b5142a338400';

/// See also [windowSendPlayer].
@ProviderFor(windowSendPlayer)
const windowSendPlayerProvider = WindowSendPlayerFamily();

/// See also [windowSendPlayer].
class WindowSendPlayerFamily extends Family<void> {
  /// See also [windowSendPlayer].
  const WindowSendPlayerFamily();

  /// See also [windowSendPlayer].
  WindowSendPlayerProvider call({
    required int teamIndex,
    required int playerIndex,
    String? number,
    String? playerName,
    int? falls,
    int? score,
  }) {
    return WindowSendPlayerProvider(
      teamIndex: teamIndex,
      playerIndex: playerIndex,
      number: number,
      playerName: playerName,
      falls: falls,
      score: score,
    );
  }

  @override
  WindowSendPlayerProvider getProviderOverride(
    covariant WindowSendPlayerProvider provider,
  ) {
    return call(
      teamIndex: provider.teamIndex,
      playerIndex: provider.playerIndex,
      number: provider.number,
      playerName: provider.playerName,
      falls: provider.falls,
      score: provider.score,
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
  String? get name => r'windowSendPlayerProvider';
}

/// See also [windowSendPlayer].
class WindowSendPlayerProvider extends AutoDisposeProvider<void> {
  /// See also [windowSendPlayer].
  WindowSendPlayerProvider({
    required int teamIndex,
    required int playerIndex,
    String? number,
    String? playerName,
    int? falls,
    int? score,
  }) : this._internal(
          (ref) => windowSendPlayer(
            ref as WindowSendPlayerRef,
            teamIndex: teamIndex,
            playerIndex: playerIndex,
            number: number,
            playerName: playerName,
            falls: falls,
            score: score,
          ),
          from: windowSendPlayerProvider,
          name: r'windowSendPlayerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$windowSendPlayerHash,
          dependencies: WindowSendPlayerFamily._dependencies,
          allTransitiveDependencies:
              WindowSendPlayerFamily._allTransitiveDependencies,
          teamIndex: teamIndex,
          playerIndex: playerIndex,
          number: number,
          playerName: playerName,
          falls: falls,
          score: score,
        );

  WindowSendPlayerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.teamIndex,
    required this.playerIndex,
    required this.number,
    required this.playerName,
    required this.falls,
    required this.score,
  }) : super.internal();

  final int teamIndex;
  final int playerIndex;
  final String? number;
  final String? playerName;
  final int? falls;
  final int? score;

  @override
  Override overrideWith(
    void Function(WindowSendPlayerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WindowSendPlayerProvider._internal(
        (ref) => create(ref as WindowSendPlayerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        teamIndex: teamIndex,
        playerIndex: playerIndex,
        number: number,
        playerName: playerName,
        falls: falls,
        score: score,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<void> createElement() {
    return _WindowSendPlayerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WindowSendPlayerProvider &&
        other.teamIndex == teamIndex &&
        other.playerIndex == playerIndex &&
        other.number == number &&
        other.playerName == playerName &&
        other.falls == falls &&
        other.score == score;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, teamIndex.hashCode);
    hash = _SystemHash.combine(hash, playerIndex.hashCode);
    hash = _SystemHash.combine(hash, number.hashCode);
    hash = _SystemHash.combine(hash, playerName.hashCode);
    hash = _SystemHash.combine(hash, falls.hashCode);
    hash = _SystemHash.combine(hash, score.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WindowSendPlayerRef on AutoDisposeProviderRef<void> {
  /// The parameter `teamIndex` of this provider.
  int get teamIndex;

  /// The parameter `playerIndex` of this provider.
  int get playerIndex;

  /// The parameter `number` of this provider.
  String? get number;

  /// The parameter `playerName` of this provider.
  String? get playerName;

  /// The parameter `falls` of this provider.
  int? get falls;

  /// The parameter `score` of this provider.
  int? get score;
}

class _WindowSendPlayerProviderElement extends AutoDisposeProviderElement<void>
    with WindowSendPlayerRef {
  _WindowSendPlayerProviderElement(super.provider);

  @override
  int get teamIndex => (origin as WindowSendPlayerProvider).teamIndex;
  @override
  int get playerIndex => (origin as WindowSendPlayerProvider).playerIndex;
  @override
  String? get number => (origin as WindowSendPlayerProvider).number;
  @override
  String? get playerName => (origin as WindowSendPlayerProvider).playerName;
  @override
  int? get falls => (origin as WindowSendPlayerProvider).falls;
  @override
  int? get score => (origin as WindowSendPlayerProvider).score;
}

String _$windowSendPeriodHash() => r'12f50a57bed9f1828c29e81f1ed9eeb4bedea8d3';

/// See also [windowSendPeriod].
@ProviderFor(windowSendPeriod)
final windowSendPeriodProvider = AutoDisposeProvider<void>.internal(
  windowSendPeriod,
  name: r'windowSendPeriodProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$windowSendPeriodHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WindowSendPeriodRef = AutoDisposeProviderRef<void>;
String _$windowSendTimerHash() => r'2d0cf313a7ddc4df3a4e03c952a4bf0cd95ad56b';

/// See also [windowSendTimer].
@ProviderFor(windowSendTimer)
final windowSendTimerProvider = AutoDisposeProvider<void>.internal(
  windowSendTimer,
  name: r'windowSendTimerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$windowSendTimerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WindowSendTimerRef = AutoDisposeProviderRef<void>;
String _$windowSendTimerStateHash() =>
    r'28ab69b6469627bb5aa24ba1b50aedbf1b937973';

/// See also [windowSendTimerState].
@ProviderFor(windowSendTimerState)
final windowSendTimerStateProvider = AutoDisposeProvider<void>.internal(
  windowSendTimerState,
  name: r'windowSendTimerStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$windowSendTimerStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WindowSendTimerStateRef = AutoDisposeProviderRef<void>;
String _$windowSendBoardSettingsHash() =>
    r'7dcb476a2a8371176974b0850400f1a81ee63818';

/// See also [windowSendBoardSettings].
@ProviderFor(windowSendBoardSettings)
final windowSendBoardSettingsProvider = AutoDisposeProvider<void>.internal(
  windowSendBoardSettings,
  name: r'windowSendBoardSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$windowSendBoardSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WindowSendBoardSettingsRef = AutoDisposeProviderRef<void>;
String _$windowSendPlayerCountHash() =>
    r'8fb16799c7bd4cffec0556bec7ea915470dc033c';

/// See also [windowSendPlayerCount].
@ProviderFor(windowSendPlayerCount)
const windowSendPlayerCountProvider = WindowSendPlayerCountFamily();

/// See also [windowSendPlayerCount].
class WindowSendPlayerCountFamily extends Family<void> {
  /// See also [windowSendPlayerCount].
  const WindowSendPlayerCountFamily();

  /// See also [windowSendPlayerCount].
  WindowSendPlayerCountProvider call(
    int number,
  ) {
    return WindowSendPlayerCountProvider(
      number,
    );
  }

  @override
  WindowSendPlayerCountProvider getProviderOverride(
    covariant WindowSendPlayerCountProvider provider,
  ) {
    return call(
      provider.number,
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
  String? get name => r'windowSendPlayerCountProvider';
}

/// See also [windowSendPlayerCount].
class WindowSendPlayerCountProvider extends AutoDisposeProvider<void> {
  /// See also [windowSendPlayerCount].
  WindowSendPlayerCountProvider(
    int number,
  ) : this._internal(
          (ref) => windowSendPlayerCount(
            ref as WindowSendPlayerCountRef,
            number,
          ),
          from: windowSendPlayerCountProvider,
          name: r'windowSendPlayerCountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$windowSendPlayerCountHash,
          dependencies: WindowSendPlayerCountFamily._dependencies,
          allTransitiveDependencies:
              WindowSendPlayerCountFamily._allTransitiveDependencies,
          number: number,
        );

  WindowSendPlayerCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.number,
  }) : super.internal();

  final int number;

  @override
  Override overrideWith(
    void Function(WindowSendPlayerCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WindowSendPlayerCountProvider._internal(
        (ref) => create(ref as WindowSendPlayerCountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        number: number,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<void> createElement() {
    return _WindowSendPlayerCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WindowSendPlayerCountProvider && other.number == number;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, number.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WindowSendPlayerCountRef on AutoDisposeProviderRef<void> {
  /// The parameter `number` of this provider.
  int get number;
}

class _WindowSendPlayerCountProviderElement
    extends AutoDisposeProviderElement<void> with WindowSendPlayerCountRef {
  _WindowSendPlayerCountProviderElement(super.provider);

  @override
  int get number => (origin as WindowSendPlayerCountProvider).number;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
