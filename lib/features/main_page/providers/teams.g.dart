// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teams.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$teamScoreHash() => r'c8922174f404b0622ca2dcfe2fa559c18123e3cb';

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

/// See also [teamScore].
@ProviderFor(teamScore)
const teamScoreProvider = TeamScoreFamily();

/// See also [teamScore].
class TeamScoreFamily extends Family<int> {
  /// See also [teamScore].
  const TeamScoreFamily();

  /// See also [teamScore].
  TeamScoreProvider call(
    int teamIndex,
  ) {
    return TeamScoreProvider(
      teamIndex,
    );
  }

  @override
  TeamScoreProvider getProviderOverride(
    covariant TeamScoreProvider provider,
  ) {
    return call(
      provider.teamIndex,
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
  String? get name => r'teamScoreProvider';
}

/// See also [teamScore].
class TeamScoreProvider extends AutoDisposeProvider<int> {
  /// See also [teamScore].
  TeamScoreProvider(
    int teamIndex,
  ) : this._internal(
          (ref) => teamScore(
            ref as TeamScoreRef,
            teamIndex,
          ),
          from: teamScoreProvider,
          name: r'teamScoreProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$teamScoreHash,
          dependencies: TeamScoreFamily._dependencies,
          allTransitiveDependencies: TeamScoreFamily._allTransitiveDependencies,
          teamIndex: teamIndex,
        );

  TeamScoreProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.teamIndex,
  }) : super.internal();

  final int teamIndex;

  @override
  Override overrideWith(
    int Function(TeamScoreRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TeamScoreProvider._internal(
        (ref) => create(ref as TeamScoreRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        teamIndex: teamIndex,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<int> createElement() {
    return _TeamScoreProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TeamScoreProvider && other.teamIndex == teamIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, teamIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TeamScoreRef on AutoDisposeProviderRef<int> {
  /// The parameter `teamIndex` of this provider.
  int get teamIndex;
}

class _TeamScoreProviderElement extends AutoDisposeProviderElement<int>
    with TeamScoreRef {
  _TeamScoreProviderElement(super.provider);

  @override
  int get teamIndex => (origin as TeamScoreProvider).teamIndex;
}

String _$teamsHash() => r'de913c6a3d5b6760502ab5230af937c20882aeed';

/// See also [Teams].
@ProviderFor(Teams)
final teamsProvider =
    AutoDisposeNotifierProvider<Teams, List<TeamModel>>.internal(
  Teams.new,
  name: r'teamsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$teamsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Teams = AutoDisposeNotifier<List<TeamModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
