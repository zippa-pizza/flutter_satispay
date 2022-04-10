import 'package:flutter_satispay/flutter_satispay.dart';
import 'package:url_launcher/url_launcher.dart';

class Satispay {
  /// The global [Satispay] instance
  static late final Satispay instance;

  /// The environment to use.
  final SatispayEnvironment environment;

  Satispay._({required this.environment});

  /// Initialize the [Satispay] instance.
  ///
  /// This **must** be called before using any other method.
  static void init({required SatispayEnvironment environment}) {
    instance = Satispay._(environment: environment);
  }

  String get _satispayScheme {
    if (environment == SatispayEnvironment.sandbox) {
      return 'satispay-stag';
    }

    return 'satispay';
  }

  Future<bool> isAvailable() => canLaunch('$_satispayScheme://');

  /// Launch the Satispay app to confirm the payment.
  ///
  /// The [token] is the payment id returned by the Satispay API, while the
  /// [callbackUrl] is the URL that will be called after the payment has been
  /// confirmed.
  Future<void> loadPayment({
    required String token,
    required String callbackUrl,
  }) =>
      launch(
          '$_satispayScheme://external/generic/charge?token=$token&callback_url=$callbackUrl');
}
