import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Global BLoC observer for logging all bloc events, state changes, and errors.
/// Set once in [main] via [Bloc.observer].
class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(BlocBase<dynamic> bloc, Object? event) {
    if (kDebugMode) {
      debugPrint('BlocEvent(${bloc.runtimeType}): $event');
    }
    if (bloc is Bloc<dynamic, dynamic>) {
      super.onEvent(bloc, event);
    }
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    if (kDebugMode) {
      debugPrint(
        'BlocChange(${bloc.runtimeType}): ${change.currentState} -> ${change.nextState}',
      );
    }
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      debugPrint('BlocError(${bloc.runtimeType}): $error\n$stackTrace');
    }
    super.onError(bloc, error, stackTrace);
  }
}
