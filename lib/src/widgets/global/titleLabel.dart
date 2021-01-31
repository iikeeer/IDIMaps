import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleLabel extends StatefulWidget {
  TitleLabel({Key key}) : super(key: key);

  @override
  _TitleLabelState createState() => _TitleLabelState();
}

class _TitleLabelState extends State<TitleLabel> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Whats (M)app',
        style: GoogleFonts.portLligatSans(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
