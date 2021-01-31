import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_whats_app/src/widgets/global/globalVars.dart'
    as globals;

class AutocompleteTextField extends StatefulWidget {
  String titulo;
  AutoCompleteTextField searchTextField;
  TextEditingController controller = new TextEditingController();

  AutocompleteTextField(
      {Key key, this.titulo, this.searchTextField, this.controller})
      : super(key: key);

  @override
  _AutocompleteTextFieldState createState() => _AutocompleteTextFieldState();
}

class _AutocompleteTextFieldState extends State<AutocompleteTextField> {
  GlobalKey<AutoCompleteTextFieldState> key = new GlobalKey();
  List<String> localizations = [];
  List<String> transportes = [];

  @override
  void initState() {
    super.initState();
    getLocalizaciones();
  }

  void getLocalizaciones() {
    for (var loc in globals.localizaciones) {
      localizations.add(loc['nombre']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchTextField = AutoCompleteTextField(
      key: key,
      clearOnSubmit: false,
      style: new TextStyle(color: Colors.black, fontSize: 16.0),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(Icons.pin_drop),
        contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
        filled: true,
        hintText: widget.titulo,
        hintStyle: TextStyle(color: Colors.black),
      ),
      itemBuilder: (context, item) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              item,
              style: TextStyle(fontSize: 16.0),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
            ),
            Text(
              item,
            )
          ],
        );
      },
      itemFilter: (item, query) {
        return item.toLowerCase().startsWith(query.toLowerCase());
      },
      itemSorter: (a, b) {
        return a.compareTo(b);
      },
      itemSubmitted: (item) {
        widget.searchTextField.textField.controller.text = item;
        globals.loc = widget.searchTextField.textField.controller.text;
      },
      suggestions: localizations,
    );
  }
}