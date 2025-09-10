import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// TimeProvider:
/// Ye ek custom InheritedWidget hai jo ek String [title] aur ek [onTap] callback
/// sabhi descendents (children) widgets ko provide karta hai.
///
/// InheritedWidget ka fayda:
/// 1. Data ko widget tree me ek jagah provide karna.
/// 2. Descendent widgets easily data access kar sakte hain
///    bina har widget ke constructor me manually pass kiye.
/// 3. Jab data change hota hai, sirf woh widgets rebuild hote hain jo
///    InheritedWidget se depend kar rahe hain.
/// ---------------------------------------------------------------------------
class TimeProvider extends InheritedWidget {
  final String title;       // Current title (jaise time string)
  final String name;
  final VoidCallback onTap; // Callback function jo title ko update karega

  const TimeProvider({
    super.key,
    required this.title,
    required this.name,
    required this.onTap,
    required super.child,
  });

  /// of(context):
  /// Is method ke through koi bhi child widget TimeProvider ko access kar sakta hai.
  /// Example:
  /// final provider = TimeProvider.of(context);
  static TimeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TimeProvider>();
  }

  /// updateShouldNotify:
  /// Flutter ko batata hai ki kab widgets ko dobara rebuild karna chahiye.
  /// Yahan sirf tab rebuild hoga jab [title] change hoga.
  @override
  bool updateShouldNotify(TimeProvider oldWidget) {
    return oldWidget.title != title;
  }
}
