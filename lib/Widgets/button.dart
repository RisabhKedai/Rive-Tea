import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  Function lgb;
  Button(this.lgb, {Key? key}) : super(key: key);
  // Button(this.lgb);
  @override
  _ButtonState createState() => _ButtonState(lgb);
}

class _ButtonState extends State<Button> {
  Function lgb;
  _ButtonState(this.lgb);
  @override
  Widget build(BuildContext context) {
    var container = SizedBox(
      width: 200.0,
      child: ElevatedButton(
        onPressed: () => lgb(),
        child: const Text(
          "Sign-In",
          style: TextStyle(
            // color: ,
            fontSize: 20.0,
            //fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.teal;
              }
              return Colors.black;
            },
          ),
          shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                  side: const BorderSide(
                    width: 2,
                    color: Colors.teal,
                  ),
                );
              } else {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                  side: const BorderSide(
                    width: 2,
                    color: Colors.black,
                  ),
                );
              }
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black;
              }
              return Colors.teal;
            },
          ),
        ),
      ),
    );
    return container;
  }
}
