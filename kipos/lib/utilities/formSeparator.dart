import 'package:flutter/material.dart';

class FormSeparator extends StatelessWidget {
  final label;

  FormSeparator({this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 2,
                width: 75,
                child: Container(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Expanded(
                  child: Center(
                      child: Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ))),
              SizedBox(
                height: 2,
                width: 75,
                child: Container(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  } // build

} // FormSeparator