import 'package:flutter/material.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:proyecto_final_whats_app/src/pages/home_page.dart';


void fingerprintAuthentication(context) async {
  final LocalAuthentication auth = LocalAuthentication();
  bool canCheckBiometrics = false;
  try {
    canCheckBiometrics = await auth.canCheckBiometrics;
  } catch (e) {
    print("error biome trics $e");
  }

  print("Hay biometria?: $canCheckBiometrics");

  List<BiometricType> availableBiometrics;
  try {
    availableBiometrics = await auth.getAvailableBiometrics();
  } catch (e) {
    print("error_1 $e");
  }

  print("Metodos de biometria:");
  if (availableBiometrics.isNotEmpty) {
    availableBiometrics.forEach((ab) {
      print("\tTecnologia: $ab");
    });
  } else {
    print("No se han encontrado metodos biometricos");
  }

  bool authenticated = false;
  try {
    authenticated = await auth.authenticateWithBiometrics(
        localizedReason: 'Haz uso del sensor biometrico para hacer login',
        useErrorDialogs: true,
        stickyAuth: false,
        androidAuthStrings:
            AndroidAuthMessages(signInTitle: "Whats (M)app Login"));
  } catch (e) {
    print("error_2: $e");
  }

  print("autenticado?: $authenticated");

  if (authenticated) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }
}
