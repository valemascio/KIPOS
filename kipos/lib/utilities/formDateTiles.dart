import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///Class that implement a custom-made [ListTile] to manage textboxes containing dates in a [Form].
///You must provide a label that is shown as helper, the date to show, an icon, a callback to define the behaviour of the field when it is tapped, and a [DateFormat].
///The [FormDateTile] content is always valid and it should be guaranteed via a DatePicker.
class FormDateTile extends ListTile {
  final labelText;
  final date;
  final icon;
  final onPressed;
  final DateFormat dateFormat;

  FormDateTile(
      {this.icon,
      this.labelText,
      this.date,
      required this.dateFormat,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).accentColor),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1),
                top: BorderSide(width: 1),
                left: BorderSide(width: 1),
                right: BorderSide(width: 1),
              ),
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              width: screenSize.width / 1.5,
              child: FlatButton(
                child: Text(dateFormat.format(date)),
                onPressed: onPressed,
              ),
            ),
          )
        ],
      ),
    );
  } // build
} // FormDateTile