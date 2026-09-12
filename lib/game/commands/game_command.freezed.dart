// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameCommand {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GameCommand);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'GameCommand()';
}


}

/// @nodoc
class $GameCommandCopyWith<$Res>  {
$GameCommandCopyWith(GameCommand _, $Res Function(GameCommand) __);
}


/// Adds pattern-matching-related methods to [GameCommand].
extension GameCommandPatterns on GameCommand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( StartGame value)?  start,TResult Function( PauseGame value)?  pause,TResult Function( ResetGame value)?  reset,TResult Function( ChangeDirection value)?  changeDirection,required TResult orElse(),}){
final _that = this;
switch (_that) {
case StartGame() when start != null:
return start(_that);case PauseGame() when pause != null:
return pause(_that);case ResetGame() when reset != null:
return reset(_that);case ChangeDirection() when changeDirection != null:
return changeDirection(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( StartGame value)  start,required TResult Function( PauseGame value)  pause,required TResult Function( ResetGame value)  reset,required TResult Function( ChangeDirection value)  changeDirection,}){
final _that = this;
switch (_that) {
case StartGame():
return start(_that);case PauseGame():
return pause(_that);case ResetGame():
return reset(_that);case ChangeDirection():
return changeDirection(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( StartGame value)?  start,TResult? Function( PauseGame value)?  pause,TResult? Function( ResetGame value)?  reset,TResult? Function( ChangeDirection value)?  changeDirection,}){
final _that = this;
switch (_that) {
case StartGame() when start != null:
return start(_that);case PauseGame() when pause != null:
return pause(_that);case ResetGame() when reset != null:
return reset(_that);case ChangeDirection() when changeDirection != null:
return changeDirection(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  start,TResult Function()?  pause,TResult Function()?  reset,TResult Function( Direction direction)?  changeDirection,required TResult orElse(),}) {final _that = this;
switch (_that) {
case StartGame() when start != null:
return start();case PauseGame() when pause != null:
return pause();case ResetGame() when reset != null:
return reset();case ChangeDirection() when changeDirection != null:
return changeDirection(_that.direction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  start,required TResult Function()  pause,required TResult Function()  reset,required TResult Function( Direction direction)  changeDirection,}) {final _that = this;
switch (_that) {
case StartGame():
return start();case PauseGame():
return pause();case ResetGame():
return reset();case ChangeDirection():
return changeDirection(_that.direction);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  start,TResult? Function()?  pause,TResult? Function()?  reset,TResult? Function( Direction direction)?  changeDirection,}) {final _that = this;
switch (_that) {
case StartGame() when start != null:
return start();case PauseGame() when pause != null:
return pause();case ResetGame() when reset != null:
return reset();case ChangeDirection() when changeDirection != null:
return changeDirection(_that.direction);case _:
  return null;

}
}

}

/// @nodoc


class StartGame implements GameCommand {
  const StartGame();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StartGame);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'GameCommand.start()';
}


}




/// @nodoc


class PauseGame implements GameCommand {
  const PauseGame();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PauseGame);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'GameCommand.pause()';
}


}




/// @nodoc


class ResetGame implements GameCommand {
  const ResetGame();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetGame);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'GameCommand.reset()';
}


}




/// @nodoc


class ChangeDirection implements GameCommand {
  const ChangeDirection(this.direction);
  

 final  Direction direction;

/// Create a copy of GameCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeDirectionCopyWith<ChangeDirection> get copyWith => _$ChangeDirectionCopyWithImpl<ChangeDirection>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeDirection&&(identical(other.direction, direction) || other.direction == direction));
}


@override
int get hashCode {
    return Object.hash(runtimeType,direction);
}

@override
String toString() {
    return 'GameCommand.changeDirection(direction: $direction)';
}


}

/// @nodoc
abstract mixin class $ChangeDirectionCopyWith<$Res> implements $GameCommandCopyWith<$Res> {
  factory $ChangeDirectionCopyWith(ChangeDirection value, $Res Function(ChangeDirection) _then) = _$ChangeDirectionCopyWithImpl;
@useResult
$Res call({
 Direction direction
});




}
/// @nodoc
class _$ChangeDirectionCopyWithImpl<$Res>
    implements $ChangeDirectionCopyWith<$Res> {
  _$ChangeDirectionCopyWithImpl(this._self, this._then);

  final ChangeDirection _self;
  final $Res Function(ChangeDirection) _then;

/// Create a copy of GameCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? direction = null,}) {
  return _then(ChangeDirection(
null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as Direction,
  ));
}


}

// dart format on
