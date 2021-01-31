import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_whats_app/src/security/fingerprint.dart';

class FingerPrint extends StatefulWidget {
  FingerPrint({Key key}) : super(key: key);

  @override
  _FingerPrintState createState() => _FingerPrintState();
}

class _FingerPrintState extends State<FingerPrint> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 20),
      child: Column(
        children: <Widget>[
          AnimatedButton(
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.height / 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.fingerprint,
                    color: Colors.white,
                    size: 60,
                  )
                ],
              ),
            ),
            onPressed: () {
              fingerprintAuthentication(context);
            },
            shadowDegree: ShadowDegree.dark,
            color: Color.fromRGBO(49, 142, 247, 1),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Touch ID',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
