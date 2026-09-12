// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'snake_game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SnakeGameState {

 List<Position> get snake; Position get food; Direction get direction; GameStatus get status; int get score; GameDifficulty get difficulty;
/// Create a copy of SnakeGameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnakeGameStateCopyWith<SnakeGameState> get copyWith => _$SnakeGameStateCopyWithImpl<SnakeGameState>(this as SnakeGameState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SnakeGameState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnakeGameState&&const DeepCollectionEquality().equals(other.snake, _this.snake)&&(identical(other.food, _this.food) || other.food == _this.food)&&(identical(other.direction, _this.direction) || other.direction == _this.direction)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.score, _this.score) || other.score == _this.score)&&(identical(other.difficulty, _this.difficulty) || other.difficulty == _this.difficulty));
}


@override
int get hashCode {
  final _this = this as SnakeGameState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.snake),_this.food,_this.direction,_this.status,_this.score,_this.difficulty);
}

@override
String toString() {
  final _this = this as SnakeGameState;
  return 'SnakeGameState(snake: ${_this.snake}, food: ${_this.food}, direction: ${_this.direction}, status: ${_this.status}, score: ${_this.score}, difficulty: ${_this.difficulty})';
}


}

/// @nodoc
abstract mixin class $SnakeGameStateCopyWith<$Res>  {
  factory $SnakeGameStateCopyWith(SnakeGameState value, $Res Function(SnakeGameState) _then) = _$SnakeGameStateCopyWithImpl;
@useResult
$Res call({
 List<Position> snake, Position food, Direction direction, GameStatus status, int score, GameDifficulty difficulty
});


$PositionCopyWith<$Res> get food;

}
/// @nodoc
class _$SnakeGameStateCopyWithImpl<$Res>
    implements $SnakeGameStateCopyWith<$Res> {
  _$SnakeGameStateCopyWithImpl(this._self, this._then);

  final SnakeGameState _self;
  final $Res Function(SnakeGameState) _then;

/// Create a copy of SnakeGameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? snake = null,Object? food = null,Object? direction = null,Object? status = null,Object? score = null,Object? difficulty = null,}) {
  return _then(SnakeGameState(
snake: null == snake ? _self.snake : snake // ignore: cast_nullable_to_non_nullable
as List<Position>,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as Position,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as Direction,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GameStatus,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as GameDifficulty,
  ));
}
/// Create a copy of SnakeGameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PositionCopyWith<$Res> get food {
  
  return $PositionCopyWith<$Res>(_self.food, (value) {
    return _then(_self.copyWith(food: value));
  });
}
}


/// Adds pattern-matching-related methods to [SnakeGameState].
extension SnakeGameStatePatterns on SnakeGameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SnakeGameState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SnakeGameState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SnakeGameState value)  $default,){
final _that = this;
switch (_that) {
case _SnakeGameState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SnakeGameState value)?  $default,){
final _that = this;
switch (_that) {
case _SnakeGameState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Position> snake,  Position food,  Direction direction,  GameStatus status,  int score,  GameDifficulty difficulty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SnakeGameState() when $default != null:
return $default(_that.snake,_that.food,_that.direction,_that.status,_that.score,_that.difficulty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Position> snake,  Position food,  Direction direction,  GameStatus status,  int score,  GameDifficulty difficulty)  $default,) {final _that = this;
switch (_that) {
case _SnakeGameState():
return $default(_that.snake,_that.food,_that.direction,_that.status,_that.score,_that.difficulty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Position> snake,  Position food,  Direction direction,  GameStatus status,  int score,  GameDifficulty difficulty)?  $default,) {final _that = this;
switch (_that) {
case _SnakeGameState() when $default != null:
return $default(_that.snake,_that.food,_that.direction,_that.status,_that.score,_that.difficulty);case _:
  return null;

}
}

}

/// @nodoc


class _SnakeGameState implements SnakeGameState {
  const _SnakeGameState({required  List<Position> snake, required this.food, required this.direction, required this.status, required this.score, required this.difficulty}): _snake = snake;
  

 final  List<Position> _snake;
@override List<Position> get snake {
  if (_snake is EqualUnmodifiableListView) return _snake;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_snake);
}

@override final  Position food;
@override final  Direction direction;
@override final  GameStatus status;
@override final  int score;
@override final  GameDifficulty difficulty;

/// Create a copy of SnakeGameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SnakeGameStateCopyWith<_SnakeGameState> get copyWith => __$SnakeGameStateCopyWithImpl<_SnakeGameState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnakeGameState&&const DeepCollectionEquality().equals(other.snake, _snake)&&(identical(other.food, food) || other.food == food)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.status, status) || other.status == status)&&(identical(other.score, score) || other.score == score)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_snake),food,direction,status,score,difficulty);
}

@override
String toString() {
    return 'SnakeGameState(snake: $snake, food: $food, direction: $direction, status: $status, score: $score, difficulty: $difficulty)';
}


}

/// @nodoc
abstract mixin class _$SnakeGameStateCopyWith<$Res> implements $SnakeGameStateCopyWith<$Res> {
  factory _$SnakeGameStateCopyWith(_SnakeGameState value, $Res Function(_SnakeGameState) _then) = __$SnakeGameStateCopyWithImpl;
@override @useResult
$Res call({
 List<Position> snake, Position food, Direction direction, GameStatus status, int score, GameDifficulty difficulty
});


@override $PositionCopyWith<$Res> get food;

}
/// @nodoc
class __$SnakeGameStateCopyWithImpl<$Res>
    implements _$SnakeGameStateCopyWith<$Res> {
  __$SnakeGameStateCopyWithImpl(this._self, this._then);

  final _SnakeGameState _self;
  final $Res Function(_SnakeGameState) _then;

/// Create a copy of SnakeGameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? snake = null,Object? food = null,Object? direction = null,Object? status = null,Object? score = null,Object? difficulty = null,}) {
  return _then(_SnakeGameState(
snake: null == snake ? _self._snake : snake // ignore: cast_nullable_to_non_nullable
as List<Position>,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as Position,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as Direction,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GameStatus,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as GameDifficulty,
  ));
}

/// Create a copy of SnakeGameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PositionCopyWith<$Res> get food {
  
  return $PositionCopyWith<$Res>(_self.food, (value) {
    return _then(_self.copyWith(food: value));
  });
}
}

// dart format on
