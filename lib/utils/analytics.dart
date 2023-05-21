import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final _analytics = FirebaseAnalytics.instance;
  AnalyticsService._();
  static final _service = AnalyticsService._();
  factory AnalyticsService() => _service;
  static FirebaseAnalytics get instance => _service._analytics;
  static FirebaseAnalyticsObserver get observer => FirebaseAnalyticsObserver(analytics: _service._analytics);
}