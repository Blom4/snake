// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_tick_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameTickResult<TState> {

 TState get state; List<GameEvent> get events;
/// Create a copy of GameTickResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameTickResultCopyWith<TState, GameTickResult<TState>> get copyWith => _$GameTickResultCopyWithImpl<TState, GameTickResult<TState>>(this as GameTickResult<TState>, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GameTickResult<TState>;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameTickResult<TState>&&const DeepCollectionEquality().equals(other.state, _this.state)&&const DeepCollectionEquality().equals(other.events, _this.events));
}


@override
int get hashCode {
  final _this = this as GameTickResult<TState>;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.state),const DeepCollectionEquality().hash(_this.events));
}

@override
String toString() {
  final _this = this as GameTickResult<TState>;
  return 'GameTickResult<$TState>(state: ${_this.state}, events: ${_this.events})';
}


}

/// @nodoc
abstract mixin class $GameTickResultCopyWith<TState,$Res>  {
  factory $GameTickResultCopyWith(GameTickResult<TState> value, $Res Function(GameTickResult<TState>) _then) = _$GameTickResultCopyWithImpl;
@useResult
$Res call({
 TState state, List<GameEvent> events
});




}
/// @nodoc
class _$GameTickResultCopyWithImpl<TState,$Res>
    implements $GameTickResultCopyWith<TState, $Res> {
  _$GameTickResultCopyWithImpl(this._self, this._then);

  final GameTickResult<TState> _self;
  final $Res Function(GameTickResult<TState>) _then;

/// Create a copy of GameTickResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = freezed,Object? events = null,}) {
  return _then(GameTickResult(
state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as TState,events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<GameEvent>,
  ));
}

}


/// Adds pattern-matching-related methods to [GameTickResult].
extension GameTickResultPatterns<TState> on GameTickResult<TState> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameTickResult<TState> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameTickResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameTickResult<TState> value)  $default,){
final _that = this;
switch (_that) {
case _GameTickResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameTickResult<TState> value)?  $default,){
final _that = this;
switch (_that) {
case _GameTickResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TState state,  List<GameEvent> events)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameTickResult() when $default != null:
return $default(_that.state,_that.events);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TState state,  List<GameEvent> events)  $default,) {final _that = this;
switch (_that) {
case _GameTickResult():
return $default(_that.state,_that.events);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TState state,  List<GameEvent> events)?  $default,) {final _that = this;
switch (_that) {
case _GameTickResult() when $default != null:
return $default(_that.state,_that.events);case _:
  return null;

}
}

}

/// @nodoc


class _GameTickResult<TState> implements GameTickResult<TState> {
  const _GameTickResult({required this.state, required  List<GameEvent> events}): _events = events;
  

@override final  TState state;
 final  List<GameEvent> _events;
@override List<GameEvent> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}


/// Create a copy of GameTickResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameTickResultCopyWith<TState, _GameTickResult<TState>> get copyWith => __$GameTickResultCopyWithImpl<TState, _GameTickResult<TState>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameTickResult<TState>&&const DeepCollectionEquality().equals(other.state, state)&&const DeepCollectionEquality().equals(other.events, _events));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(state),const DeepCollectionEquality().hash(_events));
}

@override
String toString() {
    return 'GameTickResult<$TState>(state: $state, events: $events)';
}


}

/// @nodoc
abstract mixin class _$GameTickResultCopyWith<TState,$Res> implements $GameTickResultCopyWith<TState, $Res> {
  factory _$GameTickResultCopyWith(_GameTickResult<TState> value, $Res Function(_GameTickResult<TState>) _then) = __$GameTickResultCopyWithImpl;
@override @useResult
$Res call({
 TState state, List<GameEvent> events
});




}
/// @nodoc
class __$GameTickResultCopyWithImpl<TState,$Res>
    implements _$GameTickResultCopyWith<TState, $Res> {
  __$GameTickResultCopyWithImpl(this._self, this._then);

  final _GameTickResult<TState> _self;
  final $Res Function(_GameTickResult<TState>) _then;

/// Create a copy of GameTickResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = freezed,Object? events = null,}) {
  return _then(_GameTickResult<TState>(
state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as TState,events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<GameEvent>,
  ));
}


}

// dart format on
