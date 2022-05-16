import 'package:flutter/material.dart';

const double kSatispayIconHeight = 40;
const double kSatispayButtonPadding = kSatispayIconHeight / 4;
const double kSatispayButtonFontSize = 22;

class SatispayButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SatispayButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.all(kSatispayButtonPadding)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 249, 76, 67)),
          ),
        ),
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const ShapeDecoration(shape: StadiumBorder()),
        child: TextButton(
          onPressed: onPressed,
          child: Row(
            children: [
              Container(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: StadiumBorder(),
                ),
                child: Image.asset(
                  'assets/images/satispay_icon.png',
                  height: kSatispayIconHeight,
                  package: 'flutter_satispay',
                ),
              ),
              const SizedBox(width: kSatispayButtonPadding),
              const Text.rich(
                TextSpan(
                  text: 'Paga con ',
                  children: [
                    TextSpan(
                      text: 'satispay',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: kSatispayButtonFontSize,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w300,
                  package: 'flutter_satispay',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
