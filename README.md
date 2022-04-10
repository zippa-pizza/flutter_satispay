<img src="docs/satispay_logo.svg" alt="Satispay" height="30">

# Satispay for Flutter

[![pub package](https://img.shields.io/pub/v/flutter_satispay.svg)](https://pub.dev/packages/flutter_satispay)

## Usage

### Initialize the package

```dart
import 'package:flutter_satispay/flutter_satispay.dart';

void main() {
  // You must run this only once
  Satispay.init(environment: SatispayEnvironment.production);

  runApp(MyApp());
}
```

### Check if Satispay is available

```dart
import 'package:flutter_satispay/flutter_satispay.dart';

final bool isAvailable = await Satispay.instance.isAvailable();
```

### Redirect to the Satispay app

```dart
import 'package:flutter_satispay/flutter_satispay.dart';

await Satispay.instance.loadPayment(
  token: 'payment_id',
  callbackUrl: 'callback_url',
);
```

### Display the payment button

```dart
import 'package:flutter_satispay/flutter_satispay.dart';

SatispayButton(
  onPressed: () async {
    // TODO: Check if Satispay is available

    // TODO: Create payment on your server

    // TODO: Redirect the user to the Satispay app
  },
);
```
