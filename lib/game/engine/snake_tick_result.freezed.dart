// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'snake_tick_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SnakeTickResult {

 SnakeGameState get state; List<GameEvent> get events;
/// Create a copy of SnakeTickResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnakeTickResultCopyWith<SnakeTickResult> get copyWith => _$SnakeTickResultCopyWithImpl<SnakeTickResult>(this as SnakeTickResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SnakeTickResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnakeTickResult&&(identical(other.state, _this.state) || other.state == _this.state)&&const DeepCollectionEquality().equals(other.events, _this.events));
}


@override
int get hashCode {
  final _this = this as SnakeTickResult;
  return Object.hash(runtimeType,_this.state,const DeepCollectionEquality().hash(_this.events));
}

@override
String toString() {
  final _this = this as SnakeTickResult;
  return 'SnakeTickResult(state: ${_this.state}, events: ${_this.events})';
}


}

/// @nodoc
abstract mixin class $SnakeTickResultCopyWith<$Res>  {
  factory $SnakeTickResultCopyWith(SnakeTickResult value, $Res Function(SnakeTickResult) _then) = _$SnakeTickResultCopyWithImpl;
@useResult
$Res call({
 SnakeGameState state, List<GameEvent> events
});


$SnakeGameStateCopyWith<$Res> get state;

}
/// @nodoc
class _$SnakeTickResultCopyWithImpl<$Res>
    implements $SnakeTickResultCopyWith<$Res> {
  _$SnakeTickResultCopyWithImpl(this._self, this._then);

  final SnakeTickResult _self;
  final $Res Function(SnakeTickResult) _then;

/// Create a copy of SnakeTickResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? events = null,}) {
  return _then(SnakeTickResult(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as SnakeGameState,events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<GameEvent>,
  ));
}
/// Create a copy of SnakeTickResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnakeGameStateCopyWith<$Res> get state {
  
  return $SnakeGameStateCopyWith<$Res>(_self.state, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}


/// Adds pattern-matching-related methods to [SnakeTickResult].
extension SnakeTickResultPatterns on SnakeTickResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SnakeTickResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SnakeTickResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SnakeTickResult value)  $default,){
final _that = this;
switch (_that) {
case _SnakeTickResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SnakeTickResult value)?  $default,){
final _that = this;
switch (_that) {
case _SnakeTickResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SnakeGameState state,  List<GameEvent> events)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SnakeTickResult() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SnakeGameState state,  List<GameEvent> events)  $default,) {final _that = this;
switch (_that) {
case _SnakeTickResult():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SnakeGameState state,  List<GameEvent> events)?  $default,) {final _that = this;
switch (_that) {
case _SnakeTickResult() when $default != null:
return $default(_that.state,_that.events);case _:
  return null;

}
}

}

/// @nodoc


class _SnakeTickResult implements SnakeTickResult {
  const _SnakeTickResult({required this.state, required  List<GameEvent> events}): _events = events;
  

@override final  SnakeGameState state;
 final  List<GameEvent> _events;
@override List<GameEvent> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}


/// Create a copy of SnakeTickResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SnakeTickResultCopyWith<_SnakeTickResult> get copyWith => __$SnakeTickResultCopyWithImpl<_SnakeTickResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnakeTickResult&&(identical(other.state, state) || other.state == state)&&const DeepCollectionEquality().equals(other.events, _events));
}


@override
int get hashCode {
    return Object.hash(runtimeType,state,const DeepCollectionEquality().hash(_events));
}

@override
String toString() {
    return 'SnakeTickResult(state: $state, events: $events)';
}


}

/// @nodoc
abstract mixin class _$SnakeTickResultCopyWith<$Res> implements $SnakeTickResultCopyWith<$Res> {
  factory _$SnakeTickResultCopyWith(_SnakeTickResult value, $Res Function(_SnakeTickResult) _then) = __$SnakeTickResultCopyWithImpl;
@override @useResult
$Res call({
 SnakeGameState state, List<GameEvent> events
});


@override $SnakeGameStateCopyWith<$Res> get state;

}
/// @nodoc
class __$SnakeTickResultCopyWithImpl<$Res>
    implements _$SnakeTickResultCopyWith<$Res> {
  __$SnakeTickResultCopyWithImpl(this._self, this._then);

  final _SnakeTickResult _self;
  final $Res Function(_SnakeTickResult) _then;

/// Create a copy of SnakeTickResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? events = null,}) {
  return _then(_SnakeTickResult(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as SnakeGameState,events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<GameEvent>,
  ));
}

/// Create a copy of SnakeTickResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnakeGameStateCopyWith<$Res> get state {
  
  return $SnakeGameStateCopyWith<$Res>(_self.state, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}

// dart format on
