import 'package:flutter/widgets.dart';

///
/// Controller for Count down
///
class CountdownController {
  /// Called when called `pause` method
  VoidCallback? onPause;

  /// Called when called `resume` method
  VoidCallback? onResume;

  /// Called when restarting the timer
  VoidCallback? onRestart;

  /// Called when reset timer values
  VoidCallback? onReset;

  /// Called when timer is staring
  VoidCallback? onStart;

  VoidCallback? currentState;

  bool curentStateIsStart = false;
  ///
  /// Checks if the timer is running and enables you to take actions
  /// according to that. if the timer is still active,
  ///
  /// `isCompleted` returns `false` and vice versa.
  ///
  /// for example:
  ///
  /// ``` dart
  ///   _controller.isCompleted ? _controller.restart() : _controller.pause();
  /// ```
  ///
  bool? isCompleted;

  /// if timer auto start.
  final bool autoStart;

  ///
  /// Constructor
  ///
  CountdownController({this.autoStart = false});

  ///
  /// Run timer
  ///
  ///
  /// Run timer
  ///
  start() {
    if (this.onStart != null) {
      curentStateIsStart = true;
      this.onStart!();
      currentState = onStart;
    }
  }

  /// Set onStart callback
  setOnStart(VoidCallback onStart) {
    this.onStart = onStart;
    if (curentStateIsStart) currentState = onStart;
  }

  ///
  /// Set timer in pause
  ///
  pause() {
    if (this.onPause != null) {
      curentStateIsStart = false;
      this.onPause!();
      currentState = onPause;
    }
  }

  /// Set onPause callback
  setOnPause(VoidCallback onPause) {
    this.onPause = onPause;
    if (!curentStateIsStart) currentState = onPause;
  }
  ///
  /// Resume from pause
  ///
  resume() {
    if (this.onResume != null) {
      this.onResume!();
    }
  }

  /// Set onResume callback
  setOnResume(VoidCallback onResume) {
    this.onResume = onResume;
  }

  ///
  /// Restart timer from cold
  ///
  restart() {
    if (this.onRestart != null) {
      this.onRestart!();
    }
  }

  ///
  /// Reset timer values
  ///
  reset() {
    if (this.onReset!= null) {
      this.onReset!();
      if(currentState != null)
      {
        this.currentState!();
      }
    }
  }


  /// set onRestart callback
  setOnRestart(VoidCallback onRestart) {
    this.onRestart = onRestart;
  }

  /// set onReset callback
  setOnReset(VoidCallback onReset) {
    this.onReset = onReset;
  }
}
