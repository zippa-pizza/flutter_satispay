<img
  src="https://github.com/zippa-pizza/flutter_satispay/raw/main/doc/satispay_logo.svg"
  alt="Satispay"
  height="30">

# Satispay for Flutter

[![pub package](https://img.shields.io/pub/v/flutter_satispay.svg)](https://pub.dev/packages/flutter_satispay)

## Getting started

### Android

In your `AndroidManifest.xml` add these queries:

```xml
<queries>
  <!-- PRODUCTION ENVIRONMENT -->
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="satispay" />
  </intent>
  <!-- STAGING ENVIRONMENT -->
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="satispay-stag" />
  </intent>
</queries>
```

### iOS

In your `Info.plist` add these `LSApplicationQueriesSchemes`

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
  <!-- PRODUCTION ENVIRONMENT -->
  <string>satispay</string>
  <!-- STAGING ENVIRONMENT -->
  <string>satispay-stag</string>
</array>
```

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
