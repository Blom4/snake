// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GameEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'GameEvent()';
}


}

/// @nodoc
class $GameEventCopyWith<$Res>  {
$GameEventCopyWith(GameEvent _, $Res Function(GameEvent) __);
}


/// Adds pattern-matching-related methods to [GameEvent].
extension GameEventPatterns on GameEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FoodEaten value)?  foodEaten,TResult Function( LevelChanged value)?  levelChanged,TResult Function( GameOver value)?  gameOver,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FoodEaten() when foodEaten != null:
return foodEaten(_that);case LevelChanged() when levelChanged != null:
return levelChanged(_that);case GameOver() when gameOver != null:
return gameOver(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FoodEaten value)  foodEaten,required TResult Function( LevelChanged value)  levelChanged,required TResult Function( GameOver value)  gameOver,}){
final _that = this;
switch (_that) {
case FoodEaten():
return foodEaten(_that);case LevelChanged():
return levelChanged(_that);case GameOver():
return gameOver(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FoodEaten value)?  foodEaten,TResult? Function( LevelChanged value)?  levelChanged,TResult? Function( GameOver value)?  gameOver,}){
final _that = this;
switch (_that) {
case FoodEaten() when foodEaten != null:
return foodEaten(_that);case LevelChanged() when levelChanged != null:
return levelChanged(_that);case GameOver() when gameOver != null:
return gameOver(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int score)?  foodEaten,TResult Function( int level)?  levelChanged,TResult Function()?  gameOver,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FoodEaten() when foodEaten != null:
return foodEaten(_that.score);case LevelChanged() when levelChanged != null:
return levelChanged(_that.level);case GameOver() when gameOver != null:
return gameOver();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int score)  foodEaten,required TResult Function( int level)  levelChanged,required TResult Function()  gameOver,}) {final _that = this;
switch (_that) {
case FoodEaten():
return foodEaten(_that.score);case LevelChanged():
return levelChanged(_that.level);case GameOver():
return gameOver();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int score)?  foodEaten,TResult? Function( int level)?  levelChanged,TResult? Function()?  gameOver,}) {final _that = this;
switch (_that) {
case FoodEaten() when foodEaten != null:
return foodEaten(_that.score);case LevelChanged() when levelChanged != null:
return levelChanged(_that.level);case GameOver() when gameOver != null:
return gameOver();case _:
  return null;

}
}

}

/// @nodoc


class FoodEaten implements GameEvent {
  const FoodEaten({required this.score});
  

 final  int score;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodEatenCopyWith<FoodEaten> get copyWith => _$FoodEatenCopyWithImpl<FoodEaten>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodEaten&&(identical(other.score, score) || other.score == score));
}


@override
int get hashCode {
    return Object.hash(runtimeType,score);
}

@override
String toString() {
    return 'GameEvent.foodEaten(score: $score)';
}


}

/// @nodoc
abstract mixin class $FoodEatenCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory $FoodEatenCopyWith(FoodEaten value, $Res Function(FoodEaten) _then) = _$FoodEatenCopyWithImpl;
@useResult
$Res call({
 int score
});




}
/// @nodoc
class _$FoodEatenCopyWithImpl<$Res>
    implements $FoodEatenCopyWith<$Res> {
  _$FoodEatenCopyWithImpl(this._self, this._then);

  final FoodEaten _self;
  final $Res Function(FoodEaten) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? score = null,}) {
  return _then(FoodEaten(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class LevelChanged implements GameEvent {
  const LevelChanged({required this.level});
  

 final  int level;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LevelChangedCopyWith<LevelChanged> get copyWith => _$LevelChangedCopyWithImpl<LevelChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LevelChanged&&(identical(other.level, level) || other.level == level));
}


@override
int get hashCode {
    return Object.hash(runtimeType,level);
}

@override
String toString() {
    return 'GameEvent.levelChanged(level: $level)';
}


}

/// @nodoc
abstract mixin class $LevelChangedCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory $LevelChangedCopyWith(LevelChanged value, $Res Function(LevelChanged) _then) = _$LevelChangedCopyWithImpl;
@useResult
$Res call({
 int level
});




}
/// @nodoc
class _$LevelChangedCopyWithImpl<$Res>
    implements $LevelChangedCopyWith<$Res> {
  _$LevelChangedCopyWithImpl(this._self, this._then);

  final LevelChanged _self;
  final $Res Function(LevelChanged) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? level = null,}) {
  return _then(LevelChanged(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GameOver implements GameEvent {
  const GameOver();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GameOver);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'GameEvent.gameOver()';
}


}




// dart format on
