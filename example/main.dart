import 'package:flutter/material.dart';
import 'package:flutter_satispay/flutter_satispay.dart';

void main() {
  Satispay.init(environment: SatispayEnvironment.production);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  Future<String> _createPayment() async {
    // TODO(developer): Fetch payment id from your server

    return 'TODO';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SatispayButton(
          onPressed: () async {
            if (!await Satispay.instance.isAvailable()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Satispay is not available')),
              );

              return;
            }

            final String token = await _createPayment();

            await Satispay.instance.loadPayment(
              token: token,
              callbackUrl: 'your-custom-scheme://satispay/success',
            );
          },
        ),
      ),
    );
  }
}
